# Infrastructure Learning Plan

## Phase 1 — Local Kubernetes cluster with Terraform [done]
- Installed Terraform, kind, kubectl
- Wrote Terraform config to provision a kind cluster
- Learned: providers, resources, state, plan/apply, outputs, gitignore hygiene

## Phase 2 — ArgoCD on the cluster [done]
- Added Helm provider to install ArgoCD via Terraform
- Exposed ArgoCD UI with NodePort + kind port mappings
- Learned: Helm charts, `set` overrides, provider dependencies, `terraform state rm`

## Phase 3 — GitOps in action [next]
- Create a simple app (nginx) with K8s manifests
- Register it as an ArgoCD Application
- Change the manifest in Git and watch ArgoCD detect and sync

## Phase 4 — Move to AWS
- Replace kind with EKS
- Add VPC, subnets, security groups, IAM
- Remote state with S3 + DynamoDB
- Swap NodePort for Ingress (ALB)
- Deep dive into networking differences

## Phase 5 — Compare and refactor
- Extract shared Terraform modules for both environments
- Understand what's portable vs platform-specific
