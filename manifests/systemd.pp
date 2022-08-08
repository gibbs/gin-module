# @summary systemd
#
# @api private
#
class gin::systemd {
  assert_private()

  $config = lookup({
    'name'          => 'gin::systemd',
    'value_type'    => Gin::Systemd,
    'default_value' => {},
  })

  $parameters = deep_merge({
    manage_accounting   => false,
    manage_udevd        => true,
    manage_logind       => true,
    journald_settings   => {
      'SystemKeepFree'     => sprintf('%dM', ($facts[memorysize_mb] * 0.2)),
      'SystemMaxUse'       => sprintf('%dM', ($facts[memorysize_mb] * 0.6)),
      'SystemMaxFileSize'  => sprintf('%dM', (($facts[memorysize_mb] * 0.6) * 0.125)),
      'RuntimeMaxUse'      => sprintf('%dM', ($facts[memorysize_mb] * 0.6)),
      'RuntimeMaxFileSize' => sprintf('%dM', (($facts[memorysize_mb] * 0.6) * 0.125)),
    },
  }, $config)

  class { 'systemd':
    * => $parameters,
  }

  $daemon_reload = lookup({
    'name'          => 'gin::systemd_daemon_reload',
    'value_type'    => Hash[String, Gin::Systemd::Daemon_Reload],
    'default_value' => {},
  })

  $daemon_reload.each |$daemon, $params| {
    systemd::daemon_reload { $daemon:
      * => $params,
    }
  }

  $dropin_files = lookup({
    'name'          => 'gin::systemd_dropin_files',
    'value_type'    => Hash[String, Gin::Systemd::Dropin_File],
    'default_value' => {},
  })

  $dropin_files.each |$dropin_file, $params| {
    systemd::dropin_file { $dropin_file:
      * => $params,
    }
  }

  $modules_load = lookup({
    'name'          => 'gin::systemd_modules_load',
    'value_type'    => Hash[String, Gin::Systemd::Modules_Load],
    'default_value' => {},
  })

  $modules_load.each |$module_load, $params| {
    systemd::modules_load { $module_load:
      * => $params,
    }
  }

  $networks = lookup({
    'name'          => 'gin::systemd_networks',
    'value_type'    => Hash[String, Gin::Systemd::Network],
    'default_value' => {},
  })

  $networks.each |$network, $params| {
    systemd::network { $network:
      * => $params,
    }
  }

  $service_limits = lookup({
    'name'          => 'gin::systemd_service_limits',
    'value_type'    => Hash[String, Gin::Systemd::Service_Limit],
    'default_value' => {},
  })

  $service_limits.each |$service_limit, $params| {
    systemd::service_limits { $service_limit:
      * => $params,
    }
  }

  $timers = lookup({
    'name'          => 'gin::systemd_timers',
    'value_type'    => Hash[String, Gin::Systemd::Timer],
    'default_value' => {},
  })

  $timers.each |$timer, $params| {
    systemd::timer { $timer:
      * => $params,
    }
  }

  $tmpfiles = lookup({
    'name'          => 'gin::systemd_tmpfiles',
    'value_type'    => Hash[String, Gin::Systemd::Tmpfile],
    'default_value' => {},
  })

  $tmpfiles.each |$tmpfile, $params| {
    systemd::tmpfile { $tmpfile:
      * => $params,
    }
  }

  $unit_files = lookup({
    'name'          => 'gin::systemd_units',
    'value_type'    => Hash[String, Gin::Systemd::Unit_File],
    'default_value' => {},
  })

  $unit_files.each |$unit_file, $params| {
    systemd::unit_file { $unit_file:
      * => $params,
    }
  }

  gin::data { 'systemd':
    content => {
      'gin::systemd'                => $parameters,
      'gin::systemd_daemon_reload'  => $daemon_reload,
      'gin::systemd_dropin_files'   => $dropin_files,
      'gin::systemd_modules_load'   => $modules_load,
      'gin::systemd_networks'       => $networks,
      'gin::systemd_service_limits' => $service_limits,
      'gin::systemd_timers'         => $timers,
      'gin::systemd_tmpfiles'       => $tmpfiles,
      'gin::systemd_units'          => $unit_files,
    },
  }
}
