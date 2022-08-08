# @summary Component manager
#
# @api private
#
# @param manage
#   Hash of components to manage
#
class gin::components (
  Gin::Components $manage,
) {
  assert_private()

  $component_tree = deep_merge({
    apt      => false,
    yum      => false,
    nftables => false,
  }, $manage)

  concat { '/tmp/gin.yaml':
    order          => 'alpha',
    owner          => 'root',
    group          => 'root',
    mode           => '0600',
    ensure_newline => true,
  }

  $component_tree.each |$manifest, $value| {
    $class = sprintf('gin::%s', $manifest)

    if ($value == true and defined($class)) {
      include $class
    }
  }
}
