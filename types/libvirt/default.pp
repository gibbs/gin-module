# @see https://github.com/cirrax/puppet-libvirt/blob/v4.3.4/lib/puppet/type/libvirtd_default.rb
type Gin::Libvirt::Default = Struct[
  {
    Optional['value']  => Variant[String, Integer],
    Optional['secret'] => Boolean,
  }
]
