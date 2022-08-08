# @summary login.defs management
#
# @api private
#
class gin::login_defs {
  assert_private()

  $config = lookup({
    'name'          => 'gin::login_defs',
    'value_type'    => Gin::Login_Defs,
    'default_value' => {},
  })

  $parameters = deep_merge({
    package_manage => false,
  }, $config)

  class { 'login_defs':
    * => $parameters,
  }

  gin::data { 'login_defs':
    content => {
      'gin::login_defs' => $parameters,
    },
  }
}
