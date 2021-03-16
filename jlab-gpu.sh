#!/bin/sh
docker build -t cfdtirej/jlab:gpu -f Dockerfile.gpu .

docker run --name jlab_notebook_gpu \
           --gpus all \
	   -v $PWD/notebook-gpu:/notebook \
	   -p 8889:8888 \
	   --restart always \
	   -d \
	   cfdtirej/jlab:gpu

