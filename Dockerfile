FROM loalang/loa:0.1.8 AS base

COPY pkg.yml .
COPY .pkg.lock .

RUN loa pkg get -n

COPY . .

RUN loa build GreeterApp/Main

FROM loalang/vm:0.1.8

COPY --from=base /Project/Project.loabin /Project.loabin

CMD ["/Project.loabin"]
