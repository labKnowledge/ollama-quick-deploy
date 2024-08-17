#!/bin/bash

echo "Starting Ollama server on port 80..."
OLLAMA_HOST=0.0.0.0:80 ollama serve &

echo "Waiting for Ollama server to be active..."
while [ "$(ollama list | grep 'NAME')" == "" ]; do
  sleep 1
done
echo "Ollama server is active."

echo "Pulling llama3.1..."
ollama pull llama3.1

echo "Pulling gemma2:2b..."
ollama set-config --config-env "map[ OLLAMA_DEBUG:false OLLAMA_LLM_LIBRARY: OLLAMA_MAX_LOADED_MODELS:1 OLLAMA_MAX_QUEUE:512 OLLAMA_MAX_VRAM:0 OLLAMA_NOPRUNE:false OLLAMA_NUM_PARALLEL:1 OLLAMA_ORIGINS:[*] OLLAMA_RUNNERS_DIR: OLLAMA_TMPDIR:]"
ollama pull gemma2:2b

tail -f /dev/null