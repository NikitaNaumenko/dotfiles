FROM alpine:latest

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN apk update && apk upgrade

RUN apk add --no-cache build-base \
    git \
    curl \
    wget \
    bash \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    libffi \
    openssl-dev \
    libffi-dev \
    python3 \
    py-pip \
    python2-dev \
    python3-dev \
    ruby \
    ruby-dev \
    ruby-bundler \
    ruby-json \
    ruby-irb \
    ruby-rake \
    ruby-bigdecimal \
    inotify-tools \
    elixir \
    erlang \
    erlang-inets \
    erlang-ssl \
    neovim \
    tidyhtml \
    the_silver_searcher \
    nodejs \
    nodejs-npm

RUN npm config set unsafe-perm true
RUN npm install -g typescript vale
RUN npm install -g eslint babel-eslint \
      eslint-config-airbnb eslint-plugin-jest eslint-plugin-flowtype \
      eslint-plugin-babel eslint-plugin-import eslint-plugin-lodash-fp \
      eslint-plugin-jsx-a11y eslint-plugin-react eslint-config-airbnb-base
RUN npm install -g yaml-language-server typings pug-lint js-yaml js-beautify jsonlint neovim
RUN npm install -g stylelint stylelint-config-recommended

RUN gem install pkg-config solargraph --no-document -- --use-system-libraries
RUN solargraph download-core
RUN gem install rubocop rubocop-rspec rubocop-performance --no-document
RUN gem install haml-lint slim_lint rake neovim --no-document

RUN pip install yamllint ansible-lint python-language-server bashate neovim jedi rope isort

RUN wget -qO- -O ~/elixir-ls.zip https://github.com/JakeBecker/elixir-ls/releases/download/v0.2.24/elixir-ls.zip \
      && mkdir ~/elixir-ls \
      && unzip ~/elixir-ls.zip -d ~/elixir-ls

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
      && ~/.fzf/install --key-bindings --update-rc --completion \
      && cp /root/.fzf/bin/fzf /usr/local/bin

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY vim/vimrc /root/.config/nvim/init.vim
COPY entrypoint.sh /usr/local/bin/

RUN nvim -i NONE -c PlugInstall -c quitall

ENV FZF_DEFAULT_COMMAND 'ag -g ""'
ENV WORKSPACE /app

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
