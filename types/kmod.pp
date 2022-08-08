# @see https://github.com/voxpupuli/puppet-kmod/blob/master/manifests/init.pp
type Gin::Kmod = Struct[
  {
    Optional['list_of_aliases']    => Hash,
    Optional['list_of_blacklists'] => Hash,
    Optional['list_of_installs']   => Hash,
    Optional['list_of_loads']      => Hash,
    Optional['list_of_options']    => Hash,
  }
]
