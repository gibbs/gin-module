require 'spec_helper'

describe 'gin', type: :class do
  context 'locales on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'locales' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::locales') }
        it { is_expected.to contain_class('gin::locales') }

        it { is_expected.to contain_gin__data('locales') }
        it { is_expected.to contain_concat__fragment('gin-hiera-locales') }
      end
    end
  end
end
