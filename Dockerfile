FROM ubuntu:latest

MAINTAINER John Weaver <john@saebyn.info>

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y vim git python-pip
RUN pip install flake8

RUN useradd dev
RUN echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN dpkg-reconfigure locales
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8

WORKDIR /home/dev
ENV HOME /home/dev
ENV LC_ALL en_US.UTF-8

RUN chown -R dev:dev $HOME/
USER dev

RUN mkdir -p $HOME/.vim/bundle
ADD vimrc $HOME/.vimrc
ADD bundles.vim $HOME/.vim/bundles.vim
ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein

RUN git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
RUN vim -u $HOME/.vim/bundles.vim +PluginInstall +qall

ENTRYPOINT ["vim"]
