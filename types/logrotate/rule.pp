# @see https://github.com/voxpupuli/puppet-logrotate/blob/v6.0.0/manifests/rule.pp
type Gin::Logrotate::Rule = Struct[
  {
    Optional['rulename']        => Pattern[/^[a-zA-Z0-9\._-]+$/],
    Optional['ensure']          => Enum['present','absent'],
    Optional['custom_cfg']      => Array[String[1]],
    Optional['path']            => Logrotate::Path,
    Optional['compress']        => Boolean,
    Optional['compresscmd']     => String,
    Optional['compressext']     => String,
    Optional['compressoptions'] => String,
    Optional['copy']            => Boolean,
    Optional['copytruncate']    => Boolean,
    Optional['create']          => Boolean,
    Optional['create_mode']     => String,
    Optional['create_owner']    => String,
    Optional['create_group']    => String,
    Optional['dateext']         => Boolean,
    Optional['dateformat']      => String,
    Optional['dateyesterday']   => Boolean,
    Optional['delaycompress']   => Boolean,
    Optional['extension']       => String,
    Optional['ifempty']         => Boolean,
    Optional['mail']            => Variant[String,Boolean],
    Optional['mail_when']       => Enum['mailfirst','maillast'],
    Optional['maxage']          => Integer,
    Optional['minsize']         => Logrotate::Size,
    Optional['maxsize']         => Logrotate::Size,
    Optional['missingok']       => Boolean,
    Optional['olddir']          => Variant[Boolean,String],
    Optional['postrotate']      => Logrotate::Commands,
    Optional['prerotate']       => Logrotate::Commands,
    Optional['firstaction']     => Logrotate::Commands,
    Optional['lastaction']      => Logrotate::Commands,
    Optional['rotate']          => Integer,
    Optional['rotate_every']    => Logrotate::Every,
    Optional['size']            => Logrotate::Size,
    Optional['sharedscripts']   => Boolean,
    Optional['shred']           => Boolean,
    Optional['shredcycles']     => Integer,
    Optional['start']           => Integer,
    Optional['su']              => Boolean,
    Optional['su_user']         => String,
    Optional['su_group']        => String,
    Optional['uncompresscmd']   => String,
  }
]
