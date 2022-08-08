require 'spec_helper'

describe 'gin', type: :class do
  context 'pam on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'pam' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::pam') }
        it { is_expected.to contain_class('gin::pam') }

        it { is_expected.to contain_gin__data('pam') }
        it { is_expected.to contain_concat__fragment('gin-hiera-pam') }

        it { is_expected.to contain_pam__service('pwquality.conf') }
        it { is_expected.to contain_pam__service('su') }
      end
    end
  end
end
