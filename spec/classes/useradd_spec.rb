require 'spec_helper'

describe 'gin', type: :class do
  context 'useradd on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'useradd' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::useradd') }
        it { is_expected.to contain_class('gin::useradd') }

        it { is_expected.to contain_gin__data('useradd') }
        it { is_expected.to contain_concat__fragment('gin-hiera-useradd') }

        it { is_expected.to contain_file('/etc/default/useradd') }
      end
    end
  end
end
