# Azure Pipelines Agent Docker Image

This repository contains `Dockerfile` definition

## Configuration

You need to set these environment variables:

* `AZP_URL` - The Azure DevOps tenant URL. aka dev.azure.com\XXX. Required
* `AZP_TOKEN` - The personal access token from Azure Pipelines. Required
* `AZP_AGENT_NAME` - The name of the agent. Required
* `AZP_POOL` - The agent pool. Optional. Default value: `Default`

## Running

On Windows, use Docker for Windows and run, on PowerShell:

````powershell
docker run -d --name build01 -ti -e AZP_URL=https://dev.azure.com/XXX -e AZP_TOKEN=TOKEN -e AZP_POOL=Default -e AZP_AGENT_NAME=BuildAgent01 darknessgp/azure-devops-windows-build-agent
````