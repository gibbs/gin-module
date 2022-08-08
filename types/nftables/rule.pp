# @see https://github.com/voxpupuli/puppet-nftables/blob/v2.4.0/manifests/rule.pp
type Gin::Nftables::Rule = Struct[
  {
    Optional['ensure']   => Enum['present','absent'],
    Optional['rulename'] => Nftables::RuleName,
    Optional['order']    => Pattern[/^\d\d$/],
    Optional['table']    => String,
    Optional['content']  => String,
    Optional['source']   => Variant[String,Array[String,1]],
  }
]
