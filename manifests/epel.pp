# @summary EPEL
#
# @api private
#
class gin::epel {
  assert_private()

  $config = lookup({
    'name'          => 'gin::epel',
    'value_type'    => Gin::EPEL,
    'default_value' => {},
  })

  if $facts['os']['family'] == 'RedHat' {
    class { 'epel':
      * => $config,
    }

    gin::data { 'epel':
      content => {
        'gin::epel' => $config,
      },
    }
  }
}
