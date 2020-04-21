/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# kubeconfig

output "kubeconfig_raw" {
  sensitive   = true
  description = "A kubeconfig file configured to access the GKE cluster."
  value       = data.template_file.kubeconfig.rendered
}

# Terraform providers (kubernetes, helm)

output "cluster_ca_certificate" {
  sensitive   = true
  description = "The cluster_ca_certificate value for use with the kubernetes provider."
  value       = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
}

output "host" {
  description = "The host value for use with the kubernetes provider."
  value       = "https://${data.google_container_cluster.gke_cluster.endpoint}"
}

output "token" {
  sensitive   = true
  description = "The token value for use with the kubernetes provider."
  value       = data.google_client_config.provider.access_token
}
