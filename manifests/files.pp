# @summary Files
#
# @api private
#
class gin::files {
  assert_private()

  $files = lookup({
    'name'          => 'gin::files',
    'value_type'    => Hash[String, Gin::File],
    'default_value' => {},
  })

  $files.each |$file, $parameters| {
    if (!defined(File[$file])) {
      file { $file:
        * => deep_merge({
          path   => $file,
          backup => false,
        }, $parameters),
      }
    }
  }

  gin::data { 'files':
    content => {
      'gin::files' => $files,
    },
  }
}
