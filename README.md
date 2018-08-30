# epkali project
Linux Kali customized image with updates and tools for course EP272U.

Docker Build cmd:

docker build -t <name>:<version_num> .

To run the container:

docker run -t -i <name> --rm /bin/bash

To push the image to Docker.io

docker push <name>:<version_num>
