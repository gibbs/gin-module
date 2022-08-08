# @see https://github.com/voxpupuli/puppet-systemd/blob/v3.7.0/manifests/network.pp
type Gin::Systemd::Network = Struct[
  {
    Optional['content']         => String,
    Optional['ensure']          => Enum['file', 'absent'],
    Optional['group']           => String,
    Optional['mode']            => String,
    Optional['owner']           => String,
    Optional['path']            => Stdlib::Absolutepath,
    Optional['restart_service'] => Boolean,
    Optional['show_diff']       => Boolean,
    Optional['source']          => String,
    Optional['target']          => Stdlib::Absolutepath,
  }
]
