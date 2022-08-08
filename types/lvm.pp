# @see https://github.com/puppetlabs/puppetlabs-lvm/blob/v1.4.0/manifests/init.pp
type Gin::LVM = Struct[
  {
    Optional['package_ensure'] => Enum['installed', 'present', 'latest', 'absent'],
    Optional['manage_pkg']     => Boolean,
    Optional['volume_groups']  => Hash,
  }
]
