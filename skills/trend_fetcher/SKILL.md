# Trend Fetcher Skill

**Description**: Fetch trending topics from external sources.

## Input
```json
{
  "query": "string",
  "limit": 10
}
```

## Output
```json
{
  "trends": [
    {
      "id": "uuid-v4",
      "source": "news_api | twitter | rss",
      "content": "string (headline or tweet text)",
      "url": "string (optional source link)",
      "timestamp": "iso8601-string"
    }
  ]
}
```
