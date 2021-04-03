#!/bin/sh
read JUPYTER_TOKEN < passwd.txt

docker build -t cfdtirej/jlab:gpu \
			 --build-arg JUPYTER_TOKEN=$JUPYTER_TOKEN \
			 -f Dockerfile.gpu .

docker run --name jlab_notebook_gpu \
           --gpus all \
	   -v $PWD/notebook-gpu:/notebook \
	   -p 8889:8888 \
	   --restart always \
	   -d \
	   cfdtirej/jlab:gpu

