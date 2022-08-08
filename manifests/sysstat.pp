# @summary sysstat
#
# @api private
#
class gin::sysstat {
  assert_private()

  $config = lookup({
    'name'          => 'gin::sysstat',
    'value_type'    => Gin::Sysstat,
    'default_value' => {},
  })

  class { 'sysstat':
    * => $config,
  }

  gin::data { 'sysstat':
    content => {
      'gin::sysstat' => $config,
    },
  }
}
