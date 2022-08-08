# @summary MOTD
#
# @api private
#
class gin::motd {
  assert_private()

  $config = lookup({
    'name'          => 'gin::motd',
    'value_type'    => Gin::MOTD,
    'default_value' => {
      'issue_content'       => '',
      'disable_update_motd' => [],
    },
  })

  file { '/etc/motd':
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }

  file { '/etc/issue':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => $config['issue_content'],
  }

  file { '/etc/issue.net':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => $config['issue_content'],
    require => File['/etc/issue'],
  }

  if $facts[os][family] == 'Debian' {
    file { '/etc/update-motd.d/':
      ensure => directory,
      owner  => 0,
      group  => 0,
      mode   => '0755',
    }

    file { '/etc/update-motd.d/99-legal':
      ensure    => file,
      owner     => 0,
      group     => 0,
      mode      => '0755',
      content   => sprintf("#!/bin/bash\n\nprintf \"%s\n\n\"", $config['issue_content']),
      subscribe => File['/etc/update-motd.d/'],
    }

    file { '/var/tmp/gin-update-motd-hash':
      ensure    => file,
      content   => sha1(join($config['disable_update_motd'], ',')),
      owner     => 0,
      group     => 0,
      mode      => '0755',
      show_diff => false,
    }

    exec { 'update-motd.d permissions update':
      command     => 'chmod +x /etc/update-motd.d/*',
      provider    => 'shell',
      subscribe   => File['/var/tmp/gin-update-motd-hash'],
      refreshonly => true,
      notify      => File[$config['disable_update_motd']],
    }

    file { $config['disable_update_motd']:
      ensure    => file,
      mode      => '0644',
      subscribe => Exec['update-motd.d permissions update'],
    }
  }

  gin::data { 'motd':
    content => {
      'gin::motd' => $config,
    },
  }
}
