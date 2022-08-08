require 'spec_helper'

describe 'gin', type: :class do
  context 'rhsm on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'rhsm' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::rhsm') }
        it { is_expected.to contain_class('gin::rhsm') }

        if facts[:os]['family'] == 'RedHat'
          it { is_expected.to contain_gin__data('rhsm') }
          it { is_expected.to contain_concat__fragment('gin-hiera-rhsm') }
        end
      end
    end
  end
end
