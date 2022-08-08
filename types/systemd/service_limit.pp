# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.7.0/manifests/service_limits.pp
type Gin::Systemd::Service_Limit = Struct[
  {
    Optional['ensure']                  => Enum['present', 'absent', 'file'],
    Optional['limits']                  => Systemd::ServiceLimits,
    Optional['path']                    => Stdlib::Absolutepath,
    Optional['restart_service']         => Boolean,
    Optional['selinux_ignore_defaults'] => Boolean,
    Optional['source']                  => String,
  }
]
