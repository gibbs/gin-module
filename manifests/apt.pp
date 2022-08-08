# @summary APT
#
# @api private
#
# @see https://forge.puppet.com/modules/puppetlabs/apt
#
class gin::apt {
  assert_private()

  if $facts['os']['family'] == 'Debian' {
    Class['apt::update'] -> Package <| provider == 'apt' |>

    $config = lookup({
      'name'          => 'gin::apt',
      'value_type'    => Gin::APT,
      'default_value' => {},
    })

    $parameters = deep_merge({
      root             => '/etc/apt',
      keyserver        => 'keyserver.ubuntu.com',
      manage_auth_conf => true,
    }, $config)

    class { 'apt':
      * => $parameters,
    }

    file { '/var/lib/apt/tmp/':
      ensure => directory,
      mode   => '1770',
      owner  => 0,
      group  => 0,
    }

    $confs = lookup({
      'name'          => 'gin::apt_conf',
      'value_type'    => Hash[String, Gin::APT::Conf],
      'default_value' => {},
    })

    $confs.each |$conf, $parameters| {
      apt::conf { $conf:
        * => $parameters,
      }
    }

    $keys = lookup({
      'name'          => 'gin::apt_keys',
      'value_type'    => Hash[String, Gin::APT::Key],
      'default_value' => {},
    })

    $keys.each |$key, $parameters| {
      apt::key { $key:
        * => $parameters,
      }
    }

    $marks = lookup({
      'name'          => 'gin::apt_marks',
      'value_type'    => Hash[String, Gin::APT::Mark],
      'default_value' => {},
    })

    $marks.each |$mark, $parameters| {
      apt::mark { $mark:
        * => $parameters,
      }
    }

    $pins = lookup({
      'name'          => 'gin::apt_pins',
      'value_type'    => Hash[String, Gin::APT::Pin],
      'default_value' => {},
    })

    $pins.each |$pin, $parameters| {
      apt::pin { $pin:
        * => $parameters,
      }
    }

    $ppas = lookup({
      'name'          => 'gin::apt_ppas',
      'value_type'    => Hash[String, Gin::APT::PPA],
      'default_value' => {},
    })

    if $facts['os']['name'] != 'Debian' {
      $ppas.each |$ppa, $parameters| {
        apt::ppa { $ppa:
          * => $parameters,
        }
      }
    }

    $settings = lookup({
      'name'          => 'gin::apt_settings',
      'value_type'    => Hash[String, Gin::APT::Setting],
      'default_value' => {},
    })

    $settings.each |$setting, $parameters| {
      apt::setting { $setting:
        * => $parameters,
      }
    }

    $sources = lookup({
      'name'          => 'gin::apt_sources',
      'value_type'    => Hash[String, Gin::APT::Source],
      'default_value' => {},
    })

    $sources.each |$source, $parameters| {
      # lint:ignore:spaceship_operator_without_tag
      Apt::Source[$source] -> Package <| |>
      # lint:endignore

      apt::source { $source:
        * => $parameters,
      }
    }

    gin::data { 'apt':
      content => {
        'gin::apt'          => $parameters,
        'gin::apt_conf'     => $confs,
        'gin::apt_keys'     => $keys,
        'gin::apt_pins'     => $pins,
        'gin::apt_ppas'     => $ppas,
        'gin::apt_settings' => $settings,
        'gin::apt_sources'  => $sources,
      },
    }
  }
}
