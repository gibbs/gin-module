# @summary sysctl
#
# @api private
#
class gin::sysctl {
  assert_private()

  $sysctl = lookup({
    'name'          => 'gin::sysctl',
    'value_type'    => Hash[String, Gin::Sysctl],
    'default_value' => {},
  })

  $sysctl.each |$host, $parameters| {
    sysctl { $host:
      * => deep_merge({
        ensure => present,
      }, $parameters),
    }
  }

  gin::data { 'sysctl':
    content => {
      'gin::sysctl' => $sysctl,
    },
  }
}
