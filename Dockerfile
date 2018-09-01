# Use Linux Kali official image as the base
FROM kalilinux/kali-linux-docker

# Update and install extra basic tools
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install metasploit-framework -y \
 && apt-get install traceroute -y \
 && apt-get install dnsutils -y \
 && apt-get install openvpn -y \
 && apt autoremove -y 

#Install Configuration installer and OpenVPN starter
ADD config/starter.sh /usr/local/sbin

#Start OpenVPN service
ENTRYPOINT ["/usr/local/sbin/starter.sh"]
