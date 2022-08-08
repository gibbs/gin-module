# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.7.0/manifests/timer.pp
type Gin::Systemd::Timer = Struct[
  {
    Optional['active']          => Boolean,
    Optional['daemon_reload']   => Boolean,
    Optional['enable']          => Variant[Boolean, Enum['mask']],
    Optional['ensure']          => Enum['present', 'absent', 'file'],
    Optional['group']           => String[1],
    Optional['mode']            => Stdlib::Filemode,
    Optional['owner']           => String[1],
    Optional['path']            => Stdlib::Absolutepath,
    Optional['service_content'] => String[1],
    Optional['service_source']  => String[1],
    Optional['service_unit']    => Systemd::Unit,
    Optional['show_diff']       => Boolean,
    Optional['timer_content']   => String[1],
    Optional['timer_source']    => String[1],
  }
]
