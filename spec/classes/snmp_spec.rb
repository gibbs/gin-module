require 'spec_helper'

describe 'gin', type: :class do
  context 'snmp on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'snmp' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::snmp') }
        it { is_expected.to contain_class('gin::snmp') }

        it { is_expected.to contain_gin__data('snmp') }
        it { is_expected.to contain_concat__fragment('gin-hiera-snmp') }
      end
    end
  end
end
