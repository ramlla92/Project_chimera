# Project Chimera – Meta Specifications

## 1. Overview and Business Objective
**Project Chimera** is a blueprint and testing ground for an autonomous influencer system. This repository serves as the **spec-driven, test-first foundation** for defining how AI agents perceive, reason, and act.

The primary objective is to **establish architectural constraints, interfaces, and testing harnesses**, not to deploy a production system. It defines the "physics" of the agent world before any agent is allowed to run.

## 2. Scope of Implementation

### In Scope
-   **Repository Structure**: Standardized layout (`specs/`, `skills/`, `tests/`, `src/`, `.github/`, `docs/`).
-   **Specifications**: Strict behavioral definitions via `specs/*.md`.
-   **Conceptual Agent Roles**: **Trend Fetcher**, **Content Generator**, **Engagement Manager**, and **Governor**.
-   **Data & API Schemas**: JSON-level definitions for interaction protocols.
-   **Skill Interfaces**: Definitions of runtime tools (inputs/outputs) without full implementation.
-   **Test Harness**: Comprehensive suite of failing tests.
-   **CI/CD Pipeline**: Docker and GitHub Actions configuration.

### Out of Scope
-   **Full Swarm Orchestration**: Production-grade message passing or Redis loops.
-   **Detailed Integrations**: Complex MCP wrappers or live connections.
-   **Production Deployment**: Kubernetes or cloud infrastructure.
-   **Real-World Action**: Actual social posting or on-chain transactions.

## 3. Key Constraints
1.  **Spec-First**: Code follows specs; tests follow specs; implementation follows tests.
2.  **Test-First**: No code without a failing test.
3.  **Agent/Skill Separation**: Agents reason (Brain); Skills execute (Hands).
4.  **Governance**: CI verifies policy compliance for all actions.

## 4. High-Level System Context
*   **Agents**: Logical units defined by conceptual roles and their tests.
*   **Orchestrator**: Developer/CI instantiating agents against specs.
*   **Specs**: The single source of truth for all requirements.
*   **Skills**: Modular capabilities defined by JSON schemas (mocked).
*   **Tests/CI**: The enforcement engine validating agent behavior.
