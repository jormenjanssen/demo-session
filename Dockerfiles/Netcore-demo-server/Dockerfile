FROM mcr.microsoft.com/dotnet/core/sdk:2.2 as build-env
RUN apt-get update && apt-get install -y git
RUN mkdir /app && git clone https://github.com/jormenjanssen/hello-demo-netcore-app.git /app && ls -l
WORKDIR /app/HelloDemo.Server

# Restore packages in build
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
#RUN ls -l /app/HelloDemo.Server/out/

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/sdk:2.2
#ENV PORT 9006
#EXPOSE 9006
WORKDIR /app
COPY --from=build-env /app/HelloDemo.Server/out .
RUN ls -l /app
ENTRYPOINT ["dotnet", "HelloDemo.Server.dll"]