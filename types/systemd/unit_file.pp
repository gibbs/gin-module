# @see https://github.com/voxpupuli/puppet-systemd/blob/master/manifests/unit_file.pp
type Gin::Systemd::Unit_File = Struct[
  {
    Optional['active']                  => Boolean,
    Optional['content']                 => Variant[String, Sensitive[String], Deferred],
    Optional['daemon_reload']           => Boolean,
    Optional['enable']                  => Variant[Boolean, Enum['mask']],
    Optional['ensure']                  => Enum['present', 'absent', 'file'],
    Optional['group']                   => String,
    Optional['hasstatus']               => Boolean,
    Optional['mode']                    => String,
    Optional['owner']                   => String,
    Optional['path']                    => Stdlib::Absolutepath,
    Optional['restart']                 => String,
    Optional['selinux_ignore_defaults'] => Boolean,
    Optional['show_diff']               => Boolean,
    Optional['source']                  => String,
    Optional['target']                  => Stdlib::Absolutepath,
  }
]
