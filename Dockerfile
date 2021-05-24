FROM ubuntu:20.04
RUN apt update && apt install -y wget apt-transport-https
RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb && apt-get update && apt-get install -y dotnet-sdk-5.0
RUN mkdir /tools && dotnet tool install --tool-path /tools Microsoft.CST.ApplicationInspector.Cli
RUN apt update && apt install -y nodejs
RUN npm i -g @inspektre/inspektre
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
