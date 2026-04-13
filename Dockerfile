FROM heroiclabs/nakama:3.22.0

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy config
COPY nakama.yml /nakama/data/nakama.yml

# Copy modules (create dir first in case it's empty)
RUN mkdir -p /nakama/data/modules
COPY modules/index.js /nakama/data/modules/index.js

# Copy scripts
COPY start.sh /start.sh
COPY keepalive.sh /keepalive.sh

RUN chmod +x /start.sh /keepalive.sh

EXPOSE 7350 7351 7352

CMD ["/start.sh"]