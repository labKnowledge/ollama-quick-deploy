FROM ollama/ollama

COPY start_ollama.sh /start_ollama.sh
RUN chmod +x /start_ollama.sh

EXPOSE 80

ENTRYPOINT ["/start_ollama.sh"]