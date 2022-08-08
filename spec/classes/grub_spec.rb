require 'spec_helper'

describe 'gin', type: :class do
  context 'grub on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'grub' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::grub') }
        it { is_expected.to contain_class('gin::grub') }

        it { is_expected.to contain_exec('GRUB password configuration change') }
        it { is_expected.to contain_exec('Remove addition for keeping system bootable without credentials') }

        if facts[:os]['family'] == 'Debian'
          it { is_expected.to contain_file('/boot/grub/grub.cfg') }
        else
          it { is_expected.to contain_file('/boot/grub2/grub.cfg') }
        end

        it { is_expected.to contain_file('/etc/grub.d/01_password') }

        it { is_expected.to contain_gin__data('grub') }
        it { is_expected.to contain_concat__fragment('gin-hiera-grub') }
      end
    end
  end
end
