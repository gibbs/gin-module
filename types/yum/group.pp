# @see https://github.com/voxpupuli/puppet-yum/blob/v5.6.1/manifests/group.pp
type Gin::YUM::Group = Struct[
  {
    Optional['ensure']          => Enum['present', 'installed', 'latest', 'absent', 'purged'],
    Optional['install_options'] => Array[String[1]],
    Optional['timeout']         => Integer,
  }
]
