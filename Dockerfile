FROM mcr.microsoft.com/dotnet/sdk:5.0
RUN mkdir /tools && dotnet tool install --tool-path /tools Microsoft.CST.ApplicationInspector.Cli
RUN apt update && apt install -y nodejs
RUN npm i -g @inspektre/inspektre
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
