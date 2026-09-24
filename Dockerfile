FROM teddysun/xray:latest
COPY config.json /etc/xray/config.json
EXPOSE 10000
CMD ["xray", "run", "-config", "/etc/xray/config.json"]
