# Use the official Nginx unprivileged Alpine image
FROM nginxinc/nginx-unprivileged:alpine

# Switch to root to remove default files and set up permissions
USER root
RUN rm -rf /usr/share/nginx/html/*

# Copy only the necessary static files into the container
COPY ./index.html /usr/share/nginx/html/
COPY ./google8b1bf3edb416c742.html /usr/share/nginx/html/
COPY ./assets /usr/share/nginx/html/assets/

# Copy custom Nginx configuration
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Switch back to the non-root 'nginx' user
USER nginx

# Expose port 8080 (the unprivileged Nginx default)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]