#!/bin/bash

IMAGE="rpaff/dscs553_cs4_2026"
SERVICE_NAME="dscs553-cs4-2026v5"
REGION="us-central1"
PORT="7860"
MEMORY="4Gi"
CPU="1"

# Build a Linux AMD64 image for Cloud Run.
docker build --platform linux/amd64 -t "$IMAGE" .

# Push the container to Docker Hub.
docker push "$IMAGE"

# Deploy to Google Cloud Run with 4 GiB of memory per instance.
gcloud run deploy "$SERVICE_NAME" \
  --image "$IMAGE" \
  --platform managed \
  --region "$REGION" \
  --allow-unauthenticated \
  --port "$PORT" \
  --cpu "$CPU" \
  --memory "$MEMORY" \
  --update-env-vars="HF_TOKEN=$HF_TOKEN"

# Get the deployed service URL.
SERVICE_URL=$(gcloud run services describe "$SERVICE_NAME" \
  --platform managed \
  --region "$REGION" \
  --format="value(status.url)")

echo "Deployment complete!"
echo "Image:         $IMAGE"
echo "Service name:  $SERVICE_NAME"
echo "Region:        $REGION"
echo "Memory:        $MEMORY per instance"
echo "Public URL:    $SERVICE_URL"





