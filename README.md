## How to deploy

Below is explained how to connect directly to your Koyeb instance through VSCode.

By following this readme, you will be able to deploy a Koyeb service on a GPU instance and establish a connection from the Koyeb service to your VSCode editor.

The Koyeb service will comes with Docker running allowing you to build and run containers leveraging the GPU.

### Deploy to Koyeb

Let's get started by creating the service to Koyeb by clicking the button below:

[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?name=devbox&type=git&repository=edouardb%2Fdevbox-test&branch=main&builder=dockerfile&dockerfile=.%2FDockerfile&privileged=true&service_type=worker&instance_type=gpu-nvidia-a100&env%5BVSC_NODE_NAME%5D=gpu-box&env%5BVSCODE_CLI_DISABLE_KEYCHAIN_ENCRYPT%5D=1&env%5BVSCODE_CLI_USE_FILE_KEYRING%5D=1&volume_size[user-data]=100&volume_path[user-data]=/home/dev&volume_size)

### Configuring VSCode for remote development

To connect your VSCode editor to the Koyeb service, follow the instructions displayed in the logs once the first deployment is healthy.

```
....
*
* Visual Studio Code Server
*
* By using the software, you agree to
* the Visual Studio Code Server License Terms (https://aka.ms/vscode-server-license) and
* the Microsoft Privacy Statement (https://privacy.microsoft.com/en-US/privacystatement).
*
[2024-11-07 14:52:49] info Using GitHub for authentication, run `code tunnel user login --provider <provider>` option to change this.
To grant access to the server, please log into https://github.com/login/device and use code C98F-F1F6
...
```

1. Go to [https://github.com/login/device](https://github.com/login/device).
2. Register the service by entering the code displayed in the logs.

_This operation is just required once._

### Connect VSCode to the Koyeb Service

> Make sure you have the [Remote - Tunnels](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-server) extension installed.

On your machine, open VSCode and press `cmd + shift + p` (Mac) or `ctrl + shift + p` (Windows/Linux) to open the command palette.

Run the command `Connect To Tunnel...`, then choose `GitHub` as the account type to start the tunnel.
Your Koyeb service will appear in the list of available devices. Select it to instantiate a VSCode instance running on the remote Koyeb service.

Enjoy!
