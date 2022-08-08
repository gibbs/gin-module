# @summary users
#
# @api private
#
class gin::users {
  assert_private()

  $groups = lookup({
    'name'          => 'gin::groups',
    'value_type'    => Hash[String, Accounts::Group::Resource],
    'default_value' => {},
  })

  create_resources('group', $groups)

  $users = lookup({
    'name'          => 'gin::users',
    'value_type'    => Hash[String, Gin::Accounts::User],
    'default_value' => {},
  })

  $users.each |$user, $parameters| {
    $user_parameters = deep_merge({
      allowdupe                => false,
      create_group             => true,
      cron                     => false,
      ensure                   => present,
      home                     => "/home/${user}",
      home_mode                => '0710',
      ignore_password_if_empty => true,
      locked                   => true,
      managehome               => true,
      managevim                => true,
      password                 => '!!',
      password_hash            => undef,
      password_max_age         => 30,
      purge_sshkeys            => true,
      system                   => false,
    }, $parameters)

    # Use password hash or generate one
    if ($user_parameters[password_hash] and $user_parameters[password] == '!!') {
      $merge_override = merge($user_parameters, {
        password => $user_parameters[password_hash]
      })
    }
    else {
      $salt = seeded_rand_string(32, $user, 'abcdefghijklmnopqrstuvwxyz0123456789')

      # Overwrite merge to hash supplied password. This avoids users having to
      # generate their own via utilities such as mkpasswd
      $merge_override = merge($user_parameters, {
        password => pw_hash($user_parameters[password], 'SHA-512', $salt),
      })
    }

    accounts::user { $user:
      * => $merge_override - ['cron', 'password_hash'],
    }

    if ($user_parameters[system] != true) {
      if ($user_parameters[locked] and $user_parameters[ensure] == 'present') {
        file { "${user_parameters[home]}/.hushlogin":
          ensure => file,
          mode   => '0600',
          owner  => 'root',
          group  => 'root',
        }
      }
      else {
        file { "${user_parameters[home]}/.hushlogin":
          ensure => absent,
        }
      }

      if ($user_parameters[ensure] == 'present') {
        ssh_keygen { $user:
          home => $user_parameters[home],
          type => 'rsa',
          bits => 4096,
        }

        if $user_parameters[cron] == true {
          concat::fragment { "cron.allow - ${user}":
            target  => '/etc/cron.allow',
            content => "${user}\n",
          }
        }
      }
    }
  }

  gin::data { 'users':
    content => {
      'gin::users'  => $users,
      'gin::groups' => $groups,
    },
  }
}
