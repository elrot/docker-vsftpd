FROM alpine:3.8

RUN apk add --no-cache vsftpd && \
    adduser -h /home/./files -s /bin/false -D files

ADD vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD docker-entrypoint.sh /

VOLUME /home/files

EXPOSE 20 21 10090-10100

CMD /docker-entrypoint.sh