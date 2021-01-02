FROM ubuntu:20.04

ARG user=itayg
ARG tasks=/tmp/tasks

# --------------

ENV TZ=Asia/Jerusalem
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update 
RUN apt-get install -y \
		build-essential \
		curl \
		git \
		ssh \
		pkg-config \
		software-properties-common \
		zip \
		apt-utils \
		sudo

# --------------

RUN groupadd -r $user
RUN useradd -r -g $user $user
RUN usermod -aG sudo $user
RUN mkhomedir_helper $user
RUN chsh -s /bin/bash $user
RUN echo "${user}     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV USER=$user
USER $user

RUN touch /home/${user}/.bash_profile

# --------------

WORKDIR $tasks

COPY tasks/00-prerequisites.sh .
RUN ./00-prerequisites.sh

COPY tasks/01-nix.sh .
RUN ./01-nix.sh

COPY home-manager /home/${user}/dotfiles/home-manager
COPY tasks/02-home-manager.sh .
RUN ./02-home-manager.sh

COPY tasks/03-apt.sh .
RUN ./03-apt.sh

COPY tasks/04-npm.sh .
RUN ./04-npm.sh

COPY tasks/05-vscode.sh .
RUN ./05-vscode.sh

COPY spacemacs /home/${user}/dotfiles/spacemacs
COPY tasks/06-spacemacs.sh .
RUN ./06-spacemacs.sh

COPY alacritty /home/${user}/dotfiles/alacritty
COPY tasks/07-alacritty.sh .
RUN ./07-alacritty.sh .