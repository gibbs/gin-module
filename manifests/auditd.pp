# @summary Audit Daemon
#
# @api private
#
class gin::auditd {
  assert_private()

  $config = lookup({
    'name'          => 'gin::auditd',
    'value_type'    => Gin::Auditd,
    'default_value' => {},
  })

  class { 'auditd':
    * => $config,
  }

  $rules = lookup({
    'name'          => 'gin::auditd_rules',
    'value_type'    => Hash[String, Gin::Auditd::Rule],
    'default_value' => {},
  })

  $rules.each |$name, $parameters| {
    auditd::rule { $name:
      * => $parameters,
    }
  }

  gin::data { 'auditd':
    content => {
      'gin::auditd'       => $config,
      'gin::auditd_rules' => $rules,
    },
  }
}
