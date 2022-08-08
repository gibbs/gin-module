# @see https://github.com/ghoneycutt/puppet-module-pam/blob/master/manifests/accesslogin.pp
type Gin::PAM::AccessLogin = Struct[
  {
    Optional['access_conf_group']    => String,
    Optional['access_conf_mode']     => Stdlib::Filemode,
    Optional['access_conf_owner']    => String,
    Optional['access_conf_path']     => Stdlib::Absolutepath,
    Optional['access_conf_template'] => String,
    Optional['allowed_users']        => Variant[Array, Hash, String],
  }
]
