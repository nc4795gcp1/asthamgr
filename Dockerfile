FROM ubuntu
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install network-manager -y
RUN apt-get install wget -y
RUN apt-get install systemctl -y
RUN mkdir /usr/share/manager-server
RUN wget https://github.com/Manager-io/Manager/releases/latest/download/ManagerServer-linux-x64.tar.gz -O /usr/share/manager-server/ManagerServer-linux-x64.tar.gz
RUN tar xvzf /usr/share/manager-server/ManagerServer-linux-x64.tar.gz -C /usr/share/manager-server
RUN printf "[Unit]\nAfter=network.target\n\n[Service]\nLimitNOFILE=1048576\nExecStart=/usr/share/manager-server/ManagerServer -port 80\nRestart=on-failure\nStartLimitInterval=600\n\n[Install]\nWantedBy=multi-user.target" | sudo tee /etc/systemd/system/manager-server.service
RUN systemctl daemon-reload
RUN systemctl start manager-server
RUN systemctl enable --now manager-server
COPY start.sh /usr/share/manager-server/start.sh
RUN chmod +x /usr/share/manager-server/start.sh
#EXPOSE 80
ENV app_user nikhil
#CMD ["./usr/share/manager-server/start.sh"]
