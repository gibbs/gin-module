# @summary Alternatives
#
# @api private
#
class gin::alternatives {
  assert_private()

  $alternatives = lookup({
    'name'          => 'gin::alternatives',
    'value_type'    => Hash[String, Gin::Alternatives],
    'default_value' => {},
  })

  $alternatives.each |$alternative, $parameters| {
    alternatives { $alternative:
      * => $parameters,
    }
  }

  $entries = lookup({
    'name'          => 'gin::alternative_entries',
    'value_type'    => Hash[String, Gin::Alternatives::Entry],
    'default_value' => {},
  })

  $entries.each |$entry, $parameters| {
    alternative_entry { $entry:
      * => $parameters,
    }
  }

  gin::data { 'alternatives':
    content => {
      'gin::alternatives'        => $alternatives,
      'gin::alternative_entries' => $entries,
    },
  }
}
