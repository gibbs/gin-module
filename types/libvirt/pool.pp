# @see https://github.com/cirrax/puppet-libvirt/tree/v4.3.4/lib/puppet/type
type Gin::Libvirt::Pool = Struct[
  {
    Optional['ensure']       => Enum['present', 'absent'],
    Optional['type']         => Enum['dir', 'netfs', 'fs', 'logical', 'disk', 'iscsi', 'mpath', 'rbd', 'sheepdog'],
    Optional['sourcehost']   => String,
    Optional['sourcepath']   => String,
    Optional['sourcedev']    => String,
    Optional['sourcename']   => String,
    Optional['sourceformat'] => Enum['auto', 'nfs', 'glusterfs', 'cifs'],
    Optional['target']       => String,
    Optional['target_owner'] => String,
    Optional['target_group'] => String,
    Optional['active']       => Boolean,
    Optional['autostart']    => Boolean,
  }
]
