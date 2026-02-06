.PHONY: setup test container-test spec-check

setup:
	uv sync

test:
	uv run pytest

container-test:
	docker build -t chimera-governor .
	docker run --rm chimera-governor

spec-check:
	@echo "Checking specs directory..."
	@if [ -d specs ] && \
	   [ -f specs/_meta.md ] && \
	   [ -f specs/functional.md ] && \
	   [ -f specs/technical.md ] && \
	   [ -f specs/openclaw_integration.md ]; then \
		echo "All required spec files are present."; \
	else \
		echo "Error: Missing required spec files."; \
		exit 1; \
	fi