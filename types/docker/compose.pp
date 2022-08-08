# @see https://github.com/puppetlabs/puppetlabs-docker/blob/v4.4.0/manifests/compose.pp
type Gin::Docker::Compose = Struct[
  {
    Optional['base_url']     => String,
    Optional['curl_ensure']  => Boolean,
    Optional['ensure']       => Enum['present', 'absent'],
    Optional['install_path'] => String,
    Optional['proxy']        => String,
    Optional['raw_url']      => String,
    Optional['symlink_name'] => String,
    Optional['version']      => String,
  }
]
