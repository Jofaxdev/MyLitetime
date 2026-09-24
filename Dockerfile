FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Cài đặt wget và các thư viện mạng cơ bản
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Tải và cài đặt Gost
RUN wget https://github.com/ginuerzh/gost/releases/download/v2.11.5/gost-linux-amd64-2.11.5.gz -O /tmp/gost.gz && \
    gunzip /tmp/gost.gz && \
    mv /tmp/gost /usr/bin/gost && \
    chmod +x /usr/bin/gost

# Mở cổng mặc định của Render
EXPOSE 10000

# Khởi chạy Gost theo cổng $PORT tự động của Render
CMD gost -L socks5+ws://0.0.0.0:$PORT?path=/socks5-ws
