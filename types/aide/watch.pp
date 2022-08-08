# @see https://github.com/indiana-university/puppet-aide/blob/master/manifests/watch.pp
type Gin::AIDE::Watch = Struct[
  {
    Optional['path']  => Stdlib::Absolutepath,
    Optional['type']  => Enum['regular', 'equals', 'exclude'],
    Optional['rules'] => Variant[Array, String],
    Optional['order'] => Integer,
  }
]
