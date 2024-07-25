# Pull ruby image
FROM mcr.microsoft.com/devcontainers/ruby:latest

RUN apt update && \
  apt-get install --no-install-recommends -y \
  build-essential

RUN su vscode -c "gem install rails:7.1.3.4"

# sample_appとなっている場所は、好きなプロジェクト名に変更する
WORKDIR "/workspaces/survey_app"
RUN bundle config set --local path vendor/bundle
