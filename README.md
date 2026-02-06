# Project Chimera 🚀

Project Chimera is a **spec-driven, test-first blueprint** for an autonomous influencer system. It serves as a foundation for defining how AI agents perceive, reason, and act in a controlled, verifiable environment.

## 1. High-Level Purpose & Scope

The primary goal of Project Chimera is to establish architectural constraints, interfaces, and testing harnesses for AI agents. 

> [!NOTE]
> This repository provides **contracts and test harnesses** for the core agent roles (**Trend Fetcher**, **Content Generator**, **Engagement Manager**). Full implementations are not yet present, as this serves as a baseline for development.

### In Scope
*   **Standardized Layout**: A consistent structure for specs, skills, and tests.
*   **Behavioral Specs**: Strict definitions of agent behavior in `specs/*.md`.
*   **Skill Interfaces**: JSON-level interaction protocols in `skills/`.
*   **Test-First Foundation**: A comprehensive suite of failing tests that define success.

---

## 2. Directory Overview

| Directory / File | Purpose |
| :--- | :--- |
| `specs/` | The single source of truth for all requirements and API contracts. |
| `skills/` | Modular capabilities (the "Hands" of the agents) defined by JSON schemas. |
| `tests/` | Automated test suite verifying compliance with specifications. |
| `.github/` | CI/CD pipeline configurations (GitHub Actions). |
| `.cursor/rules` | AI governance rules for coding assistants. |

---

## 3. Build & Test Instructions (using `uv`)

This project uses [uv](https://github.com/astral-sh/uv) for extremely fast Python package and project management.

### Prerequisites
1.  **Install `uv`**: Follow the instructions at [https://astral.sh/uv](https://astral.sh/uv).
2.  **Install project dependencies**:
    ```bash
    make setup
    ```

---

## 4. Running Tests & Makefile Targets

We use a `Makefile` to simplify common development tasks.

*   **`make setup`**: Installs all required dependencies using `uv sync`.
*   **`make test`**: Runs the local test suite using `pytest`.
*   **`make docker-test`**: Builds a Docker image and runs tests inside a container to ensure environment parity.

---

## 5. Working with AI Assistants (Governance)

If you are using an AI coding assistant (like Cursor, Windsurf, or Copilot), Project Chimera includes strict governance rules located in [`.cursor/rules`](.cursor/rules).

### How to use these rules:
1.  **Strict Compliance**: The AI is instructed to always read `specs/` before suggesting code.
2.  **Test-First**: The AI will not propose code without a corresponding failing test.
3.  **No Over-Engineering**: The rules prevent the AI from adding unnecessary complexity unless explicitly required by a spec.

> [!IMPORTANT]
> Always point your AI assistant to the `.cursor/rules` file or ensure it has "Project Rules" enabled to maintain the architectural integrity of the project.
