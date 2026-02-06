# Project Chimera Makefile

.PHONY: setup test spec-check docker-test

setup:
	@echo "Installing dependencies with uv..."
	uv sync

test:
	@echo "Running tests..."
	uv run pytest tests/

spec-check:
	@echo "Spec check placeholder"

docker-test:
	@echo "Running tests inside Docker..."
	docker build -t chimera-test .
	docker run --rm chimera-test
