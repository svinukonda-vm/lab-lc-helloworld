FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN git clone https://github.com/Eknathreddy09/lab-lc-helloworld.git

RUN cd /home/eduk8s/lab-lc-helloworld

RUN rm Dockerfile kustomization.yaml LICENSE README.md

RUN rm -r resources/

RUN cd workshop

RUN mv * /opt/workshop/

COPY --chown=1001:0 . /home/eduk8s/lab-lc-helloworld

RUN fix-permissions /home/eduk8s
