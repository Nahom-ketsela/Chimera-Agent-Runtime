# Frontend Specification

## 🚀 Overview

The **Chimera Dashboard** operates as the mission control for the autonomous agent swarm. It provides real-time visibility into agent states, task executions, and system health.

## 🏗 Architecture

-   **Type**: Single Page Application (SPA)
-   **Framework**: Next.js (React)
-   **State Management**: Zustand / TanStack Query
-   **Real-time Layer**: WebSocket integration with the Runtime
-   **Styling**: TailwindCSS

## 📱 Key Views

### 1. Mission Control (Home)
-   **Swarm Topology Map**: Interactive force-directed graph showing active Planners, Workers, and Judges.
-   **Global Status Bar**: Aggregate system health, active task count, and error rates.
-   **Live Activity Feed**: Rolling log of high-level events (Task Assigned, Content Generated, Judgment Passed).

### 2. Agent Inspector
-   **Persona Profile**: View current "Soul" parameters (Personality, constraints).
-   **Task Queue**: List of pending and active tasks for the specific agent.
-   **Memory Explorer**: Searchable view of the agent's Vector (Weaviate) and Episodic (Redis) memory.

### 3. Trace Viewer
-   **Gantt Diagram**: Visual timeline of a specific `correlation_id` lifecycle.
-   **Step Details**: Drill-down into specific MCP tool calls, showing inputs, outputs, and latency.
-   **Failure Analysis**: Highlighted error steps with stack traces and recovery attempts.

## 🔌 API Contract (WebSockets)

### Events
-   `swarm:status_update`: Pushed every 5s with aggregated metrics.
-   `agent:state_change`: Pushed immediately on agent state transition (e.g., IDLE -> WORKING).
-   `task:log`: Streamed stdout/stderr from Worker agents.
