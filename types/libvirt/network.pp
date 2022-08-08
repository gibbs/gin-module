# @see https://github.com/cirrax/puppet-libvirt/blob/v4.3.4/manifests/network.pp
type Gin::Libvirt::Network = Struct[
  {
    Optional['ensure']             => String,
    Optional['bridge']             => String,
    Optional['forward_mode']       => String,
    Optional['forward_dev']        => String,
    Optional['forward_interfaces'] => Array,
    Optional['virtualport_type']   => String,
    Optional['portgroups']         => Array,
    Optional['autostart']          => Boolean,
    Optional['ip_address']         => String,
    Optional['ip_netmask']         => String,
    Optional['dhcp_start']         => String,
    Optional['dhcp_end']           => String,
    Optional['dns_enable']         => String,
    Optional['mtu']                => Integer,
  }
]
