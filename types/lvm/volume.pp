# @see https://github.com/puppetlabs/puppetlabs-lvm/blob/v1.4.0/manifests/volume.pp
type Gin::LVM::Volume = Struct[
  {
    Optional['ensure']       => Enum['cleaned', 'absent', 'present'],
    Optional['pv']           => Stdlib::Absolutepath,
    Optional['vg']           => String,
    Optional['fstype']       => String,
    Optional['size']         => Any,
    Optional['extents']      => Any,
    Optional['initial_size'] => Any,
  }
]
