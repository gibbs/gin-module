# @see https://github.com/saz/puppet-sudo/blob/master/manifests/conf.pp
type Gin::Sudo::Conf = Struct[
  {
    Optional['content']          => Any,
    Optional['ensure']           => Any,
    Optional['priority']         => Integer[0, 100],
    Optional['source']           => String,
    Optional['sudo_config_dir']  => Stdlib::Unixpath,
    Optional['sudo_file_name']   => String,
    Optional['sudo_syntax_path'] => String,
    Optional['template']         => String,
  }
]
