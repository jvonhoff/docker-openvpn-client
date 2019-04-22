FROM alpine:3.7

# Install runtime dependencies.
RUN apk --update add curl openvpn wget

# Log the public ip address of the container in every minute.
HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
  CMD curl 'https://api.ipify.org'

# This is where the configuration files will go.
VOLUME [ "/vpn/config" ]

# A place for any files downloaded using wget (or curl)
VOLUME [ "/vpn/download" ]

CMD [ "openvpn", "--config", "/vpn/config/config.ovpn" ]
