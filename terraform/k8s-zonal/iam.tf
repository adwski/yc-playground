resource "yandex_iam_service_account" "k8s_resource_sa" {
  name        = "sa-k8s-resource"
  description = "k8s service account to manage resources"
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s_resource_sa_binding" {
  folder_id = var.folder_id

  role = "editor"

  members = [
    "serviceAccount:${yandex_iam_service_account.k8s_resource_sa.id}"
  ]
}

resource "yandex_iam_service_account" "k8s_node_sa" {
  name        = "sa-k8s-node"
  description = "k8s service account used by worker nodes"
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s_node_sa_binding" {
  folder_id = var.folder_id

  role = "container-registry.images.puller"

  members = [
    "serviceAccount:${yandex_iam_service_account.k8s_node_sa.id}"
  ]
}
