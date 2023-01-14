FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /usr/src/app/fullcycle .

ENTRYPOINT [ "./fullcycle" ]