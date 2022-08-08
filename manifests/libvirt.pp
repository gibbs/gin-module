# @summary libvirt
#
# @api private
#
class gin::libvirt {
  assert_private()

  $device_profiles = lookup({
    'name'          => 'gin::libvirt_device_profiles',
    'value_type'    => Hash,
    'default_value' => {},
  })

  $domconf_profiles = lookup({
    'name'          => 'gin::libvirt_domconf_profiles',
    'value_type'    => Hash,
    'default_value' => {},
  })

  class { 'libvirt::profiles':
    devices => $device_profiles,
    domconf => $domconf_profiles,
  }

  $config = lookup({
    'name'          => 'gin::libvirt',
    'value_type'    => Gin::Libvirt,
    'default_value' => {},
  })

  class { 'libvirt':
    * => $config,
  }

  $confs = lookup({
    'name'          => 'gin::libvirt_confs',
    'value_type'    => Hash[String, Gin::Libvirt::Conf],
    'default_value' => {},
  })

  $confs.each |$conf, $parameters| {
    libvirtd_conf { $conf:
      * => deep_merge({
        secret => false,
      }, $parameters),
    }
  }

  $defaults = lookup({
    'name'          => 'gin::libvirt_defaults',
    'value_type'    => Hash[String, Gin::Libvirt::Default],
    'default_value' => {},
  })

  $defaults.each |$default, $parameters| {
    libvirtd_default { $default:
      * => deep_merge({
        secret => false,
      }, $parameters),
    }
  }

  $domains = lookup({
    'name'          => 'gin::libvirt_domains',
    'value_type'    => Hash[String, Gin::Libvirt::Domain],
    'default_value' => {},
  })

  $domains.each |$domain, $parameters| {
    libvirt::domain { $domain:
      * => deep_merge({
        type            => 'kvm',
        boot            => 'hd',
        autostart       => true,
        dom_profile     => 'default',
        devices_profile => 'default',
      }, $parameters),
    }
  }

  $networks = lookup({
    'name'          => 'gin::libvirt_networks',
    'value_type'    => Hash[String, Gin::Libvirt::Network],
    'default_value' => {},
  })

  $networks.each |$network, $parameters| {
    libvirt::network { $network:
      * => deep_merge({
        ensure       => present,
        bridge       => '',
        forward_mode => 'bridge',
      }, $parameters),
    }
  }

  $network_filters = lookup({
    'name'          => 'gin::libvirt_nwfilters',
    'value_type'    => Hash[String, Gin::Libvirt::Nwfilter],
    'default_value' => {},
  })

  $network_filters.each |$nwfilter, $parameters| {
    libvirt::nwfilter { $nwfilter:
      * => $parameters,
    }
  }

  $pools = lookup({
    'name'          => 'gin::libvirt_pools',
    'value_type'    => Hash[String, Gin::Libvirt::Pool],
    'default_value' => {},
  })

  $pools.each |$pool, $parameters| {
    libvirt_pool { $pool:
      * => deep_merge({
        ensure    => present,
        active    => true,
        autostart => false,
      }, $parameters),
    }
  }

  gin::data { 'libvirt':
    content => {
      'gin::libvirt'                  => $config,
      'gin::libvirt_confs'            => $confs,
      'gin::libvirt_defaults'         => $defaults,
      'gin::libvirt_domains'          => $domains,
      'gin::libvirt_networks'         => $networks,
      'gin::libvirt_pools'            => $pools,
      'gin::libvirt_nwfilters'        => $network_filters,
      'gin::libvirt_device_profiles'  => $device_profiles,
      'gin::libvirt_domconf_profiles' => $domconf_profiles,
    },
  }
}
