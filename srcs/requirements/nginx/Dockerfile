
FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

#SETUP SSL KEY
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/certificate.key -subj "/C=FR/ST=NA"