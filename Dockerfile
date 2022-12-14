# Bootstrapped from https://github.com/LiveOverflow/pwn_docker_example/blob/master/ctf/Dockerfile
# Thanks, LiveOverflow!
###


# Build the docker container -> build.sh
# Run the docker container -> run.sh
# Get a shell in the container -> shell.sh

FROM ubuntu:21.04
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
COPY dot_rizinrc /root/.rizinrc
#COPY dot_bashrc /root/.bashrc
RUN apt-get update && \
apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools \
  vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps \
  libpcre3-dev libdb-dev libxt-dev libxaw7-dev emacs-nox tmux && \
pip install capstone requests pwntools r2pipe keystone-engine unicorn ropper meson ninja && \
mkdir /tools && \
cd /tools && git clone https://github.com/JonathanSalwan/ROPgadget && \
cd /tools && git clone https://github.com/niklasb/libc-database && \
cd /tools && git clone https://github.com/hugsy/gef && \
wget -O /root/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py && \
echo source /root/.gdbinit-gef.py >> /root/.gdbinit && \ 
cd /tools && git clone --recurse-submodules https://github.com/rizinorg/rizin && \
cd rizin && meson build && ninja -C build && ninja -C build install