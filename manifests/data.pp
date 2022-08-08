# @summary Component data collector
#
# @param content
#   The hiera lookup data to save
#
define gin::data (
  Hash $content = {},
) {
  concat::fragment { "gin-hiera-${name}":
    target  => '/tmp/gin.yaml',
    content => to_yaml($content),
  }
}
