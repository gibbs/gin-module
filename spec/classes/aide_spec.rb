require 'spec_helper'

describe 'gin', type: :class do
  context 'aide on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'aide' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::aide') }
        it { is_expected.to contain_class('gin::aide') }

        it { is_expected.to contain_gin__data('aide') }
        it { is_expected.to contain_concat__fragment('gin-hiera-aide') }

        it { is_expected.to contain_file('/etc/aide/') }
        it { is_expected.to contain_file('/var/lib/aide/') }
        it { is_expected.to contain_file('/var/log/aide/') }

        it { is_expected.to contain_aide__rule('homerule') }
        it { is_expected.to contain_aide__watch('aide_aide_home') }
        it { is_expected.to contain_aide__watch('aide_aide_home_exclude') }
        it { is_expected.to contain_aide__watch('aide_aide_root') }
        it { is_expected.to contain_aide__watch('aide_aide_root_ignore') }
      end
    end
  end
end
