# Stage 0: Bicep baseline

The first IaC module provisions **Azure Monitor foundations only**:
- Log Analytics workspace with 30-day retention
- Workspace-based Application Insights

These resources can incur charges if deployed. No pipeline in this PR deploys them.

## Validation (no Azure subscription required)

With Azure CLI installed:

```bash
az bicep build --file infrastructure/bicep/main.bicep
az bicep build-params --file infrastructure/bicep/main.bicepparam
```

The Azure Pipeline performs the same syntax/build checks. Building a template is **not** deployment or subscription-level validation.

## Before deployment
1. Confirm subscription access and Azure spending budget.
2. Confirm the resource group, target region and naming.
3. Create an Azure DevOps service connection using workload identity federation.
4. Add an explicit deployment stage with a protected environment and approval.
5. Review `az deployment group what-if` output before applying changes.

## Planned modules
After this baseline passes, add Foundry, Azure OpenAI/model deployment, Azure AI Search, identities and network controls as separately reviewed modules. Availability and pricing vary by region and subscription.
