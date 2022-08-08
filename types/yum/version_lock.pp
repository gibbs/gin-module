# @see https://github.com/voxpupuli/puppet-yum/blob/v5.6.1/manifests/versionlock.pp
type Gin::YUM::Version_Lock = Struct[
  {
    Optional['arch']    => Variant[Yum::RpmArch, Enum['*']],
    Optional['ensure']  => Enum['present', 'absent', 'exclude'],
    Optional['epoch']   => Integer[0],
    Optional['release'] => Yum::RpmRelease,
    Optional['version'] => Yum::RpmVersion,
  }
]
