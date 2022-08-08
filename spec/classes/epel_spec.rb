require 'spec_helper'

describe 'gin', type: :class do
  context 'EPEL on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'epel' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::epel') }
        it { is_expected.to contain_class('gin::epel') }

        if facts[:os]['family'] == 'RedHat'
          it { is_expected.to contain_gin__data('epel') }
          it { is_expected.to contain_concat__fragment('gin-hiera-epel') }
        end
      end
    end
  end
end
