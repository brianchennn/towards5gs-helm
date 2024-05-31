#FROM bitnami/golang:1.14.4 AS builder
FROM golang:1.21.10-bookworm AS builder

ARG NF

# Control-plane Supporting Packages
# RUN apt-get update
# RUN apt-get -y install wget git sudo

# Get Free5GC & dependent package source code
COPY ./base/free5gc/NFs/${NF} $GOPATH/src/free5gc/NFs/${NF}
COPY ./base/free5gc/Makefile $GOPATH/src/free5gc/Makefile
RUN rm -rf $GOPATH/src/free5gc/bin
COPY ./base/nas $GOPATH/src/nas
COPY ./base/ngap $GOPATH/src/ngap
COPY ./base/openapi $GOPATH/src/openapi
COPY ./base/util $GOPATH/src/util

# Build AMF
WORKDIR $GOPATH/src/free5gc
RUN make ${NF}

# Build the final image
FROM alpine

ARG NF

RUN if [[ "$NF" = "upf"]] ; then apk --no-cache add iproute2 iptables ; fi

WORKDIR /free5gc

# Copy executables
COPY --from=builder /go/src/free5gc/bin/${NF} ./${NF}/

# Copy certificates and config files
COPY ./base/free5gc/config/${NF}cfg.yaml ./config/
# COPY ./base/free5gc/cert/${NF}* ./cert/

WORKDIR /free5gc/${NF}

