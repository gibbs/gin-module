# @see https://github.com/puppetlabs/puppetlabs-apt/blob/v7.7.1/manifests/source.pp
type Gin::APT::Source = Struct[
  {
    Optional['allow_insecure'] => Boolean,
    Optional['allow_unsigned'] => Boolean,
    Optional['architecture']   => String,
    Optional['comment']        => String,
    Optional['ensure']         => String,
    Optional['include']        => Variant[Hash],
    Optional['key']            => Variant[String, Hash],
    Optional['keyring']        => Stdlib::AbsolutePath,
    Optional['location']       => String,
    Optional['notify_update']  => Boolean,
    Optional['pin']            => Variant[Hash, Numeric, String],
    Optional['release']        => String,
    Optional['repos']          => String,
  }
]
