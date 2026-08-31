resource "helm_release" "argocd_apps" {
  depends_on = [helm_release.argocd]

  name             = "argocd-apps"
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-apps"
  version          = "2.0.2"
  wait             = true

  values = [yamlencode({
    applications = {
      nginx = {
        project = "default"
        source = {
          repoURL        = "https://github.com/kldewar/infra-learning-apps.git"
          targetRevision = "main"
          path           = "nginx"
        }
        destination = {
          server    = "https://kubernetes.default.svc"
          namespace = "nginx"
        }
        syncPolicy = {
          automated = {
            prune    = true
            selfHeal = true
          }
          syncOptions = ["CreateNamespace=true"]
        }
      }
    }
  })]
}
