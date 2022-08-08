# @see https://github.com/voxpupuli/puppet-cron/blob/master/manifests/job.pp
type Gin::Cron::Job = Struct[
  {
    Optional['command']     => String[1],
    Optional['date']        => Cron::Date,
    Optional['description'] => String,
    Optional['ensure']      => Cron::Job_ensure,
    Optional['environment'] => Cron::Environment,
    Optional['hour']        => Cron::Hour,
    Optional['minute']      => Cron::Minute,
    Optional['mode']        => Cron::Mode,
    Optional['month']       => Cron::Month,
    Optional['monthday']    => Cron::Date,
    Optional['special']     => Cron::Special,
    Optional['user']        => Cron::User,
    Optional['weekday']     => Cron::Weekday,
  }
]
