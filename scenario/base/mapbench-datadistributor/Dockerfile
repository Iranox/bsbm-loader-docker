FROM maven

RUN git clone  https://github.com/Iranox/bsbm-loader.git

WORKDIR bsbm-loader

RUN mvn package -DskipTests

CMD echo "build finish"
