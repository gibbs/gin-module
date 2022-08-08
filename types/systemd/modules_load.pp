# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.7.0/manifests/modules_load.pp
type Gin::Systemd::Modules_Load = Struct[
  {
    Optional['content']  => String[1],
    Optional['ensure']   => Enum['present', 'absent', 'file'],
    Optional['filename'] => Systemd::Dropin,
    Optional['path']     => Stdlib::Absolutepath,
    Optional['source']   => String[1],
  }
]
