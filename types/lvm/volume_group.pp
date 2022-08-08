# @see https://github.com/puppetlabs/puppetlabs-lvm/blob/v1.4.0/manifests/volume_group.pp
type Gin::LVM::Volume_Group = Struct[
  {
    Optional['physical_volumes'] => Variant[Hash, Array, String],
    Optional['createonly']       => Boolean,
    Optional['ensure']           => Enum['present', 'absent'],
    Optional['logical_volumes']  => Hash,
    Optional['followsymlinks']   => Boolean,
  }
]
