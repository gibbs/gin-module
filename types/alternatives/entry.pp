# @see https://github.com/voxpupuli/puppet-alternatives/blob/v4.0.0/lib/puppet/type/alternative_entry.rb
type Gin::Alternatives::Entry = Struct[
  {
    Optional['name']       => Stdlib::AbsolutePath,
    Optional['ensure']     => Enum['present', 'absent'],
    Optional['altlink']    => Stdlib::AbsolutePath,
    Optional['altlink_ro'] => Boolean,
    Optional['altname']    => String,
    Optional['priority']   => Integer,
  }
]
