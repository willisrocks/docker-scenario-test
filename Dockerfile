FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server git nmap debconf-utils python python-pip tcpdump dsniff sudo iputils-ping net-tools vim
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt-get install -y tshark
RUN pip install --upgrade pip
RUN pip install scapy

# Setup SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
ENV SESSION_USER testuser
ENV SESSION_PASSWORD password
RUN echo "export VISIBLE=now" >> /etc/profile

# Add instructor
RUN useradd -m instructor && echo "instructor:4pjiggDk" | chpasswd && adduser instructor sudo

# Install scapyhunter
WORKDIR /tmp
RUN git clone https://github.com/JamesSullivan1/scapyHunt
WORKDIR /tmp/scapyHunt
RUN python scapyHunt.py &

# Update MOTD
COPY ./scripts/20-scenario-instructions /etc/update-motd.d/
RUN chmod +x /etc/update-motd.d/20-scenario-instructions

# Set entrypoint
COPY ./scripts/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "entrypoint.sh", "$SESSION_USER", "$SESSION_PASSWORD"]

# Expose ssh port and set command
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
