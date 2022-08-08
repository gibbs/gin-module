# @summary Cron options
type Gin::Cron = Struct[
  {
    Optional['explicit_mode'] => Boolean,
    Optional['mailto']        => Array,
    Optional['purge']         => Boolean,
  }
]
