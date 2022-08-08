# @see https://github.com/voxpupuli/puppet-nftables/blob/v2.4.0/manifests/init.pp
type Gin::Nftables = Struct[
  {
    #Optional['in_ssh']             => Boolean,
    #Optional['in_icmp']            => Boolean,
    #Optional['out_ntp']            => Boolean,
    #Optional['out_dns']            => Boolean,
    #Optional['out_http']           => Boolean,
    #Optional['out_https']          => Boolean,
    #Optional['out_icmp']           => Boolean,
    #Optional['out_all']            => Boolean,
    #Optional['in_out_conntrack']   => Boolean,
    #Optional['fwd_conntrack']      => Boolean,
    #Optional['inet_filter']        => Boolean,
    #Optional['nat']                => Boolean,
    Optional['rules']              => Hash,
    Optional['sets']               => Hash,
    Optional['log_prefix']         => String,
    Optional['nat_table_name']     => String[1],
    Optional['log_limit']          => Variant[Boolean[false], String],
    Optional['reject_with']        => Variant[Boolean[false], Pattern[/icmp(v6|x)? type .+|tcp reset/]],
    Optional['firewalld_enable']   => Variant[Boolean[false], Enum['mask']],
    Optional['noflush_tables']     => Array[Pattern[/^(ip|ip6|inet)-[-a-zA-Z0-9_]+$/],1],
    Optional['echo']               => Stdlib::Unixpath,
    Optional['configuration_path'] => Stdlib::Unixpath,
    Optional['nft_path']           => Stdlib::Unixpath,
  }
]
