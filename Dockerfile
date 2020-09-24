FROM nginx
RUN apt-get update -y
RUN apt-get install vim -y
RUN mkdir /app2
COPY index.html /app2/
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
