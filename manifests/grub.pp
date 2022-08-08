# @summary GRUB
#
# @api private
#
class gin::grub {
  assert_private()

  $config = lookup({
    'name'          => 'gin::grub',
    'value_type'    => Gin::GRUB,
    'default_value' => {},
  })

  $parameters = deep_merge({
    password_rounds       => 10000,
    boot_without_password => true,
  }, $config)

  case $facts['os']['family'] {
    'Debian': {
      $grub_cfg = '/boot/grub/grub.cfg'
      $grub_cmd = '/usr/sbin/grub-mkconfig'
    }
    default: {
      $grub_cfg = '/boot/grub2/grub.cfg'
      $grub_cmd = '/usr/sbin/grub2-mkconfig'
    }
  }

  $grub_password_file_ensure = $parameters[enable] ? {
    true    => present,
    default => absent,
  }

  $grub2_password_hash = Sensitive.new(grub2_password(
    $parameters[password],
    $parameters[password_salt],
    $parameters[password_rounds]
  ))

  file { '/etc/grub.d/01_password':
    ensure  => $grub_password_file_ensure,
    mode    => '0755',
    content => epp('gin/grub/password.epp', {
      'user'          => $parameters[user],
      'password_hash' => unwrap($grub2_password_hash),
    }),
    notify  => Exec['GRUB password configuration change'],
  }

  file { $grub_cfg:
    owner => 0,
    group => 0,
    mode  => '0600',
  }

  if $parameters[boot_without_password] {
    exec { 'Keep system bootable without credentials':
      command => "/bin/sed -i -e 's/^CLASS=\"\\(.*\\)\"/CLASS=\"\\1 --unrestricted\"/' /etc/grub.d/10_linux;",
      unless  => '/bin/grep -e "^CLASS=" /etc/grub.d/10_linux | /bin/grep -q -- "--unrestricted"',
      notify  => Exec['GRUB password configuration change'],
    }
  }
  else {
    exec { 'Remove addition for keeping system bootable without credentials':
      command => "/bin/sed -i -e 's/^CLASS=\"\\(.*\\) --unrestricted\\(.*\\)\"/CLASS=\"\\1\\2\"/' /etc/grub.d/10_linux;",
      onlyif  => '/bin/grep -e "^CLASS=" /etc/grub.d/10_linux | /bin/grep -q -- "--unrestricted"',
      notify  => Exec['GRUB password configuration change'],
    }
  }

  exec { 'GRUB password configuration change':
    command     => "${grub_cmd} -o ${grub_cfg}",
    refreshonly => true,
  }

  gin::data { 'grub':
    content => {
      'gin::grub' => $parameters,
    },
  }
}
