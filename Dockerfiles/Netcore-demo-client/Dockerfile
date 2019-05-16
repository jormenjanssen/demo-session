FROM mcr.microsoft.com/dotnet/core/sdk:2.2 as build-env
RUN apt-get update && apt-get install -y git
RUN mkdir /app && git clone https://github.com/jormenjanssen/hello-demo-netcore-app.git /app && ls -l
WORKDIR /app/HelloDemo.Client

# Restore packages in build
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /app
COPY --from=build-env /app/HelloDemo.Client/out .
ENTRYPOINT ["dotnet", "HelloDemo.Client.dll"]

