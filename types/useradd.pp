# @summary useradd
type Gin::Useradd = Struct[
  {
    Optional['expire']     => String[1],
    Optional['group']      => Variant[Integer, String[1]],
    Optional['home']       => Stdlib::Unixpath,
    Optional['inactive']   => Variant[Integer, String[1]],
    Optional['shell']      => String[1],
    Optional['skel']       => String[1],
    Optional['file_mode']  => Stdlib::Filemode,
    Optional['file_owner'] => Variant[Integer, String[1]],
    Optional['file_group'] => Variant[Integer, String[1]],
  }
]
