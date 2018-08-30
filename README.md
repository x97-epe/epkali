# epkali project
Linux Kali, updates and tools for course EP272U.

Docker Build cmd:

docker build -t x97epe/epkali:<version_num> .

To run the container:

docker run -t -i x97epe/epkali --rm /bin/bash

To push the image to Docker.io

docker push x97epe/epkali:<version_num>
