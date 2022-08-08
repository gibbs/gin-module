# @summary RedHat Subscription Management
#
# @api private
#
class gin::rhsm {
  assert_private()

  if $facts['os']['family'] == 'RedHat' {
    $config = lookup({
      'name'          => 'gin::rhsm',
      'value_type'    => Gin::Rhsm,
      'default_value' => {},
    })

    class { 'rhsm':
      * => $config,
    }

    gin::data { 'rhsm':
      content => {
        'gin::rhsm' => $config,
      },
    }
  }
}
