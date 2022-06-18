FROM ubuntu
COPY start.sh /usr/share/manager-server/start.sh
RUN chmod +x /usr/share/manager-server/start.sh
ENV PORT=$PORT
CMD ["./usr/share/manager-server/start.sh"]
