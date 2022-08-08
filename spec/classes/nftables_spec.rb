require 'spec_helper'

describe 'gin', type: :class do
  context 'nftables on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'nftables' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::nftables') }
        it { is_expected.to contain_class('gin::nftables') }

        it { is_expected.to contain_gin__data('nftables') }
        it { is_expected.to contain_concat__fragment('gin-hiera-nftables') }

        it { is_expected.to contain_gin__compose__nft_chains('nftables') }
        it { is_expected.to contain_gin__compose__nft_rules('nftables') }

        it { is_expected.to contain_file('/etc/nftables/puppet/custom-gin.nft') }

        it { is_expected.to contain_nftables__config('inet-filter') }
        it { is_expected.to contain_nftables__config('ip-nat') }
        it { is_expected.to contain_nftables__config('ip-router') }
        it { is_expected.to contain_nftables__config('ip6-nat') }

        it { is_expected.to contain_nftables__chain('inet-filter_default_forward') }
        it { is_expected.to contain_nftables__chain('inet-filter_default_input') }
        it { is_expected.to contain_nftables__chain('inet-filter_default_output') }
        it { is_expected.to contain_nftables__chain('inet-filter_forward') }
        it { is_expected.to contain_nftables__chain('inet-filter_global') }
        it { is_expected.to contain_nftables__chain('inet-filter_input') }
        it { is_expected.to contain_nftables__chain('inet-filter_output') }
        it { is_expected.to contain_nftables__chain('ip-nat_input') }
        it { is_expected.to contain_nftables__chain('ip-nat_output') }
        it { is_expected.to contain_nftables__chain('ip-nat_postrouting') }
        it { is_expected.to contain_nftables__chain('ip-nat_prerouting') }
        it { is_expected.to contain_nftables__chain('ip-router_postrouting') }
        it { is_expected.to contain_nftables__chain('ip-router_prerouting') }
        it { is_expected.to contain_nftables__chain('ip6-nat_postrouting6') }
        it { is_expected.to contain_nftables__chain('ip6-nat_prerouting6') }

        it { is_expected.to contain_nftables__rule('default_input-inetfilter_ssh') }
        it { is_expected.to contain_nftables__rule('default_output-inetfilter_all') }
        it { is_expected.to contain_nftables__rule('forward-inetfilter_jump_global') }
        it { is_expected.to contain_nftables__rule('forward-inetfilter_log_discarded') }
        it { is_expected.to contain_nftables__rule('forward-inetfilter_policy') }
        it { is_expected.to contain_nftables__rule('forward-inetfilter_type') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_ct_drop_invalid') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_ct_state') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_jump_global') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_lo') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_log_discarded') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_policy') }
        it { is_expected.to contain_nftables__rule('input-inetfilter_type') }
        it { is_expected.to contain_nftables__rule('input-ipnat_policy') }
        it { is_expected.to contain_nftables__rule('input-ipnat_type') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_ct_accept') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_ct_drop') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_jump_global') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_lo') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_log_discarded') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_policy') }
        it { is_expected.to contain_nftables__rule('output-inetfilter_type') }
        it { is_expected.to contain_nftables__rule('postrouting-ipnat_policy') }
        it { is_expected.to contain_nftables__rule('postrouting-ipnat_type') }
        it { is_expected.to contain_nftables__rule('postrouting-iprouter_type') }
        it { is_expected.to contain_nftables__rule('postrouting6-ip6nat_policy') }
        it { is_expected.to contain_nftables__rule('postrouting6-ip6nat_type') }
        it { is_expected.to contain_nftables__rule('prerouting-ipnat_policy') }
        it { is_expected.to contain_nftables__rule('prerouting-ipnat_type') }
        it { is_expected.to contain_nftables__rule('prerouting-iprouter_type') }
        it { is_expected.to contain_nftables__rule('prerouting6-ip6nat_policy') }
        it { is_expected.to contain_nftables__rule('prerouting6-ip6nat_type') }
      end
    end
  end
end
