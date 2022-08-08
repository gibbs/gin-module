# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/setting.pp
type Gin::APT::Setting = Struct[
  {
    Optional['content']       => String,
    Optional['ensure']        => Enum['file', 'present', 'absent'],
    Optional['notify_update'] => Boolean,
    Optional['priority']      => Variant[String, Integer, Array],
    Optional['source']        => String,
  }
]
