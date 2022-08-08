# @summary Packages
#
# @api private
#
# @see https://puppet.com/docs/puppet/7/types/file.html
#
class gin::packages {
  assert_private()

  $packages = lookup({
    'name'          => 'gin::packages',
    'value_type'    => Hash[String, Gin::Package],
    'default_value' => {},
  })

  $packages.each |$package, $parameters| {
    if (!defined(Package[$package])) {
      package { $package:
        * => $parameters,
      }
    }
  }

  gin::data { 'packages':
    content => {
      'gin::packages' => $packages,
    },
  }
}
