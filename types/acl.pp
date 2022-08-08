# @see https://github.com/voxpupuli/puppet-posix_acl/blob/v2.0.0/lib/puppet/type/posix_acl.rb
type Gin::ACL = Struct[
  {
    Optional['action']         => Enum['set', 'unset', 'exact', 'purge'],
    Optional['ignore_missing'] => Enum['false', 'quiet', 'notify'],
    Optional['path']           => Stdlib::AbsolutePath,
    Optional['recursemode']    => Enum['lazy', 'deep'],
    Optional['permission']     => Array,
    Optional['recursive']      => Boolean,
    Optional['require']        => Array,
  }
]
