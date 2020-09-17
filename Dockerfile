FROM nginx
COPY index.html /var/www/html/index.html
CMD systemctl restart nginx
EXPOSE 80
