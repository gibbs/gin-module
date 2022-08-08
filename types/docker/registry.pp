# @see https://github.com/puppetlabs/puppetlabs-docker/blob/v4.4.0/manifests/registry.pp
#
type Gin::Docker::Registry = Struct[
  {
    Optional['server']          => String,
    Optional['ensure']          => Enum[present, absent],
    Optional['username']        => String,
    Optional['password']        => String,
    Optional['pass_hash']       => String,
    Optional['email']           => String,
    Optional['local_user']      => String,
    Optional['local_user_home'] => String,
    Optional['version']         => String,
    Optional['receipt']         => Boolean,
  }
]
