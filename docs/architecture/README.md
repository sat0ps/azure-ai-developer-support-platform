# Architecture and delivery plan

## Scope
One monorepo with shared Stage 0 controls and three application-facing agents.

```text
Azure Repos / GitHub (source)
         |
Azure Pipelines (validation + controlled deployments)
         |
Bicep -> Azure resources (Foundry, Azure OpenAI, AI Search, Monitor)
         |
Developer RAG -> Deployment Concierge -> Failure Investigator
```

Stage 0 deploys the platform and agent releases. It is **not** the application deployment pipeline observed by the Concierge.

## Milestones
1. Validate repository and Bicep offline.
2. Confirm Azure subscription, permissions, quotas, region and budget.
3. Provision minimal dev environment via Azure Pipelines with workload identity federation.
4. Deploy Stage 1 agent and run grounded-answer evaluations.
5. Add sample app delivery pipeline and Stage 2 Concierge.
6. Add synthetic failure scenarios and Stage 3 read-only investigator.
7. Demonstrate agent v1 -> v2 evaluation gate, approval and rollback.

## Design guardrails
- Synthetic knowledge and incident data only.
- Least-privilege managed identities and scoped read-only tools for investigation.
- Human approval for production-like promotions and remediation.
- No secrets in repository or pipeline YAML.
- Separate infrastructure, agent-release and sample-application pipelines.
- No live cloud deployment is implied by repository validation.
