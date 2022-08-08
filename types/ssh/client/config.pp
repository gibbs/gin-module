# @see https://github.com/saz/puppet-ssh/tree/v9.0.0/manifests/client
type Gin::SSH::Client::Config = Struct[
  {
    Optional['ensure']              => Enum['present', 'absent'],
    Optional['manage_user_ssh_dir'] => Boolean,
    Optional['options']             => Hash,
    Optional['target']              => Stdlib::Absolutepath,
    Optional['user']                => String[1],
    Optional['user_home_dir']       => Stdlib::Absolutepath,
  }
]
