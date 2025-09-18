FROM redis:6-alpine

# Copy your custom Redis config
COPY redis.conf /usr/local/etc/redis/redis.conf

# ✅ Bind Redis to all interfaces for Render port detection
RUN sed -i 's/^bind .*/bind 0.0.0.0/' /usr/local/etc/redis/redis.conf

# ✅ Disable protected mode (safe for private services only)
RUN sed -i 's/^protected-mode .*/protected-mode no/' /usr/local/etc/redis/redis.conf

# ✅ Expose Redis port
EXPOSE 6379

# ✅ Start Redis with your config
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"]