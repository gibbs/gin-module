# @see https://github.com/voxpupuli/puppet-yum/blob/v5.6.1/manifests/init.pp
type Gin::YUM = Struct[
  {
    Optional['clean_old_kernels']       => Boolean,
    Optional['config_options']          => Hash[String, Variant[String, Integer, Boolean, Hash[String, Variant[String, Integer, Boolean]]]],
    Optional['gpgkeys']                 => Hash[String, Hash[String, String]],
    Optional['keep_kernel_devel']       => Boolean,
    Optional['manage_os_default_repos'] => Boolean,
    Optional['managed_repos']           => Array[String],
    Optional['os_default_repos']        => Array[String],
    Optional['purge_unmanaged_repos']   => Boolean,
    Optional['repo_exclusions']         => Array[String],
    Optional['repos']                   => Hash[String, Hash[String, Variant[String, Integer, Boolean]]],
    Optional['utils_package_name']      => String,
    Optional['repodir']                 => Stdlib::Unixpath,
  }
]
