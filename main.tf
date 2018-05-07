provider "google" {
	credentials = "${file("${var.credentials}")}"
	project = "${var.gcp_project}"
	region = "${var.region}"
}





resource "google_dataproc_cluster" "data" {
    name       = "${var.name}-data"
    region     = "${var.region}"
   
 cluster_config {
        master_config {
            num_instances     = 1
            machine_type      = "n1-standard-1"
            disk_config {
                boot_disk_size_gb = 10
            }
         } 

        worker_config {
            num_instances     = 2
            machine_type      = "n1-standard-1"
            disk_config {
                boot_disk_size_gb = 10
                num_local_ssds    = 1
            }
        }
         gce_cluster_config {
            #network = "default"
            subnetwork = "10.146.0.0/20"
            tags    = ["foo", "bar"]
        }
   }   
}
