FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
