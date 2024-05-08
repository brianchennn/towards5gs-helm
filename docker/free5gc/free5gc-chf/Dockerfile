FROM towards5gs/free5gc-base:3.4.0 AS builder
FROM alpine:3.13.6

LABEL maintainer="raoufkh <khichane.araouf@gmail.com>"

ENV GIN_MODE="release"

WORKDIR /free5gc
RUN mkdir -p log/ config/ TLS/ chf/

# Copy executable and default certs/configs
COPY --from=builder /free5gc/chf ./chf
COPY --from=builder /free5gc/cert/chf.pem ./cert/
COPY --from=builder /free5gc/cert/chf.key ./cert/
COPY --from=builder /free5gc/cert/nrf.pem ./cert/
COPY --from=builder /free5gc/config/chfcfg.yaml ./config/

VOLUME [ "/free5gc/config" ]
#VOLUME [ "/free5gc/config/TLS" ]

WORKDIR /free5gc/chf

