# Stage 1: Developer RAG agent

**Planned:** ingest synthetic engineering documentation, create an Azure AI Search hybrid index and expose a Foundry agent that answers with grounded source references.

Acceptance criteria:
- Relevant retrieval for known engineering questions.
- Source references accompany factual answers.
- Unsupported questions return an honest limitation.
- Evaluations cover relevance, groundedness and unsafe requests.
- Agent version 1 is released through CI/CD, not manually promoted.
