FROM nginx:stable

COPY ./b/index.html /usr/share/nginx/html/index.html

EXPOSE 80