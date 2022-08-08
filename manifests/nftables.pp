# @summary nftables
#
# @api private
#
class gin::nftables {
  assert_private()

  $config = lookup({
    'name'          => 'gin::nftables',
    'value_type'    => Gin::Nftables,
    'default_value' => {},
  })

  $parameters = deep_merge({
    in_ssh           => false,
    in_icmp          => false,
    out_ntp          => false,
    out_dns          => false,
    out_http         => false,
    out_https        => false,
    out_icmp         => false,
    out_all          => false,
    in_out_conntrack => false,
    fwd_conntrack    => false,
    inet_filter      => false,
    nat              => false,
    firewalld_enable => 'mask',
    noflush_tables   => undef,
  }, $config)

  class { 'nftables':
    * => $parameters,
  }

  $conf = lookup({
    'name'          => 'gin::nftables_conf',
    'value_type'    => Hash[String, Gin::Nftables::Config],
    'default_value' => {},
  })

  $conf.each |$conf, $value| {
    nftables::config { $conf:
      * => deep_merge({
        prefix => '',
      }, $value),
    }
  }

  $chains = lookup({
    'name'          => 'gin::nftables_chains',
    'value_type'    => Hash[String,Hash[String, Gin::Nftables::Chain]],
    'default_value' => {},
  })

  if $chains {
    gin::compose::nft_chains { 'nftables':
      chains => $chains,
    }
  }

  $rules = lookup({
    'name'          => 'gin::nftables_rules',
    'value_type'    => Hash[String,Hash[String, Hash[String, Gin::Nftables::Rule]]],
    'default_value' => {},
  })

  if $rules {
    gin::compose::nft_rules { 'nftables':
      rules => $rules,
    }
  }

  $sets = lookup({
    'name'          => 'gin::nftables_sets',
    'value_type'    => Hash[String, Gin::Nftables::Set],
    'default_value' => {},
  })

  $sets.each |$set, $set_parameters| {
    nftables::set { $set:
      * => deep_merge({
        ensure => present,
        order  => '10',
      }, $set_parameters),
    }
  }

  file { '/etc/nftables/puppet/custom-gin.nft':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0640',
    content => epp('gin/nftables/gin.nft.epp', {
      'conf' => $conf,
    }),
    notify  => Service['nftables'],
  }

  gin::data { 'nftables':
    content => {
      'gin::nftables'        => $parameters,
      'gin::nftables_conf'   => $conf,
      'gin::nftables_chains' => $chains,
      'gin::nftables_sets'   => $sets,
      'gin::nftables_rules'  => $rules,
    },
  }
}
