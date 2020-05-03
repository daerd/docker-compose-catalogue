FROM elixir:1.10.3

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client

# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x -o node_source_setup.sh
RUN bash node_source_setup.sh
RUN apt-get install nodejs

WORKDIR /app
EXPOSE 4000