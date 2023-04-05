# StyleCI

Analyze your PHP, JS and CSS code with StyleCI CLI.

> Requires an account that has access to **StyleCI Pro** features.

## Setup

1. Find you StyleCI API key, available at <https://github.styleci.io/profile>.
2. Go to your repo's secret settings `https://github.com/{user}/{repo}/settings/secrets/new`
3. Add a new secret. (eg. **name**:`STYLECI_API_KEY` **value**:`Your-StyleCI-API-Key`)

### Usage

`.github/workflows/styleci.yml`

```yml
name: StyleCI
on: [push, pull_request]
jobs:
  Analyze:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout Repo
      uses: actions/checkout@v2
    - name: Setup PHP
      uses: shivammathur/setup-php@v2
      with:
        php-version: "7.4"
        extensions: curl
    - name: analyze code with StyleCI
      uses: ghostwriter/styleci-action@main
      with:
        styleci_api_key: ${{ secrets.STYLECI_API_KEY }} # required
        # options: '--no-interaction --dry-run'         # optional
        # directory: './'                               # optional
```

### Docker

```yml
docker pull ghcr.io/ghostwriter/styleci:latest
```

```yml
FROM ghcr.io/ghostwriter/styleci:latest
```

```yml
docker pull ghcr.io/ghostwriter/styleci:v1.5.0
FROM ghcr.io/ghostwriter/styleci:v1.5.0
```

### StyleCI CLI

```bash
Usage:
  analyze [options] [--] [<directory>]

Arguments:
  directory

Options:
  -c, --only-changed
  -d, --dry-run
  -g, --git-binary=GIT-BINARY
  -r, --remote-name=REMOTE-NAME
  -h, --help                     Display this help message
  -q, --quiet                    Do not output any message
  -V, --version                  Display this application version
      --ansi                     Force ANSI output
      --no-ansi                  Disable ANSI output
  -n, --no-interaction           Do not ask any interactive question
  -v|vv|vvv, --verbose           Increase the verbosity of messages
```
