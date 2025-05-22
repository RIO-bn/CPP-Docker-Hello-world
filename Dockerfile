
FROM gcc:latest AS builder
WORKDIR /app
COPY hello.cpp .
RUN gcc -static -o hello hello.cpp


FROM scratch
COPY --from=builder /app/hello /hello
ENTRYPOINT ["/hello"]