# @see https://github.com/puppetlabs/puppetlabs-host_core/blob/main/REFERENCE.md
type Gin::Host = Struct[
  {
    Optional['comment']      => String,
    Optional['ensure']       => Enum['present', 'absent'],
    Optional['host_aliases'] => Variant[String, Array],
    Optional['ip']           => Stdlib::IP::Address,
    Optional['target']       => Stdlib::Unixpath,
  }
]
