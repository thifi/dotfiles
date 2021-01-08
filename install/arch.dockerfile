FROM archlinux:base-devel

ARG user=itayg
ARG tasks=/tmp/tasks

# --------------

RUN pacman -Sy

# --------------

RUN groupadd -r $user
RUN useradd -r -g $user $user
RUN usermod -aG wheel $user
RUN mkhomedir_helper $user
RUN chsh -s /bin/bash $user
RUN echo "${user}     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV USER=$user
USER $user

RUN touch /home/${user}/.bash_profile

# --------------

WORKDIR $tasks

# COPY tasks/00-prerequisites.sh .
RUN sudo pacman -S stow --noconfirm

COPY ./tasks/01-nix.sh .
RUN ./01-nix.sh