FROM dockerhub.aicloud.io/isi-dingning-test/mvn:latest AS builder
WORKDIR /tmp
COPY . .
RUN mvn --no-transfer-progress verify package


FROM registry.access.redhat.com/ubi8/openjdk-11@sha256:ce5c0becf829aca80734b4caf3ab6b76cb00f7d78f4e39fb136636a764dea7f6
COPY --from=builder /tmp/target/nationalparks.jar /opt
CMD java -jar /opt/nationalparks.jar
EXPOSE 8080
