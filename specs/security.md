# Security Architecture

## 🛡 Overview

The Chimera Agent Runtime adopts a **Zero Trust** security model. Every component, whether internal or external, must be authenticated and authorized. We prioritize the safety of the underlying system and the integrity of the autonomous actions.

## 🔐 Authentication & Identity

-   **Service-to-Service**: All inter-agent communication is secured via mTLS (Mutual TLS) to ensuring both encryption and identity verification.
-   **Supervisor Tokens**: Human operators interacting with the API must provide ephemeral, high-entropy JWTs.
-   **Agent Identity**: Each agent instance is assigned a cryptographically verifiable Identity Key (Ed25519) used to sign all generated artifacts (Tasks, Content, Judgments).

## 📦 Sandboxing & Isolation

-   **Worker Isolation**: Worker Agents execute within ephemeral, network-restricted Docker containers.
-   **Tool Sandboxing**: MCP Servers run in separate processes with strictly defined system call filters (seccomp).
-   **Resource Quotas**: Strict CPU/RAM limits preventing denial-of-service from rogue agents.

## 🛡 Data Protection

-   **At Rest**:
    -   **PostgreSQL**: Volume-level encryption (LUKS).
    -   **Weaviate**: Encrypted shards.
    -   **Sensitive Configuration**: Secrets (API Keys, Wallet Seeds) are managed via Vault/Secrets Manager, never stored in plain text environment variables.
-   **In Transit**: TLS 1.3 mandated for all network traffic (Internal and External).

## ⚔️ MCP Security Model

-   **Capability Negotiation**: Agents must explicitly request permissions for tools (e.g., "Requesting read-only access to /var/log").
-   **Least Privilege**: MCP Servers expose granular endpoints. A generalized "Run Command" tool is strictly forbidden; specialized tools (e.g., "Resize Image") are required.
-   **Human-in-the-Loop (HITL)**: High-risk tools (e.g., Crypto Wallet Transfer > $10) trigger a mandatory manual approval workflow.

## 📜 Audit Logging

-   **Immutable Ledger**: All critical actions (Financial transactions, Data Deletion, Configuration Changes) are appended to a tamper-prove append-only log.
-   **Traceability**: Every log entry includes the initiating `agent_id`, `correlation_id`, and `timestamp`.
