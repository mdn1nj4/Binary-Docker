# Binary-Docker
Docker container that has all the CLI tooling for binary exploitation (thanks to @sogonsec)

## Build Docker Image
```bash
docker build -t pwnbox .
```
## Create a Container
After stop container will delete automatically.
```bash
docker run --rm -v "$(pwd)/host:/host" -v "$(pwd)/logs:/logs" --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name pwnbox -i pwnbox
```
Dont want to delete the container kindly remove --rm before create a container.

## Pwnbox Shell 
```bash
docker exec -it pwnbox /bin/bash
```
