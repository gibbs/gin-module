require 'spec_helper'

describe 'gin', type: :class do
  context 'libvirt on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'libvirt' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::libvirt') }
        it { is_expected.to contain_class('gin::libvirt') }

        it { is_expected.to contain_gin__data('libvirt') }
        it { is_expected.to contain_concat__fragment('gin-hiera-libvirt') }

        it { is_expected.to contain_libvirt__domain('my-domain') }
        it { is_expected.to contain_libvirt__network('net-ovs') }
        it { is_expected.to contain_libvirt__network('net-simple') }
        it { is_expected.to contain_libvirt_pool('default') }
      end
    end
  end
end
