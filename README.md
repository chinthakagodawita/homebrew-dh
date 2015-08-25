# homebrew-dh
A homebrew formula for the [docker-helpers](https://github.com/chinthakagodawita/docker-helpers) package.

This installs all dependencies required by `docker-helpers`.

Where necessary (e.g. with `brew cask` packages such as _vagrant_), dependencies are managed directly in `docker-helpers`.

This also includes a formula for the docker machine branch of [dinghy](https://github.com/codekitchen/dinghy).

## To use:
```bash
brew tap chinthakagodawita/homebrew-dh

```

then:
```bash
brew install docker-helpers
```

or for the experimental version
```bash
brew install --HEAD docker-helpers
```
