# @see https://puppet.com/docs/puppet/7/types/package.htm
type Gin::Package = Struct[
  {
    Optional['adminfile']            => Stdlib::Absolutepath,
    Optional['allow_virtual']        => Variant[Boolean, Enum['yes', 'no']],
    Optional['allowcdrom']           => Boolean,
    Optional['command']              => String,
    Optional['configfiles']          => Enum['keep', 'replace'],
    Optional['enable_only']          => Variant[Boolean, Enum['yes', 'no']],
    Optional['ensure']               => Enum['present', 'absent', 'purged', 'disabled', 'installed', 'latest'],
    Optional['flavor']               => Any,
    Optional['install_only']         => Variant[Boolean, Enum['yes', 'no']],
    Optional['install_options']      => Array,
    Optional['mark']                 => Enum['hold', 'none'],
    Optional['name']                 => String,
    Optional['package_settings']     => Any,
    Optional['provider']             => String,
    Optional['reinstall_on_refresh'] => Boolean,
    Optional['responsefile']         => Stdlib::Absolutepath,
    Optional['source']               => Any,
    Optional['uninstall_options']    => Array,
  }
]
