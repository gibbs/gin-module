# @see https://github.com/saz/puppet-timezone/blob/v6.2.0/manifests/init.pp
type Gin::Timezone = Struct[
  {
    Optional['autoupgrade']                    => Boolean,
    Optional['ensure']                         => Enum['present','absent'],
    Optional['hwutc']                          => Boolean,
    Optional['localtime_file']                 => String,
    Optional['notify_services']                => Array[String],
    Optional['package']                        => String,
    Optional['timezone']                       => String,
    Optional['timezone_file']                  => String,
    Optional['timezone_file_supports_comment'] => Boolean,
    Optional['timezone_file_template']         => String,
    Optional['timezone_update']                => String,
    Optional['zoneinfo_dir']                   => String,
  }
]
