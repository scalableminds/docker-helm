FROM alpine:3.6

ENV HELM_VERSION="v2.6.2"

RUN apk add --no-cache bash ca-certificates coreutils findutils inotify-tools wget \
    && wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz linux-amd64/helm \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && chmod +x /usr/local/bin/helm \
    && rm /var/cache/apk/* \
    && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN helm version --client

ENTRYPOINT ["helm"]
