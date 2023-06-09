FROM jupyter/tensorflow-notebook:latest

RUN apt update &&\
    rm -rf ~/.cache &&\
    apt clean all &&\
    apt install -y curl
