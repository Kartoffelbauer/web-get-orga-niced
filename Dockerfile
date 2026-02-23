# Use the official Nginx unprivileged Alpine image
FROM nginxinc/nginx-unprivileged:alpine

# Overwrite default files directly and ensure nginx owns them
COPY --chown=nginx:nginx ./index.html /usr/share/nginx/html/
COPY --chown=nginx:nginx ./google8b1bf3edb416c742.html /usr/share/nginx/html/
COPY --chown=nginx:nginx ./assets /usr/share/nginx/html/assets/

# Copy custom Nginx configuration and security headers
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/security-headers.conf /etc/nginx/conf.d/security-headers.conf

# Expose port 8080 (the unprivileged Nginx default)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]