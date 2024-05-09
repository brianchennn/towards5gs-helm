#FROM bitnami/golang:1.14.4 AS builder
FROM golang:1.18.10-buster AS builder

ARG NF

# Control-plane Supporting Packages
RUN apt-get update
RUN apt-get -y install wget git sudo

# Get Free5GC source code
COPY ./base/free5gc $GOPATH/src/free5gc
COPY ./base/nas $GOPATH/src/nas
COPY ./base/ngap $GOPATH/src/ngap
COPY ./base/openapi $GOPATH/src/openapi

# Build AMF
WORKDIR $GOPATH/src/free5gc
RUN make ${NF}

# Build the final image
FROM alpine

ARG NF

RUN if [[ "$NF" = "upf"]] ; then apk --no-cache add iproute2 iptables ; fi

WORKDIR /free5gc

RUN mkdir -p config/ cert/ public

# Copy executables
COPY --from=builder /go/src/free5gc/bin/${NF} ./${NF}/

# Copy certificates and config files
COPY --from=builder /go/src/free5gc/config/${NF}cfg.yaml ./config/
COPY --from=builder /go/src/free5gc/cert/${NF}* ./cert/

WORKDIR /free5gc/${NF}

