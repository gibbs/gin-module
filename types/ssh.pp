# @see https://github.com/saz/puppet-ssh/blob/v9.0.0/manifests/init.pp
type Gin::SSH = Struct[
  {
    Optional['client_options']          => Hash,
    Optional['client_options_absent']   => Array,
    Optional['purge_unmanaged_sshkeys'] => Boolean,
    Optional['server_match_block']      => Hash,
    Optional['server_options']          => Hash,
    Optional['server_options_absent']   => Array,
    Optional['storeconfigs_enabled']    => Boolean,
    Optional['use_augeas']              => Boolean,
    Optional['use_issue_net']           => Boolean,
    Optional['users_client_options']    => Hash,
    Optional['validate_sshd_file']      => Boolean,
    Optional['version']                 => String,
  }
]
