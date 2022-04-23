FROM dockerhub.aicloud.io/isi-dingning-test/mvn:latest AS builder
WORKDIR /tmp
COPY . .
RUN mvn --no-transfer-progress verify package


FROM dockerhub.aicloud.io/isi-dingning-test/openjdk-11
COPY --from=builder /tmp/target/nationalparks.jar /opt
CMD java -jar /opt/nationalparks.jar
EXPOSE 8080
