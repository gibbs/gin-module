# @summary rkhunter
#
# @api private
#
class gin::rkhunter {
  assert_private()

  $config = lookup({
    'name'          => 'gin::rkhunter',
    'value_type'    => Gin::Rkhunter,
    'default_value' => {},
  })

  $parameters = deep_merge({
    allow_ssh_root_user => 'no',
  }, $config)

  class { 'rkhunter':
    * => $parameters,
  }

  gin::data { 'rkhunter':
    content => {
      'gin::rkhunter' => $config,
    },
  }
}
