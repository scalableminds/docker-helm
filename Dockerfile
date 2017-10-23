FROM alpine:3.6

ENV HELM_VERSION="v2.6.2"

RUN apk add --no-cache bash ca-certificates coreutils findutils python3 wget \
    && pip3 install github-webhook \
    && wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz linux-amd64/helm \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && chmod +x /usr/local/bin/helm

RUN helm version --client

ENTRYPOINT ["helm"]
