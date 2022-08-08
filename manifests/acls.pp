# @summary ACL
#
# @api private
#
class gin::acls {
  assert_private()

  include posix_acl::requirements

  $acls = lookup({
    'name'          => 'gin::acls',
    'value_type'    => Hash[String, Gin::ACL],
    'default_value' => {},
  })

  $acls.each |$acl, $parameters| {
    posix_acl { $acl:
      * => $parameters,
    }
  }

  gin::data { 'acls':
    content => {
      'gin::acls' => $acls,
    },
  }
}
