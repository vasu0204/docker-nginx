FROM nginx:1.25.3-alpine
RUN apk update && apk upgrade
WORKDIR /usr/share/nginx/html
COPY index.html .
COPY style.css .
COPY script.js .
COPY assets/ assets/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
