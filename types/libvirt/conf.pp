# @see https://github.com/cirrax/puppet-libvirt/blob/v4.3.4/lib/puppet/type/libvirtd_conf.rb
type Gin::Libvirt::Conf = Struct[
  {
    Optional['value']  => Variant[String, Integer],
    Optional['secret'] => Boolean,
  }
]
