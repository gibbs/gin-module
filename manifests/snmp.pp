# @summary SNMP
#
# @api private
#
class gin::snmp {
  assert_private()

  $config = lookup({
    'name'          => 'gin::snmp',
    'value_type'    => Gin::SNMP,
    'default_value' => {},
  })

  $parameters = deep_merge({
    ensure           => 'present',
    service_ensure   => 'running',
  }, $config)

  class { 'snmp':
    * => $parameters,
  }

  $v3_users = lookup({
    'name'          => 'gin::snmp_v3_users',
    'value_type'    => Hash[String, Gin::SNMP::V3_User],
    'default_value' => {},
  })

  $v3_users.each |$v3_user, $parameters| {
    snmp::snmpv3_user { $v3_user:
      * => $parameters,
    }
  }

  gin::data { 'snmp':
    content => {
      'gin::snmp'          => $parameters,
      'gin::snmp_v3_users' => $v3_users,
    },
  }
}
