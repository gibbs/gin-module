# @summary Archive utility
#
# @api private
#
# @see https://forge.puppet.com/modules/puppet/archive
#
class gin::archives {
  assert_private()

  $archives = lookup({
    'name'          => 'gin::archives',
    'value_type'    => Hash[String, Gin::Archive],
    'default_value' => {},
  })

  $archives.each |$archive, $parameters| {
    archive { $archive:
      * => deep_merge({
        cleanup => true,
        ensure  => present,
      }, $parameters),
    }
  }

  gin::data { 'archives':
    content => {
      'gin::archives' => $archives,
    },
  }
}
