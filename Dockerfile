FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget yarn && yarn
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y apt-transport-https && apt-get update && apt-get install -y dotnet-sdk-3.1
RUN dotnet tool install --tool-path /tools Microsoft.CST.ApplicationInspector.Cli
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
