# Agent Skills for Project Chimera

This document defines the Contract-First design for the critical skills used in the Project Chimera runtime. Each skill is designed to operate within the Specification-Driven Development (SDD) methodology, ensuring traceability and context-awareness.

## Skills

### 1. skill_trend_analysis
**Description**: This skill is used by the Planner to identify viral content opportunities by analyzing trends across platforms.

#### Input Schema
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "TrendAnalysisInput",
  "type": "object",
  "properties": {
    "correlation_id": {
      "type": "string",
      "description": "ID linking the skill execution to the original task."
    },
    "persona_id": {
      "type": "string",
      "description": "ID of the Soul context in which the skill is executed."
    },
    "platforms": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "description": "List of platforms to analyze (e.g., Twitter, TikTok)."
    },
    "keywords": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "description": "Keywords to focus the trend analysis."
    }
  },
  "required": ["correlation_id", "persona_id", "platforms", "keywords"]
}
```

#### Output Schema
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "TrendAnalysisOutput",
  "type": "object",
  "properties": {
    "correlation_id": {
      "type": "string",
      "description": "ID linking the output to the original task."
    },
    "persona_id": {
      "type": "string",
      "description": "ID of the Soul context in which the skill was executed."
    },
    "trends": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "topic": { "type": "string" },
          "score": { "type": "number" }
        }
      },
      "description": "List of identified trends with relevance scores."
    }
  },
  "required": ["correlation_id", "persona_id", "trends"]
}
```

### 2. skill_media_generation
**Description**: This skill is used by the Worker to generate multimedia content (e.g., images, videos) for influencer personas.

#### Input Schema
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "MediaGenerationInput",
  "type": "object",
  "properties": {
    "correlation_id": {
      "type": "string",
      "description": "ID linking the skill execution to the original task."
    },
    "persona_id": {
      "type": "string",
      "description": "ID of the Soul context in which the skill is executed."
    },
    "media_type": {
      "type": "string",
      "description": "Type of media to generate (e.g., image, video)."
    },
    "parameters": {
      "type": "object",
      "description": "Task-specific parameters for media generation."
    }
  },
  "required": ["correlation_id", "persona_id", "media_type", "parameters"]
}
```

#### Output Schema
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "MediaGenerationOutput",
  "type": "object",
  "properties": {
    "correlation_id": {
      "type": "string",
      "description": "ID linking the output to the original task."
    },
    "persona_id": {
      "type": "string",
      "description": "ID of the Soul context in which the skill was executed."
    },
    "media_url": {
      "type": "string",
      "description": "URL of the generated media."
    }
  },
  "required": ["correlation_id", "persona_id", "media_url"]
}
```

### 3. skill_crypto_microtip
**Description**: This skill interacts with the Coinbase AgentKit to send on-chain rewards (e.g., microtips) to users.

#### Input Schema
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "CryptoMicrotipInput",
  "type": "object",
  "properties": {
    "correlation_id": {
      "type": "string",
      "description": "ID linking the skill execution to the original task."
    },
    "persona_id": {
      "type": "string",
      "description": "ID of the Soul context in which the skill is executed."
    },
    "recipient_wallet": {
      "type": "string",
      "description": "Wallet address of the recipient."
    },
    "amount": {
      "type": "number",
      "description": "Amount to send as a microtip."
    }
  },
  "required": ["correlation_id", "persona_id", "recipient_wallet", "amount"]
}
```

#### Output Schema
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "CryptoMicrotipOutput",
  "type": "object",
  "properties": {
    "correlation_id": {
      "type": "string",
      "description": "ID linking the output to the original task."
    },
    "persona_id": {
      "type": "string",
      "description": "ID of the Soul context in which the skill was executed."
    },
    "transaction_id": {
      "type": "string",
      "description": "Blockchain transaction ID for the microtip."
    }
  },
  "required": ["correlation_id", "persona_id", "transaction_id"]
}
```

Each skill adheres to the principles of traceability and context-awareness, ensuring alignment with Project Chimera's architectural goals.