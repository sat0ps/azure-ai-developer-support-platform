# Azure Pipelines

`azure-pipelines.yml` at repository root is an initial **validation-only** pipeline. It intentionally does not provision cloud resources or deploy agents.

Later pipelines will separate:
1. Platform infrastructure deployment
2. Foundry agent version/evaluation/promotion
3. Sample application deployment observed by Concierge

Azure DevOps service connections and approvals must be configured in the user's Azure DevOps organisation.
