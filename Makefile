.PHONY: help setup

help:
	@echo "Available targets:"
	@echo "  setup   Install the pre-commit hooks for this repository"

setup:
	@command -v pre-commit >/dev/null 2>&1 || pip install --user pre-commit
	pre-commit install
