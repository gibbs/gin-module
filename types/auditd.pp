# @see https://github.com/gibbs/puppet-auditd/blob/v1.0.1/manifests/init.pp
type Gin::Auditd = Struct[
  {
    Optional['buffer_size']    => Integer,
    Optional['config']         => Auditd::Conf,
    Optional['failure_mode']   => Integer,
    Optional['immutable']      => Boolean,
    Optional['package_ensure'] => String,
    Optional['package_name']   => String[1],
    Optional['rules_file']     => Stdlib::Absolutepath,
    Optional['service_enable'] => Boolean,
    Optional['service_ensure'] => Stdlib::Ensure::Service,
    Optional['service_name']   => String[1],
    Optional['syslog_output']  => Boolean,
  }
]
