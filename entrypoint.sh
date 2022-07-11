#!/bin/bash
echo "Starting the relay..."

tee -a /relay/mailrelay.json <<EOF 
{
    "smtp_server": "$SMTP_HOST",
    "smtp_port": $SMTP_PORT,
    "smtp_starttls": $SMTP_TTS,
    "smtp_username": "$SMTP_USER",
    "smtp_password": "$SMTP_PASS",
    "smtp_max_email_size": $SMTP_MAX_SIZE,
    "smtp_login_auth_type": $SMTP_AUTH_TYPE,
    "local_listen_ip": "$LISTEN_IP",
    "local_listen_port": $LISTEN_PORT,
    "allowed_hosts": ["*"],
    "timeout_secs": $TIMEOUT_SEC 
} 
EOF
./relay/mailrelay --config=/relay/mailrelay.json
