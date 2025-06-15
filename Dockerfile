FROM golang;1.24.4 as builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o learn-github-actions-cicd

FROM scratch
COPY --from=builder /app/learn-github-actions-cicd /app
ENTRYPOINT [ "/app" ]