# @see https://github.com/voxpupuli/puppet-yum/blob/v5.6.1/manifests/plugin.pp
type Gin::YUM::Plugin = Struct[
  {
    Optional['ensure']     => Enum['present', 'absent'],
    Optional['pkg_name']   => String,
    Optional['pkg_prefix'] => String,
  }
]
