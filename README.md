# Hooli TRD Cloud Run Deployment

This repository contains Terraform configurations for provisioning and updating a Cloud Run service on Google Cloud Platform.

## Prerequisites

Ensure you have the following installed:

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://www.terraform.io/downloads.html)
- [Tofu](https://github.com/iiiceburg/tofu) (for Terraform wrapper)

## Setup

1. **Authenticate with Google Cloud:**

   ```bash
   gcloud auth login
   gcloud config set project [PROJECT_ID]
   ```

2. **Initialize Tofu:**

   ```bash
   tofu init
   ```

3. **Review the Terraform Plan:**

   ```bash
   tofu plan -out=tfplan
   ```

4. **Apply the Terraform Plan:**

   ```bash
   tofu apply "tfplan"
   ```

## Updating the Cloud Run Service

To update the Cloud Run service (e.g., deploying a new container image):

1. **Modify the `cloudrun.tf` file** with the new image details.

2. **Re-run the Terraform Plan and Apply steps:**

   ```bash
   tofu plan -out=tfplan
   tofu apply "tfplan"
   ```

   This will create a new revision and update the traffic allocation accordingly.

## Notes

- The `cloudrun.tf` file defines the Cloud Run service, including the container image and traffic configuration.
- Ensure that the container image is updated in the Terraform configuration before applying changes.
- For more advanced configurations, refer to the [Terraform Google Cloud Run documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service).

## License

This project is licensed under the MIT License.
