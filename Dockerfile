#FROM ghcr.io/openfaas/license-check:0.4.1 as license-check
FROM alpine:latest
RUN apk --no-cache add \
    ca-certificates

RUN addgroup -S app \
    && adduser -S -g app app

WORKDIR /home/app
EXPOSE 8080

ENV http_proxy=""
ENV https_proxy=""

COPY ./faas-netes ./faas-netes

RUN chown -R app:app ./

USER app

CMD ["./faas-netes"]
