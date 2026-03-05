.PHONY: all venv docs ruff test build publish-testpypi publish-pypi

all: venv ruff test docs

venv:
	uv sync

docs:
	uv run pdoc -o ./docs --docformat google --favicon assets/msgspec-settings-logo.svg --logo assets/msgspec-settings-logo.svg --search -t ./docs --show-source msgspec_settings

ruff:
	uv run ruff format .
	uv run ruff check --fix .

test:
	uv run pytest

build:
	uv build --clear --no-sources

publish-testpypi: build
	uv publish --index testpypi

publish-pypi: build
	uv publish
