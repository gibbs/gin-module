require 'spec_helper'

describe 'gin', type: :class do
  context 'mount on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'mount' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::mount') }
        it { is_expected.to contain_class('gin::mount') }

        it { is_expected.to contain_gin__data('mount') }
        it { is_expected.to contain_concat__fragment('gin-hiera-mount') }

        it { is_expected.to contain_mount('/dev/shm') }
      end
    end
  end
end
