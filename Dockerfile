# Stage 1: Builder
FROM python:3.12-slim AS builder

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set environment variables for uv
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# Copy project files
WORKDIR /app
COPY pyproject.toml uv.lock ./

# Sync dependencies
RUN uv sync --frozen --no-install-project --no-dev

# Stage 2: Runtime
FROM python:3.12-slim AS runtime

# Copy .venv and project files from builder
WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY . ./

# Set PATH to include .venv
ENV PATH="/app/.venv/bin:$PATH"

# Default command
ENTRYPOINT ["pytest"]