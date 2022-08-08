# @summary Hosts
#
# @api private
#
class gin::hosts {
  assert_private()

  $hosts = lookup({
    'name'          => 'gin::hosts',
    'value_type'    => Hash[String, Gin::Host],
    'default_value' => {},
  })

  $hosts.each |$host, $parameters| {
    host { $host:
      * => deep_merge({
        ensure => present,
        target => '/etc/hosts',
      }, $parameters),
    }
  }

  gin::data { 'hosts':
    content => {
      'gin::hosts' => $hosts,
    },
  }
}
