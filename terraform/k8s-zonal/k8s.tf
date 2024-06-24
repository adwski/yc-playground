resource "yandex_kubernetes_cluster" "k8s_zonal" {
  name        = "k8s-zonal-cluster"
  description = "zonal k8s cluster"

  network_id = yandex_vpc_network.k8s_vpc.id

  cluster_ipv4_range = var.k8s_pod_cidr
  service_ipv4_range = var.k8s_service_cidr

  service_account_id      = yandex_iam_service_account.k8s_resource_sa.id
  node_service_account_id = yandex_iam_service_account.k8s_node_sa.id

  release_channel = "STABLE"

  master {
    version = "1.29"

    zonal {
      zone      = yandex_vpc_subnet.k8s_subnet.zone
      subnet_id = yandex_vpc_subnet.k8s_subnet.id
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = false
    }
  }

  network_implementation {
    cilium {}
  }
}