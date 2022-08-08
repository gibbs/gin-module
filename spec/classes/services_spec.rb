require 'spec_helper'

describe 'gin', type: :class do
  context 'services on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'services' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::services') }
        it { is_expected.to contain_class('gin::services') }

        it { is_expected.to contain_service('autofs') }
        it { is_expected.to contain_service('bind9') }

        it { is_expected.to contain_gin__data('services') }
        it { is_expected.to contain_concat__fragment('gin-hiera-services') }
      end
    end
  end
end
