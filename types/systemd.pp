# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.9.0/manifests/init.pp
type Gin::Systemd = Struct[
  {
    Optional['default_target']           => Pattern['^.+\.target$'],
    Optional['accounting']               => Hash[String,String],
    Optional['service_limits']           => Hash[String[1],Hash[String[1], Any]],
    Optional['networks']                 => Hash[String[1],Hash[String[1], Any]],
    Optional['timers']                   => Hash[String[1],Hash[String[1], Any]],
    Optional['tmpfiles']                 => Hash[String[1],Hash[String[1], Any]],
    Optional['unit_files']               => Hash[String[1],Hash[String[1], Any]],
    Optional['manage_resolved']          => Boolean,
    Optional['resolved_package']         => Enum['systemd-resolved'],
    Optional['resolved_ensure']          => Enum['stopped','running'],
    Optional['dns']                      => Variant[Array[String],String],
    Optional['fallback_dns']             => Variant[Array[String],String],
    Optional['domains']                  => Variant[Array[String],String],
    Optional['llmnr']                    => Variant[Boolean,Enum['resolve']],
    Optional['multicast_dns']            => Variant[Boolean,Enum['resolve']],
    Optional['dnssec']                   => Variant[Boolean,Enum['allow-downgrade']],
    Optional['dnsovertls']               => Variant[Boolean,Enum['yes', 'opportunistic', 'no']],
    Optional['cache']                    => Variant[Boolean,Enum['no-negative']],
    Optional['dns_stub_listener']        => Variant[Boolean,Enum['udp','tcp']],
    Optional['manage_resolv_conf']       => Boolean,
    Optional['use_stub_resolver']        => Boolean,
    Optional['manage_networkd']          => Boolean,
    Optional['networkd_ensure']          => Enum['stopped','running'],
    Optional['manage_timesyncd']         => Boolean,
    Optional['timesyncd_ensure']         => Enum['stopped','running'],
    Optional['ntp_server']               => Variant[Array,String],
    Optional['fallback_ntp_server']      => Variant[Array,String],
    Optional['manage_accounting']        => Boolean,
    Optional['purge_dropin_dirs']        => Boolean,
    Optional['manage_journald']          => Boolean,
    Optional['journald_settings']        => Systemd::JournaldSettings,
    Optional['machine_info_settings']    => Systemd::MachineInfoSettings,
    Optional['manage_udevd']             => Boolean,
    Optional['udev_log']                 => Variant[Integer,String],
    Optional['udev_children_max']        => Integer,
    Optional['udev_exec_delay']          => Integer,
    Optional['udev_event_timeout']       => Integer,
    Optional['udev_resolve_names']       => Enum['early', 'late', 'never'],
    Optional['udev_timeout_signal']      => Variant[Integer,String],
    Optional['manage_logind']            => Boolean,
    Optional['logind_settings']          => Systemd::LogindSettings,
    Optional['manage_all_network_files'] => Boolean,
    Optional['network_path']             => Stdlib::Absolutepath,
    Optional['loginctl_users']           => Hash,
    Optional['dropin_files']             => Hash,
    Optional['udev_rules']               => Hash,
    Optional['manage_coredump']          => Boolean,
    Optional['coredump_settings']        => Systemd::CoredumpSettings,
    Optional['coredump_backtrace']       => Boolean,
    Optional['manage_oomd']              => Boolean,
    Optional['oomd_ensure']              => Enum['stopped','running'],
    Optional['oomd_settings']            => Systemd::OomdSettings,
  }
]