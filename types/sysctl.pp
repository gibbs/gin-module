# @see https://github.com/voxpupuli/puppet-augeasproviders_sysctl/blob/2.6.2/lib/puppet/type/sysctl.rb
type Gin::Sysctl = Struct[
  {
    Optional['apply']   => Boolean,
    Optional['ensure']  => Enum['present', 'absent'],
    Optional['persist'] => Boolean,
    Optional['silent']  => Boolean,
    Optional['target']  => Stdlib::Unixpath,
    Optional['value']   => Variant[String, Integer],
  }
]
