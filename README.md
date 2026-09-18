An example chatbot using [Gradio](https://gradio.app), [`huggingface_hub`](https://huggingface.co/docs/huggingface_hub/v0.22.2/en/index), and the [Hugging Face Inference API](https://huggingface.co/docs/api-inference/index).

## Scripts

### `connect_student_admin.sh`

Connects to a VM using the original shared ssh key.

```bash
./connect_student_admin.sh
```

### `deploy_first_part.sh`

Initial deployment:

- Removes an old saved SSH host key.
- Creates `tmp/` and copies the original course SSH key into it.
- Generates the new personal key `tmp/mykey`.
- Installs the new public key on the container while retaining the original
  course key.
- Clones the `case_study_2` Git branch.
- Copies the repository to the container as `~/DSCS553_example`.

Run:

```bash
./deploy_first_part.sh
```

### `deploy_second_part.sh`

Finishes deployment on the container:

- Connects using `tmp/mykey`.
- Installs `python3-venv`.
- Creates the Python virtual environment.
- Installs `requirements.txt`.
- Starts `app.py` with `nohup`.

Run:

```bash
./deploy_second_part.sh
```

Application output is stored in `~/log.txt` on the container.

The Gradio application runs on port `7860` inside the container. Access it through the respective http port or an SSH tunnel.
