# @summary Services
#
# @api private
#
class gin::services {
  assert_private()

  $services = lookup({
    'name'          => 'gin::services',
    'value_type'    => Hash[String, Gin::Service],
    'default_value' => {},
  })

  $services.each |$service, $parameters| {
    if (!defined(Service[$service])) {
      service { $service:
        * => $parameters,
      }
    }
  }

  gin::data { 'services':
    content => {
      'gin::services' => $services,
    },
  }
}
