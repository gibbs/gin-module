# @see https://github.com/cirrax/puppet-libvirt/blob/v4.3.4/manifests/nwfilter.pp
type Gin::Libvirt::Nwfilter = Struct[
  {
    Optional['uuid']              => String,
    Optional['ip']                => String,
    Optional['publictcpservices'] => Array,
    Optional['publicudpservices'] => Array,
    Optional['customtcprules']    => Array,
    Optional['customudprules']    => Array,
  }
]
