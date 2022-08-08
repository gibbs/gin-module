# @summary Timezone
#
# @api private
#
class gin::timezone {
  assert_private()

  $config = lookup({
    'name'          => 'gin::timezone',
    'value_type'    => Gin::Timezone,
    'default_value' => {},
  })

  class { 'timezone':
    * => $config,
  }

  gin::data { 'timezone':
    content => {
      'gin::timezone' => $config,
    },
  }
}
