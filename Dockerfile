ARG TANZU_CLI_VERSION=v1.4.1

FROM apnex/vmw-cli as clis
ARG MYVMWAREUSER=reddye@vmware.com
ARG MYVMWAREPASS=Newstart@1
ARG TANZU_CLI_VERSION=v1.4.1
ENV VMWUSER=${MYVMWAREUSER}
ENV VMWPASS=${MYVMWAREPASS}
RUN vmw-cli ls vmware_tanzu_kubernetes_grid/1_x/PRODUCT_BINARY \
  && vmw-cli cp tanzu-cli-bundle-linux-amd64.tar
WORKDIR /files
ENV HOMEDIR=/root
RUN tar xf tanzu-cli-bundle-linux-amd64.tar
RUN adduser -D -u 1001 eduk8s -g root
USER 1001
RUN /files/cli/core/${TANZU_CLI_VERSION}/tanzu-core-linux_amd64 plugin install --local /files/cli all

FROM quay.io/eduk8s/base-environment:master
COPY --chown=1001:0 . /home/eduk8s/
RUN mv /home/eduk8s/workshop /opt/workshop

# All the direct Downloads need to run as root as  they are going to /usr/local/bin
USER root
# TMC
RUN curl -L -o /usr/local/bin/tmc $(curl -s https://tanzupaorg.tmc.cloud.vmware.com/v1alpha/system/binaries | jq -r 'getpath(["versions",.latestVersion]).linuxX64') && \
  chmod 755 /usr/local/bin/tmc

ARG TANZU_CLI_VERSION
COPY --from=clis /files/cli/core/${TANZU_CLI_VERSION}/tanzu-core-linux_amd64 /usr/local/bin/tanzu
COPY --from=clis home/eduk8s/.config/tanzu/ /home/eduk8s/.config/tanzu
COPY --from=clis home/eduk8s/.cache /home/eduk8s/.cache
COPY --from=clis home/eduk8s/.local /home/eduk8s/.local
RUN chmod 775 -R /home/eduk8s/.config /home/eduk8s/.cache /home/eduk8s/.local && chown -R eduk8s /home/eduk8s/.cache /home/eduk8s/.config /home/eduk8s/.local
USER 1001

#FROM quay.io/eduk8s/base-environment:master

#COPY --chown=1001:0 . /home/eduk8s/

#RUN mkdir -p /home/eduk8s/test

#RUN mv /home/eduk8s/workshop /opt/workshop

#RUN fix-permissions /home/eduk8s
