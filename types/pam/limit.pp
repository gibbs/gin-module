# @see https://github.com/ghoneycutt/puppet-module-pam/blob/master/manifests/limits.pp
type Gin::PAM::Limit = Struct[
  {
    Optional['config_file']        => Stdlib::Absolutepath,
    Optional['config_file_lines']  => Array,
    Optional['config_file_mode']   => Stdlib::Filemode,
    Optional['config_file_source'] => String,
    Optional['limits_d_dir']       => Stdlib::Absolutepath,
    Optional['limits_d_dir_mode']  => Stdlib::Filemode,
    Optional['purge_limits_d_dir'] => Boolean,
  }
]
