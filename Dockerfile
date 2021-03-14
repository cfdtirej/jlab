FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install -y sudo \
    curl \
    vim \
    wget

WORKDIR /opt

RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh && \
    sh Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -rf Anaconda3-2020.11-Linux-x86_64.sh

ENV PATH /opt/anaconda3/bin:$PATH

WORKDIR /notebook

COPY requirements.txt ./requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]

