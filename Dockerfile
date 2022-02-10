FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mkdir /home/eduk8s/lab-lc-helloworld

RUN git clone https://github.com/Eknathreddy09/lab-lc-helloworld.git /home/eduk8s/lab-lc-helloworld

RUN rm /home/eduk8s/lab-lc-helloworld/Dockerfile

RUN rm /home/eduk8s/lab-lc-helloworld/kustomization.yaml

RUN rm /home/eduk8s/lab-lc-helloworld/LICENSE

RUN rm /home/eduk8s/lab-lc-helloworld/README.md

RUN rm -r /home/eduk8s/lab-lc-helloworld/resources/

RUN mv /home/eduk8s/lab-lc-helloworld/workshop/* /opt/workshop/

COPY --chown=1001:0 . /home/eduk8s/lab-lc-helloworld

RUN fix-permissions /home/eduk8s
