# @see https://github.com/cirrax/puppet-libvirt/blob/v4.3.4/manifests/domain.pp
type Gin::Libvirt::Domain = Struct[
  {
    Optional['type']               => String,
    Optional['domain_title']       => String,
    Optional['description']        => String,
    Optional['uuid']               => String,
    Optional['boot']               => String,
    Optional['disks']              => Array,
    Optional['interfaces']         => Array,
    Optional['autostart']          => Boolean,
    Optional['dom_profile']        => String,
    Optional['domconf']            => Hash,
    Optional['devices_profile']    => String,
    Optional['devices']            => Hash,
    Optional['additionaldevices']  => Hash,
    Optional['default_host']       => String,
    Optional['evacuation']         => String,
    Optional['max_job_time']       => String,
    Optional['suspend_multiplier'] => String,
    Optional['max_memory']         => Any,
    Optional['initial_memory']     => Any,
    Optional['cpus']               => Any,
    Optional['cpu_model']          => Any,
    Optional['bootmenu']           => Any,
    Optional['machine_type']       => Any,
  }
]
