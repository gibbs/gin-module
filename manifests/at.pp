# @summary at
#
# @api private
#
class gin::at {
  assert_private()

  concat { '/etc/at.allow':
    order          => 'alpha',
    owner          => 0,
    group          => 0,
    mode           => '0600',
    ensure_newline => true,
  }

  file { '/etc/at.deny':
    ensure  => absent,
  }

  $config = lookup({
    'name'          => 'gin::at',
    'default_value' => {
      'package_ensure' => 'absent',
      'package_name'   => 'at',
      'service_enable' => false,
      'service_ensure' => 'stopped',
    },
  })

  package { $config[package_name]:
    ensure => $config[package_ensure],
  }

  service { 'atd':
    ensure     => $config[service_ensure],
    enable     => $config[service_enable],
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$config[package_name]],
  }

  $users = lookup({
    'name'          => 'gin::at_users',
    'default_value' => [],
  })

  $users.each |String $user| {
    $user_name = strip($user)
    $safe_name = regsubst($user_name,'/','__')

    concat_fragment { "at+${safe_name}.user":
      target  => '/etc/at.allow',
      content => $user_name,
    }
  }

  gin::data { 'at':
    content => {
      'gin::at'       => $config,
      'gin::at_users' => $users,
    },
  }
}
