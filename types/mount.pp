# @see https://github.com/puppetlabs/puppetlabs-mount_core/blob/v1.1.0/REFERENCE.md
type Gin::Mount = Struct[
  {
    Optional['atboot']      => Any,
    Optional['blockdevice'] => Any,
    Optional['device']      => Any,
    Optional['dump']        => Enum['0', '1', '2'],
    Optional['ensure']      => Enum['defined', 'present', 'unmounted', 'absent', 'mounted'],
    Optional['fstype']      => Any,
    Optional['name']        => Any,
    Optional['options']     => String,
    Optional['pass']        => Any,
    Optional['provider']    => Any,
    Optional['remounts']    => Boolean,
    Optional['target']      => Any,
  }
]
