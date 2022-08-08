# @see https://github.com/voxpupuli/puppet-yum/blob/v5.6.1/manifests/post_transaction_action.pp
type Gin::YUM::Post_Transaction_Action = Struct[
  {
    Optional['action']  => String[1],
    Optional['command'] => String[1],
    Optional['key']     => Variant[Enum['*'],Yum::RpmNameGlob,Stdlib::Unixpath],
    Optional['state']   => Enum['install', 'update', 'remove', 'any', 'in', 'out'],
  }
]
