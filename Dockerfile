FROM nginx
RUN apt-get update -y
RUN apt-get install vim -y
COPY sampleindex.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
