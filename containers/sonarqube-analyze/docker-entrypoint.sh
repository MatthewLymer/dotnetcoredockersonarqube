#!/bin/bash

until [ "$(curl --silent --output /dev/null --write-out '%{http_code}' $SonarHostUrl/api/server/version)" -eq "200" ]; do
    echo Waiting for $SonarHostUrl
    sleep 3
done

echo Found $SonarHostUrl, waiting 10 seconds
sleep 10

dotnet sonarscanner begin /k:"MySolution" /d:"sonar.host.url"=$SonarHostUrl
dotnet build $DotnetCoreSlnPath
dotnet sonarscanner end
