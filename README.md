# epkali project
Linux Kali, with updates and tools for course EP272U.

This project builds a Linux-Kaly images running OpenVPN to connect to
KTH EP272U course cyber spaces. By attaching a bash to the runnig container
it is possible to access the course lab environemn.

## Files:
- Dockerfile: Docker build instructions
- README.dm: this short documentation
- config: Directory containing images configuration items
  - local_hosts: list of IP/Hostname for VPN
  - starter.sh: Image startup script

## Minimal Documentation
Download the ZIP file with the VPN certificate and config-file give by the course. Uncompress file into a local directory not in same folder as this project (SECRETS_DIR). Take note of the OpenVPN config file name to be use.

### To build the image:
Edit config/starter.sh by setting the required VPN config-file into parameters.
Run:

docker build -t <name>:<version_num> .

### To run the container:
Start the container from image, Linux Kali in container will start and OpenVPN will connct to course VPN. Please note: OpenVPN is the main service running into containr and logs will be printed on stdout.

docker run --rm --cap-add=NET_ADMIN --device=/dev/net/tun -v <SECRET_DIR>:/secrets x97epe/epkali:<version_num>

If the OpenVPN successfully starts, open a second terminal on your machine, check the container ID of running Linux Kali and connect to it by running:

docker exec -it <container-id> /bin/bash

A running terminal inside the container will open with access to Lab-system
Enjoy!

### To push the image to Docker.io

docker push <name>:<version_num>
