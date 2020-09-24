FROM nginx
RUN apt-get update -y
RUN apt-get install vim -y
RUN mkdir /usr/share/nginx/html/app2
COPY index.html /usr/share/nginx/html/app2/
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
