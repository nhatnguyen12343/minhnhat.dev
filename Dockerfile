FROM ubuntu:18.04

RUN apt update -y \
    && apt install nginx -y \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:certbot/certbot -y \
    && apt-get update -y \
    && apt-get install python-certbot-nginx -y \
    && apt-get clean

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

# docker-compose up -d
# docker exec -it <frontend_container> bash       # bash into the nginx container
# certbot --nginx -d domain.com -d www.domain.com  
# fuck
# FROM node:14-stretch-slim as react_build
# # Create app directory
# WORKDIR /app
# COPY . /app
# # #prepare the contiainer for building react 
# RUN npm install && npm run build

# FROM nginx:latest
# COPY --from=react_build /app/build /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/nginx.conf

# EXPOSE 80
# CMD ["nginx","-g","daemon off;"]
