# Project Chimera – OpenClaw Integration

## 1. Overview and Purpose
**OpenClaw** is the conceptual framework for **social network integration and coordination**. For this challenge repository, it is strictly implemented as a **test harness and mock layer**, not a functional simulator or live service.

Its purpose is to provide deterministic inputs (trends, mentions) and capture outputs (posts, replies) to validate agent behavior without external dependencies.

## 2. Scope for Challenge Repo

### In Scope (Mocks & Contracts)
-   **Skill Interfaces**: Defining the JSON contracts for social actions (as seen in `specs/technical.md`).
-   **Test Fixtures**: Python fixtures that simulate social platform responses (e.g., `mock_twitter_api`, `mock_news_feed`).
-   **Action Spies**: Mechanisms to assert that an agent *attempted* to publish content or read data.

### Out of Scope (deferred to Production)
-   **Live API Connectivity**: No real HTTP calls to Twitter/X, Farcaster, or Lens.
-   **Complex Simulation**: No internal ledger, user graph, or propagation algorithms.
-   **Commerce/Wallet Logic**: No on-chain transaction simulation or mock blockchain state.

## 3. Integration Strategy
1.  **Dependency Injection**: Agents receive "Social Clients" as dependencies, allowing tests to inject mocks.
2.  **Deterministic Testing**: All "feeds" and "responses" are hardcoded in test data, ensuring tests are reproducible and flaky-free.
3.  **contract-First**: Any new social capability must first be defined in `specs/technical.md` before being mocked in OpenClaw.

## 4. Verification
-   **Tests**: Agents verify they can parse OpenClaw mock data and produce valid API calls.
-   **CI**: The CI pipeline runs these tests in isolation, proving the system logic holds without the real world.
