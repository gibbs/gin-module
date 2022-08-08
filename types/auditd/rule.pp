# @see https://github.com/gibbs/puppet-auditd/blob/v1.0.1/manifests/rule.pp
type Gin::Auditd::Rule = Struct[
  {
    Optional['content'] => String,
    Optional['order']   => Integer[1, 99],
  }
]
