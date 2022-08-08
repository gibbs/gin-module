# @see https://github.com/voxpupuli/puppet-systemd/blob/master/manifests/tmpfile.pp
type Gin::Systemd::Tmpfile = Struct[
  {
    Optional['content']  => String,
    Optional['ensure']   => Enum['present', 'absent', 'file'],
    Optional['filename'] => Systemd::Dropin,
    Optional['path']     => Stdlib::Absolutepath,
    Optional['source']   => String,
  }
]
