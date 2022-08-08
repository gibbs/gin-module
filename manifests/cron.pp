# @summary at
#
# @api private
#
class gin::cron {
  assert_private()

  $config = lookup({
    'name'          => 'gin::cron',
    'value_type'    => Gin::Cron,
  })

  resources { 'cron':
    purge => $config[purge],
  }

  if !empty($config[mailto]) {
    cron { 'MAILTO':
      environment => sprintf('MAILTO=%s', join($config[mailto], ',')),
      user        => 'root',
      command     => '/usr/bin/true',
      hour        => 12,
      minute      => 0,
      month       => 12,
    }
  }

  # Remove cron deny and create allow file
  if $config[explicit_mode] {
    concat { '/etc/cron.allow':
      ensure => present,
      owner  => 0,
      group  => 0,
      mode   => '0600',
    }

    # Allow root cron jobs
    concat::fragment { 'cron.allow - root':
      target  => '/etc/cron.allow',
      content => "root\n",
      order   => '01',
    }

    # Remove cron.deny - explicitly define users in cron.allow
    file { '/etc/cron.deny':
      ensure => absent,
    }
  }

  file { '/etc/cron.d/':
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0700',
  }

  file { '/etc/crontab':
    ensure => file,
    owner  => 0,
    group  => 0,
    mode   => '0600',
  }

  file { [
    '/etc/cron.hourly/',
    '/etc/cron.daily/',
    '/etc/cron.weekly/',
    '/etc/cron.monthly/',
  ]:
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0600',
  }

  $jobs = lookup({
    'name'          => 'gin::cron_jobs',
    'value_type'    => Hash[String, Gin::Cron::Job],
    'default_value' => {},
  })

  $jobs.each |$job, $parameters| {
    cron { $job:
      * => deep_merge({
        user => 'root',
      }, $parameters),
    }
  }

  gin::data { 'cron':
    content => {
      'gin::cron'      => $config,
      'gin::cron_jobs' => $jobs,
    },
  }
}
