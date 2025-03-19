FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx

EXPOSE 80

COPY ./nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
