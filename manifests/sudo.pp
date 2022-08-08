# @summary sudo and sudoers management
#
# @api private
#
# @see https://forge.puppet.com/saz/sudo
#
class gin::sudo {
  assert_private()

  $config = lookup({
    'name'          => 'gin::sudo',
    'value_type'    => Gin::Sudo,
    'default_value' => {},
  })

  class { 'sudo':
    * => deep_merge({
      content => 'gin/sudo/sudoers.erb',
    }, $config),
  }

  $sudoers = lookup({
    'name'          => 'gin::sudoers',
    'value_type'    => Hash[String, Gin::Sudo::Conf],
    'default_value' => {},
  })

  $sudoers.each |$sudoer, $parameters| {
    sudo::conf { $sudoer:
      * => deep_merge({
        priority => 60,
      }, $parameters),
    }
  }

  gin::data { 'sudo':
    content => {
      'gin::sudo'    => $config,
      'gin::sudoers' => $sudoers,
    },
  }
}
