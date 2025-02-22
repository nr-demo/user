FROM golang:1.17-alpine
ENV sourcesdir /go/src/github.com/microservices-demo/user/
ENV MONGO_HOST mytestdb:27017
ENV HATEAOS user
ENV USER_DATABASE mongodb

COPY . ${sourcesdir}
RUN apk update
RUN apk add git
#RUN go get -v github.com/Masterminds/glide && cd ${sourcesdir} && glide update && glide install && go install
RUN cd ${sourcesdir} && go mod init && go mod vendor && go install

ENTRYPOINT user
EXPOSE 8084
