# @summary SSH
#
# @api private
#
class gin::ssh {
  $config = lookup({
    'name'          => 'gin::ssh',
    'value_type'    => Gin::SSH,
    'default_value' => {},
  })

  $parameters = deep_merge({
    storeconfigs_enabled => false,
    client_options       => {},
    users_client_options => {},
  }, $config)

  class { 'ssh':
    * => $parameters,
  }

  $authorized_keys = lookup({
    'name'          => 'gin::ssh_authorized_keys',
    'value_type'    => Hash[String[1], Gin::SSH::Authorized_Key],
    'default_value' => {},
  })

  $authorized_keys.each |$key, $params| {
    ssh_authorized_key { $key:
      * => deep_merge({
        ensure => 'present',
        type   => 'ssh-rsa',
      }, $params),
    }
  }

  $users = lookup({
    'name'          => 'gin::ssh_users',
    'value_type'    => Hash[String[1], Gin::SSH::Client::Config],
    'default_value' => {},
  })

  $users.each |$user, $params| {
    ssh::client::config::user { "gin-${user}":
      * => deep_merge({
        ensure              => present,
        manage_user_ssh_dir => true,
        user                => $user,
      }, $params),
    }
  }

  gin::data { 'ssh':
    content => {
      'gin::ssh'                 => $parameters,
      'gin::ssh_authorized_keys' => $authorized_keys,
      'gin::ssh_users'           => $users,
    },
  }
}
