# Use Linux Kali official image as the base
FROM kalilinux/kali-linux-docker

# Update and install extra basic tools
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install metasploit-framework -y \
 && apt-get install traceroute -y \
 && apt autoremove -y

