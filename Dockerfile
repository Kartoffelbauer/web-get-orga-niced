# /home/ahermann/Documents/Websites/web-get-orga-niced/Dockerfile

# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Remove default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy website content to Nginx web root
COPY index.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets/

# Copy custom Nginx configuration
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
