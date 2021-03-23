resource "hcloud_network" "cluster-network" {
  name = "cluster-network"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "mars-network" {
  network_id = hcloud_network.cluster-network.id
  type = "cloud"
  network_zone = "eu-central"
  ip_range = "10.0.1.0/24"
}

resource "hcloud_server" "mars-masters" {
  count = 1 
  name = "master${count.index + 1}.mars.cow.network"
  image = "debian-10"
  server_type = "cpx11"
  location = "fsn1"
  labels = {
    type = "master"
  }
  network {
    network_id = hcloud_network.cluster-network.id
    ip = "10.0.1.${count.index + 1}"
  }
  depends_on = [
    hcloud_network_subnet.mars-network
  ]
}

resource "hcloud_server" "mars-workers" {
  count = 4
  name = "worker${count.index}.mars.cow.network"
  image = "debian-10"
  server_type = "cpx11"
  location = "fsn1"
  labels = {
    type = "worker"
  }
  network {
    network_id = hcloud_network.cluster-network.id
    ip = "10.0.1.${count.index + 1 + length(hcloud_server.mars-masters)}"
  }
  depends_on = [
    hcloud_network_subnet.mars-network
  ]
}
