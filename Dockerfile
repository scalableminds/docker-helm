FROM alpine:3.6

ENV HELM_VERSION="v2.6.2"

RUN apk add --no-cache bash ca-certificates coreutils findutils wget \
    && wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz linux-amd64/helm --directory /usr/local/bin \
    && chmod +x /usr/local/bin/helm \
    && rm /var/cache/apk/* \
    && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN helm version --client

ENTRYPOINT ["helm"]