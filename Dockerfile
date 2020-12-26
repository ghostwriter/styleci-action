FROM ghcr.io/nathane/php:7.4-base

LABEL "com.github.actions.name"="StyleCI CLI"
LABEL "com.github.actions.description"="Analyze your PHP, JS and CSS code with StyleCI CLI."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/nathane/styleci-action"
LABEL "homepage"="https://github.com/nathane/styleci-action"
LABEL "maintainer"="Nathanael Esayeas"

ENV PATH vendor/bin:$HOME/.composer/vendor/bin:$PATH

RUN composer global require styleci/cli:^1.0

RUN styleci --version

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]