# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/pin.pp
type Gin::APT::Pin = Struct[
  {
    Optional['codename']        => String,
    Optional['component']       => String,
    Optional['ensure']          => Enum['file', 'present', 'absent'],
    Optional['explanation']     => String,
    Optional['label']           => String,
    Optional['order']           => Variant[Integer],
    Optional['origin']          => String,
    Optional['originator']      => String,
    Optional['packages']        => Variant[String, Array],
    Optional['priority']        => Variant[Numeric, String],
    Optional['release']         => String,
    Optional['release_version'] => String,
    Optional['version']         => String,
  }
]
