# Bigquery-DBT-Demo project

Local development using VS Code and Dev Container

* Install [Docker](https://docs.docker.com/engine/install/) 
* Install [VS Code](https://code.visualstudio.com/download)
* Install [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
* Clone this repository
* Copy `.env.example` file to `.env` and add required values there
* In VS Code run the **Dev Containers: Open Folder in Container...** command and select folder with cloned repository
* Run **dbt deps** command in terminal

## TODO:
* Modify schema name generation: currently everythingis running on same schema
* Implement linting with SQLFluff
