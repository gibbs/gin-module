# @summary MOTD
type Gin::MOTD = Struct[
  {
    Optional['issue_content']       => String,
    Optional['disable_update_motd'] => Array,
  }
]
