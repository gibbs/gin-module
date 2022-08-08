require 'spec_helper'

describe 'gin', type: :class do
  context 'sudo on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'sudo' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::sudo') }
        it { is_expected.to contain_class('gin::sudo') }

        it { is_expected.to contain_sudo__conf('user1') }

        it { is_expected.to contain_gin__data('sudo') }
        it { is_expected.to contain_concat__fragment('gin-hiera-sudo') }
      end
    end
  end
end
