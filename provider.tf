// Configure the Google Cloud provider
provider "google" {
# credentials = "${file("account.json")}"
  project     = "847662829465"
  region      = "europe-west1-d"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }
}
#resource "google_compute_instance" "default" {
#  count        = "4"
#  name         = "test-${count.index}"
#  machine_type = "f1-micro"
#  zone         = "europe-west1-d"
#  disk {
#    image       = "centos-7-v20170426"
#}
#  network_interface {
#    network = "default"
#}
#}
