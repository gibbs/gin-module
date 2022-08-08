# @summary VCS Repositories
#
# @api private
#
class gin::repositories {
  assert_private()

  $repositories = lookup({
    'name'          => 'gin::repositories',
    'value_type'    => Hash[String, Gin::Repository],
    'default_value' => {},
  })

  $repositories.each |$repository, $parameters| {
    vcsrepo { $repository:
      * => deep_merge({
        ensure             => present,
        provider           => git,
        keep_local_changes => true,
      }, $parameters),
    }
  }

  gin::data { 'repositories':
    content => {
      'gin::repositories' => $repositories,
    },
  }
}
