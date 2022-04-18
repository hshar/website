FROM nginx
RUN rm /usr/share/nginx/html/index.html
COPY ./index.html /usr/share/nginx/html/
