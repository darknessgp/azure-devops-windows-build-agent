# escape=`
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

SHELL ["powershell.exe", "-Command"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

RUN choco install -y webdeploy;
RUN choco install -y nuget.commandline;
RUN choco install -y azure-pipelines-agent;

# Install Dac Framework
RUN choco install dacfx-18 -y;

# Install VS 2019 build tools
RUN choco install visualstudio2019buildtools -y --package-parameters "--allWorkloads --passive";

# Install VS 2019 SSDT
RUN choco install visualstudio2019-workload-databuildtools -y --package-parameters "--includeRecommended";

COPY .\scripts scripts

RUN Push-Location $env:temp; `
    Remove-Item $env:temp\* -Recurse -Force -ErrorAction SilentlyContinue; `
    Pop-Location 

CMD ["powershell", "-f", "c:/scripts/run.ps1"]