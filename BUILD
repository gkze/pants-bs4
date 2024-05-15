python_requirements(
    name="reqs0",
    source="pyproject.toml",
    overrides={"playwright-stealth": {"dependencies": ["//:reqs0#setuptools"]}},
)

python_sources(
    name="root",
)

pex_binary(
    name="cli",
    entry_point="main.py"
)
