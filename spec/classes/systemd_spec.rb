require 'spec_helper'

describe 'gin', type: :class do
  context 'systemd on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'systemd' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::systemd') }
        it { is_expected.to contain_class('gin::systemd') }

        it { is_expected.to contain_gin__data('systemd') }
        it { is_expected.to contain_concat__fragment('gin-hiera-systemd') }

        it { is_expected.to contain_systemd__dropin_file('foo.conf') }
        it { is_expected.to contain_systemd__modules_load('impi.conf') }
        it { is_expected.to contain_systemd__network('enp3s0.network') }
        it { is_expected.to contain_systemd__network('eth0.network') }
        it { is_expected.to contain_systemd__service_limits('foo.service') }
        it { is_expected.to contain_systemd__timer('runoften.timer') }
        it { is_expected.to contain_systemd__unit_file('foo.service') }
      end
    end
  end
end
