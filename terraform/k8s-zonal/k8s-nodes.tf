resource "yandex_kubernetes_node_group" "k8s_nodes_main" {
  cluster_id  = yandex_kubernetes_cluster.k8s_zonal.id
  name        = "k8s-main"
  description = "k8s main node group"
  version     = "1.29"

  instance_template {
    platform_id = "standard-v3"

    network_interface {
      subnet_ids = ["${yandex_vpc_subnet.k8s_subnet.id}"]
    }

    resources {
      memory        = var.k8s_nodes_main_mem
      cores         = var.k8s_nodes_main_cpu
      core_fraction = var.k8s_nodes_main_cpu_fraction
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.k8s_nodes_main_count
    }
  }

  allocation_policy {
    location {
      zone = var.zone_name
    }
  }

  maintenance_policy {
    auto_upgrade = false
    auto_repair  = true
  }
}