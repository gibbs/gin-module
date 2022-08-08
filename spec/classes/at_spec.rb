require 'spec_helper'

describe 'gin', type: :class do
  context 'at on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'at' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::at') }
        it { is_expected.to contain_class('gin::at') }

        it { is_expected.to contain_concat('/etc/at.allow') }
        it { is_expected.to contain_concat_fragment('at+root.user') }
        it { is_expected.to contain_concat_fragment('at+testuser.user') }
        it { is_expected.to contain_file('/etc/at.deny') }
        it { is_expected.to contain_package('at') }
        it { is_expected.to contain_service('atd') }

        it { is_expected.to contain_gin__data('at') }
        it { is_expected.to contain_concat__fragment('gin-hiera-at') }
      end
    end
  end
end
