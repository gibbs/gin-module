# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.7.0/manifests/dropin_file.pp
type Gin::Systemd::Dropin_File = Struct[
  {
    Optional['content']                 => Variant[String,Sensitive[String]],
    Optional['ensure']                  => Enum['present', 'absent', 'file'],
    Optional['filename']                => Systemd::Dropin,
    Optional['group']                   => String,
    Optional['mode']                    => String,
    Optional['notify_service']          => Boolean,
    Optional['daemon_reload']           => Boolean,
    Optional['owner']                   => String,
    Optional['path']                    => Stdlib::Absolutepath,
    Optional['selinux_ignore_defaults'] => Boolean,
    Optional['show_diff']               => Boolean,
    Optional['source']                  => String,
    Optional['target']                  => Stdlib::Absolutepath,
    Optional['unit']                    => Systemd::Unit,
  }
]
