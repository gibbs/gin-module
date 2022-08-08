# @summary Lynis auditing tool
#
# @api private
#
class gin::lynis {
  assert_private()

  $config = lookup({
    'name'          => 'gin::lynis',
    'value_type'    => Gin::Archive,
    'default_value' => {},
  })

  $parameters = deep_merge({
    ensure        => present,
    user          => 0,
    group         => 0,
  }, $config)

  archive { 'gin-lynis':
    * => $parameters,
  }

  gin::data { 'lynis':
    content => {
      'gin::lynis' => $parameters,
    },
  }
}
