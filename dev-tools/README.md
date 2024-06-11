# Pluto Developer Tools

For easier access to Pluto running on your Docker it is recommended to install
the Pluto developer tools.

This allows the following conveniences:

```bash
$ plto console
$ plto log

# Also some convenient shortcuts for interacting with the docker itself:
$ plto up           # bring docker up
$ plto halt         # or take it down
$ plto pristine     # or totally destroy it and set up a fresh one
$ plto ssh          # SSH into your VM
$ plto ssh pwd      # or run an arbitrary shell command on the VM
$ plto guard        # start guard
```

## Installation

```bash
cd docker/dev-tools
chmod +x install
./install
```

## Troubleshooting

Get http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/json: dial unix /var/run/docker.sock: connect: permission denied

Create the docker group.

```bash
sudo groupadd docker
```

Add your user to the docker group.

```bash
sudo usermod -aG docker ${USER}
```

Type the following command to re-evaluated the groups.

```bash
su -s ${USER}
```

Verify that you can run docker commands without sudo.

```bash
docker run hello-world
```

If it doesn't work try to restart your computer.

```bash
reboot
```
