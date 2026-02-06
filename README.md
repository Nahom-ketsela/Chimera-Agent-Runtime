# Chimera Agent Runtime

**Autonomous Influencer Network Architecture**

## 🚀 Overview

The **Chimera Agent Runtime** is a cloud-native environment designed to orchestrate a hierarchical swarm of autonomous agents. Utilizing the **FastRender Swarm Pattern**, it decouples high-level strategy (Planning) from execution (Working) and governance (Judging), enabling the creation of scalable, self-governing influencer networks.

## ✨ Key Features

- **Planner-Worker-Judge Triad**: A specialized separation of concerns:
  - **Planner**: Stateful strategist for long-term campaigns.
  - **Worker**: Stateless executor for interacting with external tools (Web, GenAI, Blockchain).
  - **Judge**: Governance layer implementing **Confidence-Based Routing** for safety.
- **Model Context Protocol (MCP)**: Standardized open protocol for secure and efficient agent-tool communication.
- **Specification-Driven Development (SDD)**: Architected with strict adherence to functional and technical specifications for reliability.

## 🛠 Tech Stack

- **Runtime**: Python 3.12+
- **Package Manager**: `uv` (Astral)
- **Protocols**: Model Context Protocol (MCP)

## 📂 Project Structure

```text
chimera-agent-runtime/
├── research/       # Strategic reports & architectural insights
├── specs/          # Functional & Technical Specifications (SDD)
├── skills/         # Agent Capabilities (MCP Tool Definitions)
├── tests/          # TDD Test Suite
└── scripts/        # Utility and verification scripts
```

## ⚡ Getting Started

### Prerequisites

- **Python 3.12+**
- **uv** (Fast Python package installer)
- **Docker** (For containerized testing)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Nahom-ketsela/chimera-agent-runtime.git
    cd chimera-agent-runtime
    ```

2.  **Sync dependencies:**
    ```bash
    uv sync
    ```

3.  **Activate virtual environment:**
    ```bash
    source .venv/bin/activate
    ```

### Testing

Run the comprehensive test suite to ensure system integrity.

-   **Local Unit Tests:**
    ```bash
    make local-test
    ```

-   **Containerized Tests:**
    ```bash
    make test
    ```

## 🤝 Contributing

Contributions are welcome! Please ensure any new features or changes align with the existing [specifications](specs/) and include appropriate tests.

1.  Fork the repository.
2.  Create your feature branch (`git checkout -b feature/amazing-feature`).
3.  Commit your changes (`git commit -m 'Add some amazing feature'`).
4.  Push to the branch (`git push origin feature/amazing-feature`).
5.  Open a Pull Request.
