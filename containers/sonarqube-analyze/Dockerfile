FROM microsoft/dotnet:2.1-sdk

WORKDIR /app

# the sonarqube runner needs java
RUN apt-get update && apt-get install -y --no-install-recommends default-jre

COPY ./src ./src
COPY ./dotnetcoredockersonarqube.sln ./
COPY ./containers/sonarqube-analyze/docker-entrypoint.sh /usr/local/bin/

# https://github.com/dotnet/dotnet-docker/issues/520
ENV PATH "$PATH:/root/.dotnet/tools"

ENV SonarHostUrl "http://sonarqube:9000"
ENV DotnetCoreSlnPath "/app/dotnetcoredockersonarqube.sln"
ENV DotnetCoreSlnName "MySolution"

RUN dotnet tool install --global dotnet-sonarscanner

ENTRYPOINT ["docker-entrypoint.sh"]
