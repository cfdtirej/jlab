#!/bin/sh
docker build -t cfdtirej/jlab:gpu-tf -f Dockerfile.gpu-tf .

docker run --name jlab_gpu_tf \
           --gpus all \
	   -v $PWD/notebook-gpu-tf:/notebook \
	   -p 8888:8888 \
	   --restart always \
	   -d \
	   cfdtirej/jlab:gpu-tf

