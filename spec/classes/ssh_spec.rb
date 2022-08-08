require 'spec_helper'

describe 'gin', type: :class do
  context 'ssh on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'ssh' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::ssh') }
        it { is_expected.to contain_class('gin::ssh') }

        it { is_expected.to contain_gin__data('ssh') }
        it { is_expected.to contain_concat__fragment('gin-hiera-ssh') }

        it { is_expected.to contain_ssh_authorized_key('user1') }
      end
    end
  end
end
