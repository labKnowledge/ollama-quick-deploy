# ollama-quick-deploy

This repository contains the necessary files to deploy Ollama, an open-source large language model runner, using Docker. The deployment includes automatic setup for the Ollama server on port 80 and pulls two language models: llama3.1 and gemma2:2b.

## Contents

- `Dockerfile`: Defines the Docker image for the Ollama deployment.
- `start_ollama.sh`: Bash script to initialize and configure the Ollama server.

## Prerequisites

- Docker installed on your system
- Sufficient disk space for the Docker image and language models

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/labKnowledge/ollama-quick-deploy.git
   cd ollama-quick-deploy
   ```

2. Build the Docker image:
   ```
   docker build -t ollama-quick-deploy .
   ```

3. Run the container:
   ```
   docker run -d -p 80:80 --name ollama-container ollama-quick-deploy
   ```
   Note: The container will download the llama3.1 and gemma2:2b models, which may take some time depending on your internet connection.

## What It Does

1. Starts the Ollama server on port 80
2. Waits for the server to become active
3. Pulls the llama3.1 language model
4. Configures Ollama settings
5. Pulls the gemma2:2b language model

## Configuration

The `start_ollama.sh` script sets the following configuration for Ollama:

```
OLLAMA_DEBUG: false
OLLAMA_LLM_LIBRARY: 
OLLAMA_MAX_LOADED_MODELS: 1
OLLAMA_MAX_QUEUE: 512
OLLAMA_MAX_VRAM: 0
OLLAMA_NOPRUNE: false
OLLAMA_NUM_PARALLEL: 1
OLLAMA_ORIGINS: [*]
OLLAMA_RUNNERS_DIR: 
OLLAMA_TMPDIR:
```

You can modify these settings in the `start_ollama.sh` file if needed.

## Customization

- To add or remove language models, edit the `start_ollama.sh` script. Currently, it pulls llama3.1 and gemma2:2b.
- To change Ollama configuration, modify the `ollama set-config` command in `start_ollama.sh`.
- The Ollama server is configured to run on port 80. If you need to change this, modify the `-p` option in `start_ollama.sh` and update the `EXPOSE` instruction in the Dockerfile.

## Accessing Ollama

After starting the container, you can access Ollama at `http://localhost:80` (or just `http://localhost`). If you're running this on a remote server, replace `localhost` with the server's IP address or domain name.

## Troubleshooting

- If the container exits unexpectedly, check the logs:
  ```
  docker logs ollama-container
  ```

- Ensure you have enough system resources (CPU, RAM, disk space) to run the container and load the language models.
- If you encounter issues binding to port 80, make sure it's not being used by another service. You may need root privileges to bind to ports below 1024 on some systems.

## Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements or encounter any problems.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

MIT License

Copyright (c) 2024 -  labKnowledge

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.