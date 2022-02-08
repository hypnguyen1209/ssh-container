FROM debian:stable-slim

RUN echo "root:root@123456789" | chpasswd

RUN apt-get update &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dropbear wget curl rsync vim psmisc procps git && \
    apt-get clean && \
    rm /var/lib/apt/lists/*_*

RUN rm /etc/dropbear/dropbear_rsa_host_key

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh

EXPOSE 22
