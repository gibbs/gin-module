# @see https://github.com/voxpupuli/puppet-nftables/blob/v2.4.0/manifests/chain.pp
type Gin::Nftables::Chain = Struct[
  {
    Optional['table']      => Pattern[/^(ip|ip6|inet)-[a-zA-Z0-9_]+$/],
    Optional['chain']      => Pattern[/^[a-zA-Z0-9_]+$/],
    Optional['inject']     => Pattern[/^\d\d-[a-zA-Z0-9_]+$/],
    Optional['inject_iif'] => String,
    Optional['inject_oif'] => String,
  }
]
