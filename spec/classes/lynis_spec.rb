require 'spec_helper'

describe 'gin', type: :class do
  context 'lynis on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'lynis' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::lynis') }
        it { is_expected.to contain_class('gin::lynis') }

        it { is_expected.to contain_gin__data('lynis') }
        it { is_expected.to contain_concat__fragment('gin-hiera-lynis') }

        it { is_expected.to contain_archive('gin-lynis') }
      end
    end
  end
end
