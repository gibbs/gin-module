# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/conf.pp
#
type Gin::APT::Conf = Struct[
  {
    Optional['content']       => String,
    Optional['ensure']        => Enum['present', 'absent'],
    Optional['notify_update'] => Boolean,
    Optional['priority']      => Variant[String, Integer],
  }
]
