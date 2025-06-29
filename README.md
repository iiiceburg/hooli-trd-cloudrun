# Hooli TRD Cloud Run Deployment

This repository contains Terraform configurations for provisioning and updating a Cloud Run service on Google Cloud Platform.

## Prerequisites

Ensure you have the following installed:

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://www.terraform.io/downloads.html)

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

## Autoscaling

The Cloud Run service is configured to autoscale based on traffic load with the following settings:

- **Minimum instances:** 2  
- **Maximum instances:** 4  

This means the service will always have at least 2 instances running and can scale up to a maximum of 4 instances automatically to handle increased traffic. This configuration ensures efficient resource usage and responsiveness.

You can adjust these limits in the `cloudrun.tf` Terraform configuration under the `scaling` block.

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

- The `cloudrun.tf` file defines the Cloud Run service, including the container image, resource limits, and autoscaling configuration.
- Ensure that the container image is updated in the Terraform configuration before applying changes.
- For more advanced configurations, refer to the [Terraform Google Cloud Run documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service).

## License

This project is licensed under the MIT License.
