# @see https://puppet.com/docs/puppet/7/types/service.html
type Gin::Service = Struct[
  {
    Optional['binary']        => Stdlib::Absolutepath,
    Optional['control']       => String,
    Optional['enable']        => Variant[Boolean, Enum['manual', 'mask', 'delayed']],
    Optional['ensure']        => Variant[Boolean, Enum['stopped', 'running']],
    Optional['flags']         => String,
    Optional['hasrestart']    => Boolean,
    Optional['hasstatus']     => Boolean,
    Optional['logonaccount']  => String,
    Optional['logonpassword'] => String,
    Optional['manifest']      => String,
    Optional['name']          => String,
    Optional['path']          => Variant[Array, String],
    Optional['pattern']       => String,
    Optional['provider']      => Any,
    Optional['restart']       => String,
    Optional['start']         => String,
    Optional['status']        => String,
    Optional['stop']          => String,
    Optional['timeout']       => String,
  }
]
