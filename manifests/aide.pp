# @summary AIDE
#
# @api private
#
class gin::aide {
  assert_private()

  file { [
    '/etc/aide/',
    '/var/log/aide/',
    '/var/lib/aide/',
  ]:
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0755',
  }

  $config = lookup({
    'name'          => 'gin::aide',
    'value_type'    => Gin::AIDE,
    'default_value' => {},
  })

  class { 'aide':
    * => $config,
  }

  $rules = lookup({
    'name'          => 'gin::aide_rules',
    'value_type'    => Hash[String, Gin::AIDE::Rule],
    'default_value' => {},
  })

  $rules.each |$name, $parameters| {
    aide::rule { $name:
      * => deep_merge({
        rules => 'p+md5',
      }, $parameters),
    }
  }

  $watchers = lookup({
    'name'          => 'gin::aide_watch',
    'value_type'    => Hash[String, Gin::AIDE::Watch],
    'default_value' => {},
  })

  $watchers.each |$watch, $parameters| {
    aide::watch { "aide_${watch}":
      * => deep_merge({
        rules => 'p+md5',
      }, $parameters),
    }
  }

  gin::data { 'aide':
    content => {
      'gin::aide'       => $config,
      'gin::aide_rules' => $rules,
      'gin::aide_watch' => $watchers,
    },
  }
}
