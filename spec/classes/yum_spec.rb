require 'spec_helper'

describe 'gin', type: :class do
  context 'yum on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'yum' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::yum') }
        it { is_expected.to contain_class('gin::yum') }

        if facts[:os]['family'] == 'RedHat'
          it { is_expected.to contain_gin__data('yum') }
          it { is_expected.to contain_concat__fragment('gin-hiera-yum') }

          it { is_expected.to contain_yum__gpgkey('/etc/pki/gpm-gpg/rpm-gpg-example') }
          it { is_expected.to contain_yum__group('X Window System') }
          it { is_expected.to contain_yum__post_transaction_action('touch_file') }
          it { is_expected.to contain_yum__versionlock('bash') }
        end
      end
    end
  end
end
