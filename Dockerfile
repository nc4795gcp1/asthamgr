FROM ubuntu
COPY start.sh /usr/share/manager-server/start.sh
RUN chmod +x /usr/share/manager-server/start.sh
CMD ["./usr/share/manager-server/start.sh"]
