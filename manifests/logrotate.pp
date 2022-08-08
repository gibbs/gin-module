# @summary logrotate
#
# @api private
#
class gin::logrotate {
  assert_private()

  $config = lookup({
    'name'          => 'gin::logrotate',
    'value_type'    => Gin::Logrotate,
    'default_value' => {},
  })

  $parameters = deep_merge({
    create_base_rules  => true,
    manage_cron_daily  => true,
    manage_cron_hourly => true,
    purge_configdir    => false,
  }, $config)

  class { 'logrotate':
    * => $parameters,
  }

  $rules = lookup({
    'name'          => 'gin::logrotate_rules',
    'value_type'    => Hash[String, Gin::Logrotate::Rule],
    'default_value' => {},
  })

  $rules.each |$name, $parameters| {
    logrotate::rule { $name:
      * => $parameters,
    }
  }

  gin::data { 'logrotate':
    content => {
      'gin::logrotate'       => $parameters,
      'gin::logrotate_rules' => $rules,
    },
  }
}
