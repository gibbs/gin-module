require 'spec_helper'

describe 'gin', type: :class do
  context 'sysctl on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'sysctl' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::sysctl') }
        it { is_expected.to contain_class('gin::sysctl') }

        it { is_expected.to contain_sysctl('net.ipv4.ip_forward') }
        it { is_expected.to contain_sysctl('net.ipv6.conf.all.forwarding') }

        it { is_expected.to contain_gin__data('sysctl') }
        it { is_expected.to contain_concat__fragment('gin-hiera-sysctl') }
      end
    end
  end
end
