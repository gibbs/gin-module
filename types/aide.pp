# @see https://github.com/indiana-university/puppet-aide/blob/master/manifests/init.pp
type Gin::AIDE = Struct[
  {
    Optional['package']                 => String,
    Optional['version']                 => String,
    Optional['conf_path']               => String,
    Optional['db_path']                 => String,
    Optional['db_temp_path']            => String,
    Optional['gzip_dbout']              => Boolean,
    Optional['aide_path']               => String,
    Optional['mail_path']               => String,
    Optional['config_template']         => String,
    Optional['report_ignore_e2fsattrs'] => String,
    Optional['aide_log']                => String,
    Optional['syslogout']               => Boolean,
    Optional['minute']                  => Integer,
    Optional['hour']                    => Integer,
    Optional['nocheck']                 => Boolean,
    Optional['mailto']                  => String,
    Optional['mail_only_on_changes']    => Boolean,
    Optional['init_timeout']            => Integer,
    Optional['cat_path']                => String,
    Optional['rm_path']                 => String,
  }
]
