# Security and governance requirements

- Do not commit PATs, API keys, connection strings, customer data or employer IP.
- Prefer Azure workload identity federation for Azure DevOps service connections.
- Scope Azure RBAC to the minimum required resources.
- Prefer private networking when feasible; document any demo-only deviations.
- Agents should retrieve only approved documents and must not expose secrets.
- Deployment Concierge and Investigation Agent use read-only diagnostic tools.
- Evaluate prompt injection, evidence grounding, unsupported answers and prohibited actions.
- Log operational telemetry without storing sensitive prompts or secrets unnecessarily.
- Check Azure pricing, model availability and quotas before provisioning.
