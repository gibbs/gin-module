# @summary Docker
#
# @api private
#
class gin::docker {
  assert_private()

  $config = lookup({
    'name'          => 'gin::docker',
    'value_type'    => Gin::Docker,
    'default_value' => {},
  })

  $parameters = deep_merge({
    version          => undef,
  }, $config)

  class { 'docker':
    * => $parameters,
  }

  $compose = lookup({
    'name'          => 'gin::docker_compose',
    'value_type'    => Gin::Docker::Compose,
    'default_value' => {},
  })

  $compose_parameters = deep_merge({
    ensure  => present,
  }, $compose)

  class { 'docker::compose':
    * => $compose_parameters,
  }

  $registries = lookup({
    'name'          => 'gin::docker_registries',
    'value_type'    => Hash[String, Gin::Docker::Registry],
    'default_value' => {},
  })

  $registries.each|$registry, $parameters| {
    docker::registry { $registry:
      * => deep_merge({
        ensure => present,
      }, $parameters),
    }
  }

  $images = lookup({
    'name'          => 'gin::docker_images',
    'value_type'    => Hash[String, Gin::Docker::Image],
    'default_value' => {},
  })

  $images.each |$image, $parameters| {
    docker::image { $image:
      * => deep_merge({
        ensure => present,
      }, $parameters),
    }
  }

  $containers = lookup({
    'name'          => 'gin::docker_run',
    'value_type'    => Hash[String, Gin::Docker::Run],
    'default_value' => {},
  })

  $containers.each |$container, $parameters| {
    $container_parameters = deep_merge({
      detach          => false,
      ensure          => present,
      pull_on_start   => true,
      restart_service => true,
      privileged      => false,
    }, $parameters)

    docker::run { $container:
      * => $container_parameters,
    }
  }

  gin::data { 'docker':
    content => {
      'gin::docker'            => $parameters,
      'gin::docker_compose'    => $compose_parameters,
      'gin::docker_registries' => $registries,
      'gin::docker_images'     => $images,
      'gin::docker_run'        => $containers,
    },
  }
}
