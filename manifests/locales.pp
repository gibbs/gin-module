# @summary Locales
#
# @api private
#
class gin::locales {
  assert_private()

  $config = lookup({
    'name'          => 'gin::locales',
    'value_type'    => Gin::Locales,
    'default_value' => {},
  })

  class { 'locales':
    * => $config,
  }

  gin::data { 'locales':
    content => {
      'gin::locales' => $config,
    },
  }
}
