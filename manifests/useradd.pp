# @summary useradd
#
# @api private
#
class gin::useradd {
  assert_private()

  $config = lookup({
    'name'          => 'gin::useradd',
    'value_type'    => Gin::Useradd,
    'default_value' => {},
  })

  $useradd_parameters = deep_merge({
    expire => undef,
  }, $config)

  file { '/etc/default/useradd':
    ensure  => file,
    owner   => $useradd_parameters['owner'],
    group   => $useradd_parameters['group'],
    mode    => $useradd_parameters['mode'],
    content => epp('gin/useradd/useradd.epp', {
      'parameters' => $useradd_parameters,
    }),
  }

  gin::data { 'useradd':
    content => {
      'gin::useradd' => $useradd_parameters,
    },
  }
}
