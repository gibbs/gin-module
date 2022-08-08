# @summary
#   nftables firewall rules
#
# @param rules
#   nftables module rules configuration hash
#
define gin::compose::nft_rules (
  Hash[String,Hash[String, Hash[String, Gin::Nftables::Rule]]] $rules,
) {
  if $gin::components[nftables] {
    $rules.each |$table, $table_chains| {
      $table_chains.each |$chain, $chain_rules| {
        $chain_rules.each |$rule, $rule_parameters| {
          $tablename = regsubst($table, '-', '')
          $rule_title = sprintf('%s-%s_%s', $chain, $tablename, $rule)

          $parameters = deep_merge({
            ensure   => present,
            order    => '50',
            rulename => $rule_title,
            table    => $table,
          }, $rule_parameters)

          nftables::rule { $rule_title:
            * => $parameters,
          }
        }
      }
    }
  }
}
