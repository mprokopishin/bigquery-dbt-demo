# Data-DBT project

Local development using VS Code and Dev Container

* Install [Docker](https://docs.docker.com/engine/install/) 
* Install [VS Code](https://code.visualstudio.com/download)
* Install [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
* Clone this repository
* Copy `.env.example` file to `.env` and add required values there
* For SSH port-forwarding: put your SSH private key in `keyfile.pem`
* In VS Code run the **Dev Containers: Open Folder in Container...** command and select folder with cloned repository
* Run **dbt deps** command in terminal

## Connection to Redshift 

### Connect via VPN
You need to initiate VPN connection outside of container. 
`DB_HOST` and `DB_PORT` env variables should point to DB host and port.

### Connect via SSH port-forwarding
Container has feature to create port-forwarding via ssh-proxy.starofservice.com.
Env variables should be configured following way:
 * `DB_HOST=localhost`
 * `DB_PORT=55439` (or any other not used local port)
 * `DB_HOST_DIRECT=db.host` (replace `db.host` with real hostname of Redshift DB)
 * `DB_PORT_DIRECT=5439`
 * `SSH_USER` should contain username you use to connect to ssh-proxy.starofservice.com

You need to put your private SSH key to `keyfile.pem`
Following commands available in zsh terminal inside container:
* `pf-up` - start port-fowarding. 
* `pf-down` - stop port-forwarding.
* `pf-check` - check port-forwarding status. If port-forwarding is up, it'll print `Master running (pid=xxxx)`
When port-foward is active you will also see it at Ports tab in VS Code
Hint: this port also become available from the host machine, so you can use it from the outside of container if needed.

## TODO:
* Modify schema name generation: currently everythingis running on same schema
* Implement linting with SQLFluff
