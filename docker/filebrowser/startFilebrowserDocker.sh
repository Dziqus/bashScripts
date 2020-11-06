#!/bin/bash
docker run -d --name filebrowser -v /home/pi/docker/filebrowser/files:/srv -p 100:80 filebrowser/filebrowser:pi