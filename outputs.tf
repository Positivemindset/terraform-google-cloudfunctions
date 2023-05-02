# HTTP trigger URL for the Cloud Function
output "function_http_url" {
  description = "Function http trigger url"
  value       = length(google_cloudfunctions_function.cloud_function.*.https_trigger_url) > 0 ? join(" ", [for url in google_cloudfunctions_function.cloud_function.*.https_trigger_url : url if url != null]) : null
}


# Cloud Function name
output "function_name" {
  description = "Function name"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.name)
}

# Cloud Function service account email
output "function_service_account_email" {
  description = "Service account email"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.service_account_email)
}

# Cloud Function runtime
output "function_runtime" {
  description = "Function runtime"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.runtime)
}

# Cloud Function region
output "function_region" {
  description = "Function region"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.region)
}

# Cloud Function memory allocation
output "function_memory" {
  description = "Function memory"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.available_memory_mb)
}

# Cloud Function project
output "function_project" {
  description = "Function project"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.project)
}

# Cloud Function ID
output "function_id" {
  description = "Function id"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.id)
}

/* # Cloud Function source archive bucket
output "function_source_archive_bucket" {
  description = "Function source archive bucket"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.source_archive_bucket)
}

# Cloud Function source archive object
output "function_source_archive_object" {
  description = "Function source archive object"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.source_archive_object)
} */

# Cloud Function VPC egress settings
output "function_vpc_egress_settings" {
  description = "Function vpc egress settings"
  value       = join(" ", google_cloudfunctions_function.cloud_function.*.vpc_connector_egress_settings)
}
