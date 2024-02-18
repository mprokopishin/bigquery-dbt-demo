ARG DBT_VERSION=1.7.0
FROM ghcr.io/dbt-labs/dbt-bigquery:${DBT_VERSION}

RUN set -ex \
    && python -m pip install --upgrade pip setuptools \
    && python -m pip install shandy-sqlfmt[jinjafmt]

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

#COPY .devcontainer/ssh-port-forward /home/$USERNAME/ssh-port-forward
#RUN chmod +x /home/$USERNAME/ssh-port-forward/*
#COPY --chown=$USERNAME --chmod=0600 keyfile.pem /home/$USERNAME/ssh-port-forward/ssh_proxy_key

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

WORKDIR /workspace
