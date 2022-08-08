# @see https://github.com/voxpupuli/puppet-snmp/blob/master/manifests/snmpv3_user.pp
type Gin::SNMP::V3_User = Struct[
  {
    Optional['authpass'] => String[8],
    Optional['authtype'] => Enum['SHA','MD5'],
    Optional['daemon']   => Enum['snmpd','snmptrapd'],
    Optional['privpass'] => String[8],
    Optional['privtype'] => Enum['AES','DES'],
  }
]
