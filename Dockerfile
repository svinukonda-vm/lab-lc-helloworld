FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN git clone https://github.com/Eknathreddy09/lab-lc-helloworld.git /home/eduk8s

RUN mkdir -p /home/eduk8s/test

RUN mv /home/eduk8s/workshop /opt/workshop

#RUN fix-permissions /home/eduk8s
