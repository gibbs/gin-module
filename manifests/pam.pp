# @summary PAM
#
# @api private
#
class gin::pam {
  assert_private()

  $config = lookup({
    'name'          => 'gin::pam',
    'value_type'    => Gin::PAM,
    'default_value' => {},
  })

  $parameters = deep_merge({
    manage_nsswitch => false,
  }, $config)

  class { 'pam':
    * => $parameters,
  }

  $services = lookup({
    'name'          => 'gin::pam_services',
    'value_type'    => Hash[String, Gin::PAM::Service],
    'default_value' => {},
  })

  $services.each |$service, $parameters| {
    pam::service { $service:
      * => $parameters,
    }
  }

  gin::data { 'pam':
    content => {
      'gin::pam'          => $parameters,
      'gin::pam_services' => $services,
    },
  }
}
