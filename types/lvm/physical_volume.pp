# @see https://github.com/puppetlabs/puppetlabs-lvm/blob/v1.4.0/manifests/physical_volume.pp
type Gin::LVM::Physical_Volume = Struct[
  {
    Optional['ensure']     => Enum['present', 'absent'],
    Optional['force']      => Boolean,
    Optional['unless_vg']  => Any,
  }
]
