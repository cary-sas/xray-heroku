#!/bin/sh

# config trojan
cat << EOF > /etc/config.json
{
    "inbounds": [
        {
            "port": 443,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password":"$UUID",
                        "email": "love@example.com"
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "tls",
                "tlsSettings": {
                    "alpn": [
                        "http/1.1"
                    ]
                    
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}	
EOF

# run xray
/usr/bin/xray run -config /etc/config.json
