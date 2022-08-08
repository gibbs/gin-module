# @see https://github.com/cirrax/puppet-libvirt/blob/v4.3.4/manifests/init.pp
type Gin::Libvirt = Struct[
  {
    Optional['libvirt_package_names'] => Array,
    Optional['service_name']          => String,
    Optional['service_ensure']        => String,
    Optional['service_enable']        => Boolean,
    Optional['manage_service']        => Boolean,
    Optional['qemu_conf']             => Hash,
    Optional['qemu_hook']             => String,
    Optional['qemu_hook_packages']    => Hash,
    Optional['create_networks']       => Hash,
    Optional['create_domains']        => Hash,
    Optional['create_nwfilters']      => Hash,
    Optional['evacuation']            => String,
    Optional['max_job_time']          => String,
    Optional['suspend_multiplier']    => String,
    Optional['migration_url_format']  => String,
    Optional['uri_aliases']           => Array,
    Optional['uri_default']           => String,
    Optional['default_conf']          => Hash,
    Optional['libvirtd_conf']         => Hash[String,Variant[String,Integer,Array]],
    Optional['config_dir']            => String,
    Optional['manage_domains_config'] => String,
    Optional['drop_default_net']      => Boolean,
    Optional['diff_dir']              => String,
  }
]
