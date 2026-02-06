# CLAUDE: Master Directive

## Project Context
This is Project Chimera, an autonomous, specification-driven influencer factory. The system is designed to generate, evaluate, and optimize multimedia content autonomously, leveraging a Hierarchical Swarm architecture (Planner-Worker-Judge).

## The Prime Directive
Never generate code without verifying the `correlation_id` and `persona_id` requirements as defined in [specs/technical.md](specs/technical.md). These fields are critical for governance traceability and context-rich task execution.

## Traceability Rule
Always explain the architectural plan before writing code. This ensures alignment with the Specification-Driven Development (SDD) methodology and maintains system integrity.

## Stack
- **Python**: Version 3.12
- **uv**: High-speed package manager and environment resolver
- **Weaviate**: Semantic vector database for content and metadata storage
- **MCP Sense**: Logging and monitoring framework for MCP-native systems