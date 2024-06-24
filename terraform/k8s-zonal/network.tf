resource "yandex_vpc_network" "k8s_vpc" {
  name = "k8s-vpc"
}

resource "yandex_vpc_subnet" "k8s_subnet" {
  v4_cidr_blocks = ["${var.zone_net}"]
  zone           = var.zone_name
  network_id     = yandex_vpc_network.k8s_vpc.id
  route_table_id = yandex_vpc_route_table.k8s_vpc_rt.id
}

resource "yandex_vpc_gateway" "k8s_gw" {
  name = "k8s-gw"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "k8s_vpc_rt" {
  network_id = yandex_vpc_network.k8s_vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.k8s_gw.id
  }
}
