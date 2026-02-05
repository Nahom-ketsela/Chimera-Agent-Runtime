# OpenClaw Integration Specification

## MCP-Native Resource Definitions

### Availability Resource
- **URI**: `chimera://network/availability`
- **Description**: Represents the availability of the Chimera runtime to local OpenClaw nodes, including its unique identifier, current status, and supported capabilities.
- **Resource Model**:
```json
{
  "node_id": "string",
  "status": "available",
  "capabilities": ["planner", "worker", "judge"],
  "timestamp": "2026-02-05T12:00:00Z"
}
```

### Status Resource
- **URI**: `chimera://network/status`
- **Description**: Represents the current status of the Chimera runtime, including the task being processed and a timestamp.
- **Resource Model**:
```json
{
  "node_id": "string",
  "status": "busy",
  "current_task": "task_id",
  "timestamp": "2026-02-05T12:05:00Z"
}
```

### MCP Resource Integration
- **Resource Model**:
  - `resource_id`: Unique identifier for the resource.
  - `type`: Type of resource (e.g., compute, storage).
  - `status`: Current status (e.g., active, inactive).
  - `last_updated`: Timestamp of the last status update.

- **Example Resource Payload**:
```json
{
  "resource_id": "abc123",
  "type": "compute",
  "status": "active",
  "last_updated": "2026-02-05T12:10:00Z"
}
```