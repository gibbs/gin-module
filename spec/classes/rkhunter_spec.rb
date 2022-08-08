require 'spec_helper'

describe 'gin', type: :class do
  context 'rkhunter on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'rkhunter' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::rkhunter') }
        it { is_expected.to contain_class('gin::rkhunter') }

        it { is_expected.to contain_gin__data('rkhunter') }
        it { is_expected.to contain_concat__fragment('gin-hiera-rkhunter') }
      end
    end
  end
end
