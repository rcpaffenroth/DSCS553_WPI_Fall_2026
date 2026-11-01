#! /bin/bash

SERVICE_NAME="ds553-case4-2026"
REGION="us-central1"

# Delete the container
gcloud run services delete $SERVICE_NAME --platform managed --region $REGION
