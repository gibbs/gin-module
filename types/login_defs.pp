# @see https://github.com/gibbs/puppet-login_defs/blob/v1.0.0/manifests/init.pp
type Gin::Login_Defs = Struct[
  {
    Optional['group']          => Variant[String[1], Integer],
    Optional['mode']           => String[3,4],
    Optional['options']        => Hash[String, Login_Defs::Option],
    Optional['owner']          => Variant[String[1], Integer],
    Optional['package_ensure'] => String,
    Optional['package_manage'] => Boolean,
    Optional['package_name']   => String[1],
  }
]
