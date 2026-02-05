# Technical Specification

## JSON Schemas

### Task Assignment Schema (Planner -> Worker)
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "TaskAssignment",
  "type": "object",
  "properties": {
    "task_id": {
      "type": "string",
      "description": "Unique identifier for the task."
    },
    "task_type": {
      "type": "string",
      "description": "Type of task (e.g., video_creation, image_editing)."
    },
    "parameters": {
      "type": "object",
      "description": "Task-specific parameters."
    },
    "deadline": {
      "type": "string",
      "format": "date-time",
      "description": "Deadline for task completion."
    },
    "persona_id": {
      "type": "string",
      "description": "Identifier for the Soul being used."
    },
    "platform_constraints": {
      "type": "object",
      "description": "Constraints for the platform (e.g., 'no-politics', 'max-tokens')."
    },
    "correlation_id": {
      "type": "string",
      "description": "ID linking the task to governance traceability."
    }
  },
  "required": ["task_id", "task_type", "parameters", "deadline", "persona_id", "platform_constraints", "correlation_id"]
}
```

### Database Schema

#### Entity-Relationship Diagram (ERD)
- **Content**: Stores metadata about generated content.
  - `content_id` (Primary Key)
  - `type` (e.g., video, image, text)
  - `created_at`
  - `worker_id` (Foreign Key)
  - `correlation_id`

- **JudgeScores**: Stores evaluation scores from Judge Agents.
  - `score_id` (Primary Key)
  - `content_id` (Foreign Key)
  - `confidence_score`
  - `feedback`
  - `evaluated_at`
  - `correlation_id`

- **AgentStates**: Stores metadata and historical memory for Souls.
  - `state_id` (Primary Key)
  - `persona_id`
  - `state_data`
  - `last_updated`

#### SQL Schema
```sql
CREATE TABLE Content (
    content_id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    created_at TIMESTAMP,
    worker_id VARCHAR(50),
    correlation_id VARCHAR(50)
);

CREATE TABLE JudgeScores (
    score_id SERIAL PRIMARY KEY,
    content_id INT REFERENCES Content(content_id),
    confidence_score FLOAT,
    feedback TEXT,
    evaluated_at TIMESTAMP,
    correlation_id VARCHAR(50)
);

CREATE TABLE AgentStates (
    state_id SERIAL PRIMARY KEY,
    persona_id VARCHAR(50),
    state_data JSONB,
    last_updated TIMESTAMP
);
```