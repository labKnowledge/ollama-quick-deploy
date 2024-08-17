#!/bin/bash

# Set the host and port for Ollama
OLLAMA_HOST="0.0.0.0"
OLLAMA_PORT="80"

echo "Starting Ollama server on ${OLLAMA_HOST}:${OLLAMA_PORT}..."
OLLAMA_HOST="${OLLAMA_HOST}:${OLLAMA_PORT}" ollama serve &

echo "Waiting for Ollama server to be active..."
while ! curl -s "http://${OLLAMA_HOST}:${OLLAMA_PORT}" > /dev/null; do
    sleep 1
done
echo "Ollama server is active."

echo "Pulling llama3.1..."
OLLAMA_HOST="${OLLAMA_HOST}:${OLLAMA_PORT}" ollama pull llama3.1

echo "Pulling gemma2:2b..."
OLLAMA_HOST="${OLLAMA_HOST}:${OLLAMA_PORT}" ollama set-config --config-env "map[ OLLAMA_DEBUG:false OLLAMA_LLM_LIBRARY: OLLAMA_MAX_LOADED_MODELS:1 OLLAMA_MAX_QUEUE:512 OLLAMA_MAX_VRAM:0 OLLAMA_NOPRUNE:false OLLAMA_NUM_PARALLEL:1 OLLAMA_ORIGINS:[*] OLLAMA_RUNNERS_DIR: OLLAMA_TMPDIR:]"
OLLAMA_HOST="${OLLAMA_HOST}:${OLLAMA_PORT}" ollama pull gemma2:2b

# Keep the container running
tail -f /dev/null