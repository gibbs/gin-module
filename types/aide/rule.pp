# @see https://github.com/indiana-university/puppet-aide/blob/master/manifests/rule.pp
type Gin::AIDE::Rule = Struct[
  {
    Optional['rules'] => Variant[Array, String],
    Optional['order'] => String,
  }
]
