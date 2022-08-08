# @see https://github.com/trlinkin/puppet-nsswitch/blob/2.2.0/manifests/init.pp
type Gin::Nsswitch = Struct[
  {
    Optional['aliases']    => Variant[String, Array],
    Optional['automount']  => Variant[String, Array],
    Optional['bootparams'] => Variant[String, Array],
    Optional['ethers']     => Variant[String, Array],
    Optional['file_group'] => String,
    Optional['file_owner'] => String,
    Optional['file_perms'] => String,
    Optional['group']      => Variant[String, Array],
    Optional['hosts']      => Variant[String, Array],
    Optional['netgroup']   => Variant[String, Array],
    Optional['netmasks']   => Variant[String, Array],
    Optional['networks']   => Variant[String, Array],
    Optional['passwd']     => Variant[String, Array],
    Optional['protocols']  => Variant[String, Array],
    Optional['publickey']  => Variant[String, Array],
    Optional['rpc']        => Variant[String, Array],
    Optional['services']   => Variant[String, Array],
    Optional['shadow']     => Variant[String, Array],
    Optional['shells']     => Variant[String, Array],
    Optional['gshadow']    => Variant[String, Array],
    Optional['sudoers']    => Variant[String, Array],
    Optional['file_path']  => Stdlib::Unixpath,
  }
]
