# @see https://github.com/Q-Technologies/puppet-sysstat/blob/1.2.6/manifests/init.pp
type Gin::Sysstat = Struct[
  {
    Optional['package']          => String,
    Optional['cron_path']        => String,
    Optional['cron_path2']       => String,
    Optional['conf_path']        => String,
    Optional['sa1_path']         => String,
    Optional['sa2_path']         => String,
    Optional['sa2_hour']         => String,
    Optional['sa2_minute']       => String,
    Optional['sa_dir']           => String,
    Optional['sa1_options']      => String,
    Optional['interval']         => Integer,
    Optional['sa1_interval']     => Integer,
    Optional['duration']         => Integer,
    Optional['sa1_duration']     => Integer,
    Optional['samples']          => Integer,
    Optional['sa1_samples']      => Integer,
    Optional['sa2_options']      => String,
    Optional['history']          => Integer,
    Optional['compressafter']    => Integer,
    Optional['sadc_options']     => String,
    Optional['zip']              => String,
    Optional['installpkg']       => String,
    Optional['generate_summary'] => String,
    Optional['disable']          => String,
    Optional['sa2_delay_range']  => Integer,
    Optional['sa_umask']         => String,
  }
]