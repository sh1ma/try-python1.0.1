FROM debian:stable-slim

WORKDIR /playground
RUN  apt update && apt install -y build-essential wget
RUN wget https://legacy.python.org/download/releases/src/python1.0.1.tar.gz && tar -zxvf python1.0.1.tar.gz

WORKDIR  /playground/python-1.0.1/
RUN sed -i 's/^getline/my_getline/' Objects/fileobject.c
RUN sed -i 's/ getline/ my_getline/' Objects/fileobject.c
RUN ./configure && make && make libinstall