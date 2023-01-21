echo "[-] Installing webhook.."

apt-get install webhook

sudo mkdir /opt/scripts
sudo mkdir /opt/hooks

sudo chown -R $USER:$USER /opt/scripts
sudo chown -R $USER:$USER /opt/hooks

echo "[-] Installing webhook in sysd.."
file_location=/etc/systemd/system/webhook.service

hooksjson_location=/opt/hooks/hooks.json

cat > $hooksjson_location <<EOF
[
  {
    "id": "redeploy-api-gateway",
    "execute-command": "bash",
        "pass-arguments-to-command": [
          {
            "source": "string",
            "name": "/opt/scripts/redeploy-api-gateway.sh"
          }
        ],
    "response-message": "Redeploying API-Gateway..."
  }
]

EOF

cat > $file_location <<EOF
[Unit]
Description=webhook server for ci
ConditionPathExists=/usr/bin/webhook
After=network.target
[Service]
Type=simple
WorkingDirectory=/opt/hooks
ExecStart=/usr/bin/webhook -port 9999 -hooks /opt/hooks/hooks.json -verbose
Restart=on-failure
PrivateTmp=true
[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl start webhook.service
systemctl enable webhook.service

echo "[ok] Installing webhook in sysd."