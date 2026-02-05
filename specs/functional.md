# Project Chimera – Functional Specifications

## 1. Trend Fetcher Agent
**Role**: Identify and prioritize relevant topics via skill interfaces.

### Story 1.1: Monitor External Sources
**As a** Trend Fetcher,
**I want to** poll configured data sources via the `fetch_news` skill,
**So that** I can identify potential topics for content creation.

*   **AC 1**: Agent emits valid calls to the `fetch_news` skill interface.
*   **AC 2**: Agent ingests raw data items into a structured `ObservedTrend` list.
*   **AC 3**: System gracefully handles skill timeout or failure responses.

### Story 1.2: Score and Filter Trends
**As a** Trend Fetcher,
**I want to** score observed trends against the agent's interests and safety rules,
**So that** only relevant and safe topics are promoted.

*   **AC 1**: Each `ObservedTrend` is assigned a `relevance_score` based on persona alignment.
*   **AC 2**: Items below a configurable threshold are discarded.
*   **AC 3**: Items matching "Exclude" keywords are filtered out.

### Story 1.3: Deduplicate Trends
**As a** Trend Fetcher,
**I want to** identify if a similar trend has been processed recently,
**So that** I do not spam the Planner with duplicate variations.

*   **AC 1**: Incoming items are compared against a cache of recently processed trends.
*   **AC 2**: Trends determined to be semantically identical are flagged as duplicates.

## 2. Content Generator Agent
**Role**: Create content drafts via generation skills.

### Story 2.1: Generate Post Drafts
**As a** Content Generator,
**I want to** transform a `SelectedTrend` into a `ContentDraft`,
**So that** the content aligns with the specific platform format.

*   **AC 1**: Agent receives a Task containing the trend and target platform.
*   **AC 2**: Output `ContentDraft` adheres to platform constraints (length, format).
*   **AC 3**: Agent requests media generation if the format supports it.

### Story 2.2: Enforce Persona Alignment
**As a** Content Generator,
**I want to** inject the agent's persona definition into the generation context,
**So that** the output tone and voice remain consistent.

*   **AC 1**: Generated text reflects specific voice traits from the persona configuration.
*   **AC 2**: Agent avoids authorized phrases or topics listed in the persona's prohibitions.

### Story 2.3: Request Media Generation
**As a** Content Generator,
**I want to** call the `generate_image` skill with a specific prompt,
**So that** visual assets are created to accompany the text.

*   **AC 1**: Agent emits a valid tool call to the `generate_image` skill interface.
*   **AC 2**: The tool call includes style parameters specified in the persona configuration.

## 3. Engagement Manager Agent
**Role**: Handle interactions via engagement skills.

### Story 3.1: Detect and Classify Mentions
**As an** Engagement Manager,
**I want to** retrieve and classify recent mentions via the `fetch_mentions` skill,
**So that** I can prioritize responses.

*   **AC 1**: Inputs are sorted into categories (e.g., Question, Praise, Complaint, Spam).
*   **AC 2**: Spam items are disregarded without response.
*   **AC 3**: Implementation uses a mock classifier to simulate intent detection.

### Story 3.2: Draft Replies
**As an** Engagement Manager,
**I want to** draft context-aware replies to user comments,
**So that** I can maintain an active presence.

*   **AC 1**: Reply drafts reference the specific content of the user's message.
*   **AC 2**: Replies maintain the agent's persona voice.
*   **AC 3**: Reply generation respects conversation history limits.

## 4. Governor & Orchestrator
**Role**: Safety policy enforcement and execution routing.

### Story 4.1: Policy Check (The "Judge")
**As a** Governor,
**I want to** analyze every draft against safety policies,
**So that** no harmful content is published.

*   **AC 1**: Automated check validates content against "Forbidden patterns".
*   **AC 2**: Content flagged as "Unsafe" is rejected with a reason code.
*   **AC 3**: Safe content is marked `status: pending_approval`.

### Story 4.2: Human-in-the-Loop (HITL) Escalation
**As an** Orchestrator,
**I want to** review drafts that have low confidence scores,
**So that** I can manually approve or edit them.

*   **AC 1**: Drafts below a confidence threshold are routed to a "Review Queue".
*   **AC 2**: High-confidence drafts for low-risk actions may theoretically auto-approve if configured.

### Story 4.3: Execute Publishing
**As an** Orchestrator,
**I want to** dispatch approved drafts to the `publish_content` skill,
**So that** the content acts upon the world.

*   **AC 1**: Only items with `status: approved` can trigger the publishing skill.
*   **AC 2**: Successful execution moves the item to `status: published` and logs the ID.
*   **AC 3**: Failure responses from the skill trigger a failure state.
