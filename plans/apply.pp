# @summary Run (apply) the Gin catalogue
#
# @param [TargetSpec] targets
#   The inventory target name(s)
#
# @param [Boolean] catch_errors
#   Set to true to including failed results
#
# @param [Boolean] catch_errors
#   Set to true to apply the catalogue in no-operation mode
#
# @param [Boolean] output
#   Set to true to display result output
#
plan gin::apply (
  TargetSpec $targets,
  Boolean $catch_errors = true,
  Boolean $noop = false,
  Boolean $output = true
) {
  $targets.apply_prep

  $apply_result = apply($targets, _catch_errors => $catch_errors, _noop => $noop) {
    $classes = lookup('classes', Optional[Array[String]], 'first', undef)

    if $classes {
      $classes.each |$class| {
        include $class
      }
    }
  }

  $apply_result.each |$result| {
    unless $output == false {
      notice($result)
    }
  }
}
