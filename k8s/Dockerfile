# Use the offical Golang image to create a build artifact.
# This is based on Debian and sets the GOPATH to /go.
# https://hub.docker.com/_/golang
FROM golang:1.15.1 as builder

# Copy local code to the container image.
WORKDIR /go/src/github.com/ejfhp/paperwallet
COPY . .

# Build the command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN CGO_ENABLED=0 GOOS=linux  go build -o paperwallet ./cmd/paperwallet

# Use a Docker multi-stage build to create a lean production image.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine:3.12
RUN apk add --no-cache ca-certificates

# Copy the binary to the production image from the builder stage.
RUN mkdir /cmd
WORKDIR /cmd
COPY --from=builder /go/src/github.com/ejfhp/paperwallet/paperwallet paperwallet
COPY  ./img img
COPY  ./css css
COPY  ./js js

# Run the web service on container startup.
CMD ["./paperwallet"]
