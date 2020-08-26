FROM php:7.4.9-cli

LABEL "com.github.actions.name"="StyleCI CLI"
LABEL "com.github.actions.description"="Analyze your PHP, JS and CSS code with StyleCI CLI."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/nathane/styleci-action"
LABEL "homepage"="https://github.com/nathane/styleci-action"
LABEL "maintainer"="Nathanael Esayeas"

RUN apt-get update && apt-get -y install git && rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://github.com/StyleCI/CLI/releases/download/v0.3.1/styleci.phar', 'styleci.phar');"
RUN chmod +x styleci.phar
RUN mv styleci.phar /usr/local/bin/styleci

RUN styleci --version

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]