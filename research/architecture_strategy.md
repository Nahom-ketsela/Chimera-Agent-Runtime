# Project Chimera: Domain Architecture Strategy

## 1. High-Level Agent Pattern: The Hierarchical Swarm
**Decision:** We are rejecting the "Sequential Chain" (A -> B -> C) in favor of a **Hierarchical Swarm (FastRender Pattern)**.

### Why?
* **Parallelism:** Sequential chains are brittle; one failure stops the whole line. A swarm allows us to spin up 50 "Worker" agents to reply to comments simultaneously.
* **Separation of Concerns:** "Thinking" (Planning) and "Doing" (Working) require different context windows and temperature settings.

### The Triad Roles
1.  **The Planner (Strategist):** Stateful. Maintains the `GlobalState`. Decomposes high-level goals (e.g., "Hype the launch") into atomic tasks.
2.  **The Worker (Executor):** Stateless. Picks up a single task, executes it using MCP Tools, and returns a result artifact.
3.  **The Judge (Gatekeeper):** Governance. Reviews Worker output against the `SOUL.md` persona and Safety Guidelines before committing to the database.

## 2. Human-in-the-Loop (HITL) Strategy
**Decision:** We implement **Confidence-Based Routing** rather than "Always-On" human review.

### The Logic Flow
The "Judge" Agent assigns a `confidence_score` (0.0 to 1.0) to every artifact.
* **Green Lane (> 0.90):** Auto-Approve. Action executes immediately.
* **Yellow Lane (0.70 - 0.90):** Async Approval. Added to the "Review Queue" for human sign-off.
* **Red Lane (< 0.70):** Reject. Task is sent back to Planner for re-prompting.

**Hard Override:** Any content flagged as "Sensitive" (Politics, Health, Finance) is forced into the Yellow Lane regardless of confidence.

## 3. Data Persistence Strategy
**Decision:** A **Hybrid Persistence Layer** to handle the velocity of agent thoughts vs. the stability of business data.

| Data Type | Technology | Purpose |
| :--- | :--- | :--- |
| **Semantic Memory** | **Weaviate** | Stores the agent's long-term history and `SOUL.md` embeddings for RAG. |
| **Transactional** | **PostgreSQL** | Stores Campaign configurations, Task Logs, and Financial Ledgers. |
| **Episodic/Queue** | **Redis** | High-speed task queues (Celery/BullMQ) and short-term conversation cache (last 1 hour). |

## 4. OpenClaw & Social Protocol Integration
**Context:** OpenClaw agents operate "headless" and use local markdown files for identity. Chimera will interoperate with this network via **MCP Resources**.

### The "Handshake" Protocol
To allow an OpenClaw agent to interact with a Chimera agent, we will expose the following MCP Resources:

1.  **Identity Resource (`chimera://agent/soul`):**
    * Exposes the public-facing version of `SOUL.md`. This allows external agents to "read" our persona and understand how to communicate with us.
2.  **Status Resource (`chimera://status/availability`):**
    * Signals if the agent is currently accepting collaboration requests (e.g., "Available", "Busy", "Sleeping").
3.  **Inbox Tool (`chimera.send_message`):**
    * A standardized way for external agents to push messages into our Planner's context.

### Compatibility Note
Both systems utilize Markdown-based identity files (`SOUL` / `IDENTITY`). We will strictly adhere to the `SOUL.md` standard to ensure our agent's persona is portable between the Chimera Cloud and local OpenClaw runtimes.