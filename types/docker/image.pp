# @see https://github.com/puppetlabs/puppetlabs-docker/blob/v4.4.0/manifests/image.pp
#
type Gin::Docker::Image = Struct[
  {
    Optional['docker_dir']   => String,
    Optional['docker_file']  => String,
    Optional['docker_tar']   => String,
    Optional['ensure']       => Enum[present, absent, latest],
    Optional['force']        => Boolean,
    Optional['image']        => Pattern[/^[\S]*$/],
    Optional['image_digest'] => String,
    Optional['image_tag']    => String,
  }
]
