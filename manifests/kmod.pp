# @summary Kernel modules
#
# @api private
#
class gin::kmod {
  assert_private()

  $config = lookup({
    'name'          => 'gin::kmod',
    'value_type'    => Gin::Kmod,
    'default_value' => {},
  })

  class { 'kmod':
    * => $config,
  }

  gin::data { 'kmod':
    content => {
      'gin::kmod' => $config,
    },
  }
}
