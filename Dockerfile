FROM heroiclabs/nakama:3.22.0

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY nakama.yml /nakama/data/nakama.yml

RUN mkdir -p /nakama/data/modules
COPY modules/index.js /nakama/data/modules/index.js

COPY start.sh /start.sh
COPY keepalive.sh /keepalive.sh

RUN chmod +x /start.sh /keepalive.sh

EXPOSE 7350 7351 7352

ENTRYPOINT ["/bin/sh", "/start.sh"]