require 'spec_helper'

describe 'gin', type: :class do
  context 'alternatives on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'alternatives' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::alternatives') }
        it { is_expected.to contain_class('gin::alternatives') }

        it { is_expected.to contain_alternatives('aptitude') }
        it { is_expected.to contain_alternatives('cc') }
        it { is_expected.to contain_alternatives('editor') }
        it { is_expected.to contain_alternative_entry('/usr/bin/gcc-4.4') }

        it { is_expected.to contain_gin__data('alternatives') }
        it { is_expected.to contain_concat__fragment('gin-hiera-alternatives') }
      end
    end
  end
end
