# @see https://github.com/voxpupuli/puppet-yum/blob/v5.6.1/manifests/gpgkey.pp
type Gin::YUM::GPG_Key = Struct[
  {
    Optional['content'] => String,
    Optional['ensure']  => Enum['present', 'absent'],
    Optional['group']   => String,
    Optional['mode']    => String,
    Optional['owner']   => String,
    Optional['path']    => String,
    Optional['source']  => String,
  }
]
