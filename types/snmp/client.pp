# @see https://github.com/voxpupuli/puppet-snmp/blob/master/manifests/client.pp
type Gin::SNMP::Client = Struct[
  {
    Optional['autoupgrade']   => Boolean,
    Optional['client_config'] => Stdlib::Absolutepath,
    Optional['ensure']        => Enum['present', 'absent'],
    Optional['package_name']  => String[1],
    Optional['snmp_config']   => Array[String[1]],
  }
]
