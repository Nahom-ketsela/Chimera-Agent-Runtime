# MCP Tooling Specification

## 🛠 Overview

The **Model Context Protocol (MCP)** is the standard for how Chimera Agents interact with the external world. This specification defines the lifecycle, error handling, and registry of standard tools.

## 🔄 Lifecycle

1.  **Discovery**:
    -   Runtime scans `mcp.json` and connects to defined servers.
    -   Runtime queries `list_tools` to discover available capabilities.
2.  **Negotiation**:
    -   Agent requests a tool execution.
    -   Governance layer checks permissions against the Agent's Role constraints.
3.  **Execution**:
    -   Runtime proxies the request to the MCP Server.
    -   Input validation occurs against the JSON Schema defined in the tool definition.
4.  **Result/Error**:
    -   Output is normalized and returned to the Agent's context window.

## ⚠️ Error Handling

Errors must follow the JSON-RPC 2.0 standard.

-   **Code -32600**: Invalid Request (Schema validation failed).
-   **Code -32601**: Method not found (Tool does not exist).
-   **Code -32000**: Server Error (Internal logic failure in the tool).
-   **Code -32001**: Rate Limit Exceeded (Backoff required).

**Strategy**: Agents are trained to catch these errors and attempt **Self-Correction** (e.g., adjusting parameters after a Schema Validation error) before escalating to a human supervisor.

## 📚 Standard Tool Registry

### 1. `search_internet`
-   **Purpose**: Retrieve real-time information.
-   **Parameters**: `query` (string), `num_results` (int).
-   **Constraints**: Max 10 results.

### 2. `generate_media`
-   **Purpose**: Create visual assets.
-   **Parameters**: `prompt` (string), `aspect_ratio` (string), `model` (string).
-   **Constraints**: Allowed models whitelist only.

### 3. `manage_wallet`
-   **Purpose**: Interact with AgentKit for blockchain operations.
-   **Parameters**: `action` (enum: balance, transfer), `asset` (string), `amount` (float), `destination` (string).
-   **Constraints**: Requires HITL for amounts > Threshold.
