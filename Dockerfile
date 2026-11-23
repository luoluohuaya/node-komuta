FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache unzip curl ca-certificates \
 && curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip \
 && unzip -o xray.zip xray geoip.dat geosite.dat \
 && chmod +x xray \
 && rm xray.zip
COPY config.json /app/config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
