# Project Chimera – Technical Specifications

## 1. Core Data Schemas (JSON)

### 1.1 Trend Entities

**ObservedTrend**
Represents a raw item captured from an external source.
```json
{
  "id": "uuid-v4",
  "source": "news_api | twitter | rss",
  "content": "string (headline or tweet text)",
  "url": "string (optional source link)",
  "timestamp": "iso8601-string"
}
```

**SelectedTrend**
A trend deemed relevant by the Trend Fetcher agent.
```json
{
  "trend": { "...ObservedTrend..." },
  "relevance_score": 0.85,
  "reasoning": "Matches interest in AI agents and automation"
}
```

### 1.2 Content Entities

**ContentDraft**
A proposed post waiting for approval.
```json
{
  "id": "uuid-v4",
  "trend_id": "uuid-v4 (from SelectedTrend)",
  "platform": "twitter | linkedin | blog",
  "text": "string (the post body)",
  "image_prompt": "string (optional)",
  "status": "draft | pending_approval | approved | published | rejected",
  "confidence_score": 0.92,
  "policy_violations": []
}
```

**ReplyDraft**
A proposed response to a user interaction.
```json
{
  "id": "uuid-v4",
  "reply_to_id": "string (external mention ID)",
  "text": "string (reply body)",
  "status": "draft | pending_approval | approved | published"
}
```

## 2. Skill Interface Contracts

These interfaces define the expected inputs and outputs for runtime tools (MCP wrappers).

### 2.1 Trend Skills

**`fetch_news`**
*   **Input**:
    ```json
    { "query": "string", "limit": 10 }
    ```
*   **Output**:
    ```json
    { "trends": [ { "...ObservedTrend..." } ] }
    ```

### 2.2 Generation Skills

**`generate_text`**
*   **Input**:
    ```json
    { "context": "string", "persona": "string", "platform": "string" }
    ```
*   **Output**:
    ```json
    { "text": "string" }
    ```

**`generate_image`**
*   **Input**:
    ```json
    { "prompt": "string", "style_preset": "string" }
    ```
*   **Output**:
    ```json
    { "image_url": "string" }
    ```

### 2.3 Engagement Skills

**`fetch_mentions`**
*   **Input**:
    ```json
    { "platform": "string", "limit": 10 }
    ```
*   **Output**:
    ```json
    { "mentions": [ { "id": "string", "text": "string", "author": "string" } ] }
    ```

### 2.4 Action Skills

**`publish_content`**
*   **Input**:
    ```json
    { "draft_id": "uuid", "platform": "string", "content": "string", "media_url": "string?" }
    ```
*   **Output**:
    ```json
    { "post_id": "string", "status": "success | failed" }
    ```

## 3. Conceptual Storage Model

For this blueprint, persistence is modeled as simple document collections (e.g., JSON files or in-memory dictionaries for testing).

*   **`trends`**: Stores `SelectedTrend` objects. Where `key = trend.id`. Used for deduplication.
*   **`drafts`**: Stores `ContentDraft` objects. Where `key = draft.id`. State transitions (`pending` -> `approved`) update these records.
*   **`history`**: Log of all published actions.
