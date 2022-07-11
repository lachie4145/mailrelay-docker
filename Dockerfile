FROM --platform=linux/amd64 ubuntu:20.04

ENV SMTP_HOST=""
ENV SMTP_PORT=587
ENV SMTP_TTS=false
ENV SMTP_USER=""
ENV SMTP_PASS=""
ENV SMTP_MAX_SIZE=10485760
ENV SMTP_AUTH_TYPE=true

ENV LISTEN_IP="0.0.0.0"
ENV LISTEN_PORT=2525
ENV TIMEOUT_SEC=30

RUN mkdir -p /relay
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget 
RUN wget https://github.com/wiggin77/mailrelay/releases/download/v1.04/mailrelay-linux-amd64 && mv mailrelay-linux-amd64 /relay/mailrelay && chmod +x /relay/mailrelay

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
