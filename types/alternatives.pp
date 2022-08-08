# @see https://github.com/voxpupuli/puppet-alternatives/blob/v4.0.0/lib/puppet/type/alternatives.rb
type Gin::Alternatives = Struct[
  {
    Optional['name']       => Any,
    Optional['path']       => Stdlib::AbsolutePath,
    Optional['mode']       => Stdlib::Filemode,
    Optional['altlink']    => Stdlib::AbsolutePath,
    Optional['altlink_ro'] => Boolean,
    Optional['altname']    => String,
    Optional['priority']   => Integer,
  }
]
