# @see https://github.com/voxpupuli/puppet-nftables/blob/v2.4.0/manifests/config.pp
type Gin::Nftables::Config = Struct[
  {
    Optional['tablespec'] => Pattern[/^\w+-\w+$/],
    Optional['content']   => String,
    Optional['source']    => Variant[String,Array[String,1]],
    Optional['prefix']    => String,
  }
]
