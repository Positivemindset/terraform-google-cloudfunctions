# Google Cloud Functions Terraform Module
This Terraform module deploys a Google Cloud Function from a GitHub repository. It supports both HTTP-triggered and event-triggered functions. The module clones the repository, installs necessary packages, zips the code, uploads it to a Google Cloud Storage bucket, and creates the Cloud Function.

## Features
* **Supports HTTP-triggered and event-triggered functions.**
* **Clones a GitHub repository containing the function code.**
* **Installs Python or .NET packages.**
* **Zips the function code and uploads it to a Google Cloud Storage bucket.**
* **Creates the Cloud Function with custom settings, including memory, timeout, ingress, and VPC configuration.**


## Usage
~~~
module "my_cloud_function" {
  source = "path/to/this/module"

  # Required variables
  github_url        = "https://github.com/repo.git"
  function_name     = "function_name"
  runtime           = "python39"/"dotnet"
  trigger_type      = "http"

  # Optional variables
  folder_name       = "folder_name"
  zip_name          = "zip_name"
  created_by        = "name"
  description       = "A description of your function"
  owner             = "name"

  # ... and other optional variables.
}
~~~

# Inputs
| Name          | Description                                                           | Type   | Default | Required |
|---------------|-----------------------------------------------------------------------|--------|---------|----------|
| github_url    | The URL of the GitHub repository containing the Cloud Function code.  | string | n/a     | yes      |
| function_name | The name of the Cloud Function.                                       | string | n/a     | yes      |
| runtime       | The runtime environment for the Cloud Function.                       | string | n/a     | yes      |
| trigger_type  | The trigger type for the Cloud Function.                              | string | n/a     | yes      |


# Outputs
| Name         | Description                                                                                     |
|--------------|-------------------------------------------------------------------------------------------------|
| function_url | The URL of the deployed HTTP-triggered Cloud Function (only available if trigger_type is "http"). |

# Enable the appropriate APIs

- Cloud Functions API (cloudfunctions.googleapis.com): This API is required to create, manage, and deploy Cloud Functions.

- Cloud Storage API (storage.googleapis.com): This API is necessary to create and manage Google Cloud Storage buckets and objects, which are used to store the source code and other files related to the Cloud Functions.

- Pub/Sub API (pubsub.googleapis.com). This API is required to create and manage Pub/Sub topics and subscriptions.



# Requirements
1. Terraform v0.12 or later
2. Google Cloud SDK with gcloud CLI
3. A Google Cloud Platform project
4. A service account with the required roles 

    - roles/cloudfunctions.developer: This role allows the service account to create, update, and delete Cloud Functions.

    - roles/storage.admin: This role allows the service account to manage storage buckets and objects.

    - roles/pubsub.admin (if using Pub/Sub triggers): This role allows the service account to manage Pub/Sub topics and subscriptions.

    - roles/iam.serviceAccountUser: This role allows the service account to use the service account specified in var.service_account_email. If this variable is not set, you don't need this role.

5. JSON key for the service account