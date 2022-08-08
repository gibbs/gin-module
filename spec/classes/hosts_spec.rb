require 'spec_helper'

describe 'gin', type: :class do
  context 'hosts on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'hosts' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::hosts') }
        it { is_expected.to contain_class('gin::hosts') }

        it { is_expected.to contain_host('mytestdomain.test') }
        it { is_expected.to contain_host('mylocaldomain.local') }

        it { is_expected.to contain_gin__data('hosts') }
        it { is_expected.to contain_concat__fragment('gin-hiera-hosts') }
      end
    end
  end
end
