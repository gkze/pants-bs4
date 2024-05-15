{
  description = "pants bs4 minimal repro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fp.url = "github:hercules-ci/flake-parts";
    naersk.url = "github:nix-community/naersk";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.fp.lib.mkFlake { inherit inputs; } {
    systems = inputs.nixpkgs.lib.systems.flakeExposed;

    perSystem = { system, config, pkgs, lib, ... }: {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.devshell.overlays.default ];
      };

      devShells.default = pkgs.devshell.mkShell {
        env = [ ];
        packages = with pkgs; [ python310 ];
      };
    };
  };
}
