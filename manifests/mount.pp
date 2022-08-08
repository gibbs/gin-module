# @summary mounts
#
# @api private
#
class gin::mount {
  assert_private()

  $mounts = lookup({
    'name'          => 'gin::mount',
    'value_type'    => Hash[String, Gin::Mount],
    'default_value' => {},
  })

  $mounts.each |$mount, $parameters| {
    mount { $mount:
      * => $parameters,
    }
  }

  gin::data { 'mount':
    content => {
      'gin::mount' => $mounts,
    },
  }
}
