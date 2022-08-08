# @summary
#   nftables firewall chains
#
# @param chains
#   nftables module chains configuration hash
#
define gin::compose::nft_chains (
  Hash[String, Hash[String, Gin::Nftables::Chain]] $chains,
) {
  if $gin::components[nftables] {
    $chains.each |$table, $table_chains| {
      $table_chains.each |$chain, $chain_parameters| {
        $chain_title = sprintf('%s_%s', $table, $chain)

        nftables::chain { $chain_title:
          * => deep_merge({
            chain => $chain,
            table => $table,
          }, $chain_parameters),
        }
      }
    }
  }
}
