An example chatbot using [Gradio](https://gradio.app), [`huggingface_hub`](https://huggingface.co/docs/huggingface_hub/v0.22.2/en/index), and the [Hugging Face Inference API](https://huggingface.co/docs/api-inference/index).

# Case Study 3: Docker and Monitoring

This repository contains a chatbot application and the files needed to run it in Docker and monitor it with Prometheus and Grafana.

## Dockerfile

A Dockerfile contains instructions for building a Docker image. The main `Dockerfile` installs the application's dependencies and Node Exporter, then starts the chatbot and Node Exporter together in one container.

The chatbot uses port **7860**, the application's metrics use **8000**, and Node Exporter provides system metrics on **9100**.

## Prometheus folder

This folder contains:

- `Dockerfile`: Builds an image for the Prometheus server.
- `prometheus.yml`: Tells Prometheus where to collect the application and system metrics.

Prometheus collects and stores these metrics so they can be viewed over time. Its web interface uses port **9090**.

## Grafana folder

This folder contains a `Dockerfile` for running Grafana. Connect Grafana to the Prometheus server to create dashboards showing the collected metrics. Grafana uses port **3000**.

## Application files

- `app.py`: The chatbot application, including its Prometheus metrics.
- `requirements.txt`: The Python packages needed by the application.
