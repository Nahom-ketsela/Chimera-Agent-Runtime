# Chimera Agent Runtime
**Autonomous Influencer Network Architecture**


## 🚀 Overview

The **Chimera Agent Runtime** is a cloud-native environment designed to orchestrate a hierarchical swarm of autonomous agents. Unlike monolithic chatbots, this system utilizes the **FastRender Swarm Pattern** to decouple high-level strategy (Planning) from execution (Working) and governance (Judging).

This repository contains the infrastructure, specifications required to build the factory.

## 🏗 Architecture

The system operates on a **Planner-Worker-Judge** triad, governed by the **Model Context Protocol (MCP)** for standardized external communication.

* **Planner:** Stateful strategist managing long-term campaigns.
* **Worker:** Stateless executors interacting with tools (Web, Image Gen, Crypto).
* **Judge:** Governance layer implementing **Confidence-Based Routing** for safety.

## 🛠 Tech Stack

* **Runtime:** Python 3.11+
* **Package Manager:** `uv` (Astral)
* **Protocols:** Model Context Protocol (MCP)
* **Persistence:** Weaviate (Semantic), PostgreSQL (Transactional), Redis (Episodic)
* **Blockchain:** Coinbase AgentKit

## 📦 Installation

This project uses `uv` for high-speed dependency management.

```bash
# 1. Clone the repository
git clone [https://github.com/Nahom-ketsela/chimera-agent-runtime.git](hthttps://github.com/Nahom-ketsela/chimera-agent-runtime.git)
cd chimera-agent-runtime

# 2. Sync dependencies
uv sync

# 3. Activate virtual environment
source .venv/bin/activate

```

## 📂 Repository Structure

```text
chimera-agent-runtime/
├── research/       # Strategic Reports & Architecture Strategy
├── specs/          # Functional & Technical Specifications (SDD)
├── skills/         # Agent Capabilities (MCP Tool Definitions)
├── tests/          # TDD Test Suite (Failing by Design)
├── .cursor/        # Context Engineering Rules
└── pyproject.toml  # Dependency Definitions

```


