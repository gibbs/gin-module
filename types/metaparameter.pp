# @see https://puppet.com/docs/puppet/7/metaparameter.html
type Gin::Metaparameter = Struct[
  {
    Optional['alias']     => String,
    Optional['audit']     => Variant[String, Array],
    Optional['before']    => Any,
    Optional['loglevel']  => Enum['emerg', 'alert', 'crit', 'err', 'warning', 'notice', 'info', 'verbose', 'debug'],
    Optional['noop']      => Boolean,
    Optional['notify']    => Any,
    Optional['require']   => Any,
    Optional['schedule']  => String,
    Optional['stage']     => String,
    Optional['subscribe'] => Any,
    Optional['tag']       => Variant[String, Array],
  }
]
