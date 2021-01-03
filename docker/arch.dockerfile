FROM archlinux:latest

ARG user=itayg
ARG tasks=/tmp/tasks

# --------------

RUN pacman -Sy
RUN pacman -S --noconfirm sudo

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