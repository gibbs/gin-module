# @see https://github.com/voxpupuli/puppet-archive/blob/v6.0.2/REFERENCE.md#parameters-8
type Gin::Archive = Struct[
  {
    Optional['allow_insecure']   => Boolean,
    Optional['checksum']         => Variant[String[5, 128], Boolean],
    Optional['checksum_type']    => Enum['none', 'md5', 'sha1', 'sha2', 'sha256', 'sha384', 'sha512'],
    Optional['checksum_url']     => Variant[Stdlib::HTTPSUrl, Stdlib::HTTPUrl],
    Optional['checksum_verify']  => Boolean,
    Optional['cleanup']          => Boolean,
    Optional['creates']          => Stdlib::Unixpath,
    Optional['cookie']           => Any,
    Optional['digest_string']    => String[5, 128],
    Optional['digest_type']      => Enum['none', 'md5', 'sha1', 'sha2', 'sha256', 'sha384', 'sha512'],
    Optional['digest_url']       => Variant[Stdlib::HTTPSUrl, Stdlib::HTTPUrl],
    Optional['download_options'] => Variant[String, Array],
    Optional['ensure']           => Enum['present', 'absent'],
    Optional['extract']          => Boolean,
    Optional['extract_command']  => String,
    Optional['extract_flags']    => String,
    Optional['extract_path']     => Stdlib::Unixpath,
    Optional['filename']         => String,
    Optional['group']            => Variant[Integer, String],
    Optional['password']         => String,
    Optional['path']             => Stdlib::Unixpath,
    Optional['provider']         => String,
    Optional['proxy_server']     => String,
    Optional['proxy_type']       => Enum['none', 'ftp', 'http', 'https'],
    Optional['source']           => String,
    Optional['target']           => Stdlib::Unixpath,
    Optional['temp_dir']         => Stdlib::Unixpath,
    Optional['url']              => String,
    Optional['user']             => Variant[Integer, String],
    Optional['username']         => String,
  }
]
