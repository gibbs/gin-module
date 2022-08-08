# @see https://github.com/ghoneycutt/puppet-module-pam/blob/master/manifests/service.pp
type Gin::PAM::Service = Struct[
  {
    Optional['content']        => String,
    Optional['ensure']         => Enum['present', 'absent'],
    Optional['lines']          => Array,
    Optional['pam_config_dir'] => Stdlib::Absolutepath,
  }
]
