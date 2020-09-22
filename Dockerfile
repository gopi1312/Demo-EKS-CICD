FROM nginx
RUN apt-get update -y
RUN apt-get install vim -y
CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
