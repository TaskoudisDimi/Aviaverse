FROM alpine:3.19
RUN apk add --no-cache ca-certificates tzdata
WORKDIR /app
COPY dist/bin/exam ./service
CMD ["./service"]
