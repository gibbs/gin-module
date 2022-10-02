# @summary nsswitch.conf configuration
#
# @api private
#
class gin::nsswitch {
  assert_private()

  $config = lookup({
    'name'          => 'gin::nsswitch',
    'value_type'    => Gin::Nsswitch,
    'default_value' => {},
  })

  class { 'nsswitch':
    * => $config,
  }

  gin::data { 'nsswitch':
    content => {
      'gin::nsswitch' => $config,
    },
  }
}
