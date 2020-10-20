FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.8-jre-slim-buster

ARG AWSCLI_APP=awscli
ARG AWSCLI_ARCH=linux-x86_64
RUN wget https://awscli.amazonaws.com/${AWSCLI_APP}-exe-${AWSCLI_ARCH}.zip \
    -O ${AWSCLI_APP}.zip && \
    unzip ${AWSCLI_APP}.zip && \
    ./aws/install && \
    rm -rf ./aws ${AWSCLI_APP}.zip

ARG IAM_AUTH_APP=aws-iam-authenticator
ARG IAM_AUTH_ARCH=linux/amd64
RUN wget https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/${IAM_AUTH_ARCH}/${IAM_AUTH_APP} \
    -O ${IAM_AUTH_APP} && \
    chmod +x ${IAM_AUTH_APP} && \
    mv ${IAM_AUTH_APP} /usr/local/bin/${IAM_AUTH_APP}

ARG HELM_APP=helm
ARG HELM_VERSION=v3.3.4
ARG HELM_ARCH=linux-amd64
RUN wget https://get.helm.sh/${HELM_APP}-${HELM_VERSION}-${HELM_ARCH}.tar.gz \
    -O ${HELM_APP}.tar.gz && \
    tar -zxvf ${HELM_APP}.tar.gz && \
    mv ${HELM_ARCH}/${HELM_APP} /usr/local/bin/${HELM_APP} && \
    rm -rf ${HELM_APP}.tar.gz

ARG K8S_APP=kubectl
ARG K8S_VERSION=v1.19.3
ARG K8S_ARCH=linux/amd64
RUN wget https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/${K8S_ARCH}/${K8S_APP} \
    -O ${K8S_APP} && \
    chmod +x ${K8S_APP} && \
    mv ${K8S_APP} /usr/local/bin/${K8S_APP}

ARG MYSQL_APP=mysql
ARG MYSQL_VERSION=8.0.20
ARG MYSQL_ARCH=linux-x86_64-minimal
RUN wget https://downloads.mysql.com/archives/get/p/23/file/${MYSQL_APP}-${MYSQL_VERSION}-${MYSQL_ARCH}.tar.xz && \
    tar -xf ${MYSQL_APP}-${MYSQL_VERSION}-${MYSQL_ARCH}.tar.xz && \
    cp ${MYSQL_APP}-${MYSQL_VERSION}-${MYSQL_ARCH}/bin/${MYSQL_APP} /usr/local/bin/ && \
    chmod +x /usr/local/bin/${MYSQL_APP} && \
    rm -rf ${MYSQL_APP}-${MYSQL_VERSION}-${MYSQL_ARCH}*

ARG TF_APP=terraform
ARG TF_VERSION=0.13.4
ARG TF_ARCH=linux_amd64
RUN wget https://releases.hashicorp.com/${TF_APP}/${TF_VERSION}/${TF_APP}_${TF_VERSION}_${TF_ARCH}.zip \
    -O ${TF_APP}.zip && \
    unzip ${TF_APP}.zip && \
    mv ${TF_APP} /usr/local/bin/${TF_APP} && \
    rm -rf ${TF_APP}.zip

ARG VAULT_APP=vault
ARG VAULT_VERSION=1.5.4
ARG VAULT_ARCH=linux_amd64
RUN wget https://releases.hashicorp.com/${VAULT_APP}/${VAULT_VERSION}/${VAULT_APP}_${VAULT_VERSION}_${VAULT_ARCH}.zip \
    -O ${VAULT_APP}.zip && \
    unzip ${VAULT_APP}.zip && \
    mv ${VAULT_APP} /usr/local/bin/${VAULT_APP} && \
    rm -rf ${VAULT_APP}.zip
