#! /bin/bash

SERVICE_NAME="dscs553-cs4-2026v5"
REGION="us-central1"

# Delete the container
gcloud run services delete $SERVICE_NAME --platform managed --region $REGION
