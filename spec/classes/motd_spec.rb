require 'spec_helper'

describe 'gin', type: :class do
  context 'motd on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'motd' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::motd') }
        it { is_expected.to contain_class('gin::motd') }

        it { is_expected.to contain_gin__data('motd') }
        it { is_expected.to contain_concat__fragment('gin-hiera-motd') }

        it { is_expected.to contain_file('/etc/issue.net') }
        it { is_expected.to contain_file('/etc/issue') }
        it { is_expected.to contain_file('/etc/motd') }

        if facts[:os]['family'] == 'Debian'
          it { is_expected.to contain_exec('update-motd.d permissions update') }
          it { is_expected.to contain_file('/etc/update-motd.d/99-legal') }
          it { is_expected.to contain_file('/etc/update-motd.d/') }
          it { is_expected.to contain_file('/var/tmp/gin-update-motd-hash') }

          it { is_expected.to contain_file('/etc/update-motd.d/85-fwupd') }
          it { is_expected.to contain_file('/etc/update-motd.d/98-cloudguest') }
        end
      end
    end
  end
end
