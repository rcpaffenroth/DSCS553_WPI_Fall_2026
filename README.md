# Case Study 4

Deploy the chatbot as a public Cloud Run service using the container built from this repository.

## The GCP scripts

| Script | Purpose |
| --- | --- |
| `gcp_build_and_start.sh` | Builds a Linux AMD64 image, pushes it to Docker Hub, deploys it to Cloud Run, and prints the service URL. |
| `gcp_clean.sh` | Deletes the configured Cloud Run service. |

These scripts use the project selected in your local `gcloud` configuration. Confirm that project before deployment or cleanup.

## Files required for this deployment

- `Dockerfile`: Builds the application image and defines its startup command.
- `app.py`: Runs the Gradio chatbot on `0.0.0.0:7860`.
- `requirements.txt`: Installs the Python dependencies.
- `gcp_build_and_start.sh` and `gcp_clean.sh`: Deploy and remove the Cloud Run service.

The public Cloud Run endpoint serves the chatbot on port `7860`.
