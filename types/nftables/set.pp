# @see https://github.com/voxpupuli/puppet-nftables/blob/v2.4.0/manifests/set.pp
type Gin::Nftables::Set = Struct[
  {
    Optional['ensure']      => Enum['present','absent'],
    Optional['setname']     => Pattern[/^[-a-zA-Z0-9_]+$/],
    Optional['order']       => Pattern[/^\d\d$/],
    Optional['type']        => Enum['ipv4_addr', 'ipv6_addr', 'ether_addr', 'inet_proto', 'inet_service', 'mark'],
    Optional['table']       => Variant[String, Array[String, 1]],
    Optional['flags']       => Array[Enum['constant', 'dynamic', 'interval', 'timeout'], 0, 4],
    Optional['timeout']     => Integer,
    Optional['gc_interval'] => Integer,
    Optional['elements']    => Array[String],
    Optional['size']        => Integer,
    Optional['policy']      => Enum['performance', 'memory'],
    Optional['auto_merge']  => Boolean,
    Optional['content']     => String,
    Optional['source']      => Variant[String,Array[String,1]],
  }
]
