# Project Chimera Dockerfile
FROM python:3.12-slim

# COPY uv binaries from official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set working directory
WORKDIR /app

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1
# Copy settings (optional, but good for local dev)
ENV UV_LINK_MODE=copy

# Place executable folder on PATH
ENV PATH="/app/.venv/bin:$PATH"

# Copy dependency files
COPY pyproject.toml .
# Note: If uv.lock existed, we would COPY it here.
# Since it doesn't, uv sync will create it in the image.

# Install dependencies (uv sync creates a virtualenv in /app/.venv by default)
RUN uv sync --no-dev --no-install-project

# Copy the rest of the application
COPY . .

# Final sync to install the project itself if it's a package
RUN uv sync --no-dev

# Default command
CMD ["uv", "run", "pytest"]
