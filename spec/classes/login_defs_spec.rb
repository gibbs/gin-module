require 'spec_helper'

describe 'gin', type: :class do
  context 'login_defs on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'login_defs' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::login_defs') }
        it { is_expected.to contain_class('gin::login_defs') }

        it { is_expected.to contain_gin__data('login_defs') }
        it { is_expected.to contain_concat__fragment('gin-hiera-login_defs') }
      end
    end
  end
end
