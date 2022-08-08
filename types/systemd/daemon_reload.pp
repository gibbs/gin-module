# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.10.0/manifests/daemon_reload.pp
type Gin::Systemd::Daemon_Reload = Struct[
  {
    Optional['enable'] => Boolean,
  }
]
