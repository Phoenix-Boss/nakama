FROM heroiclabs/nakama:3.22.0

RUN apt-get update && apt-get install -y gettext-base curl && rm -rf /var/lib/apt/lists/*

# Copy the pre-configured nakama.yml directly
COPY nakama.yml /nakama/data/nakama.yml
COPY modules/ /nakama/data/modules/
COPY start.sh /start.sh
COPY keepalive.sh /keepalive.sh

RUN chmod +x /start.sh
RUN chmod +x /keepalive.sh

EXPOSE 7350
CMD ["/start.sh"]
