# Gin Module

[![CI](https://github.com/gibbs/gin-module/actions/workflows/ci.yaml/badge.svg)](https://github.com/gibbs/gin-module/actions/workflows/ci.yaml)

**This module is not intended to be used as a standard Puppet module.**

Gin is an implementation module with opinionated and generalised defaults.
It is used for managing and enforcing the configuration of basic Linux files, 
packages and services.

For example usage see [Gin Control](#).

## PDK

This module is built and maintained with PDK. Install PDK as a gem or see
[Installing PDK](https://puppet.com/docs/pdk/2.x/pdk_install.html).

```bash
gem install pdk
```

Install the ruby dependencies:

```bash
pdk bundle install
```

## Testing

### Validation and Linting

```bash
pdk bundle exec rake validate
pdk bundle exec rake lint
pdk bundle exec rake rubocop
```

### Spec

As modules are already tested the class spec tests in this repository primarily 
test compilation. Fixtures contain over >40 dependencies so are not cleaned on 
success.

```bash
pdk bundle exec rake spec
```
