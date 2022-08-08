require 'spec_helper'

describe 'gin', type: :class do
  context 'packages on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'packages' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::packages') }
        it { is_expected.to contain_class('gin::packages') }

        it { is_expected.to contain_gin__data('packages') }
        it { is_expected.to contain_concat__fragment('gin-hiera-packages') }

        it { is_expected.to contain_package('vim') }
        it { is_expected.to contain_package('telnet') }
        it { is_expected.to contain_package('rubocop') }
      end
    end
  end
end
