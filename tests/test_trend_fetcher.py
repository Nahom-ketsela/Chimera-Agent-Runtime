import pytest
from jsonschema import validate, ValidationError

# Mock Trend object based on specs/technical.md
mock_trend_output = {
    "correlation_id": "12345",
    "persona_id": "persona_abc",
    "trends": [
        {"topic": "AI advancements", "score": 95.5},
        {"topic": "Climate change", "score": 89.3}
    ]
}

# JSON Schema for validation
trend_output_schema = {
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
                    "topic": {"type": "string"},
                    "score": {"type": "number"}
                },
                "required": ["topic", "score"]
            }
        }
    },
    "required": ["correlation_id", "persona_id", "trends"]
}

def test_mock_trend_output():
    """Validate the mock Trend object against the JSON schema."""
    try:
        validate(instance=mock_trend_output, schema=trend_output_schema)
    except ValidationError as e:
        pytest.fail(f"Validation failed: {e.message}")