# @summary Gin Init
#
# @param components
#   Hash of components to manage
#
class gin (
  Optional[Gin::Components] $components,
) {
  class { 'gin::components':
    manage => $components,
  }
}
