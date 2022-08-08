require 'spec_helper'

describe 'gin', type: :class do
  context 'files on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'files' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::files') }
        it { is_expected.to contain_class('gin::files') }

        it { is_expected.to contain_file('/tmp/dir1') }
        it { is_expected.to contain_file('test1') }
        it { is_expected.to contain_file('test2') }

        it { is_expected.to contain_gin__data('files') }
        it { is_expected.to contain_concat__fragment('gin-hiera-files') }
      end
    end
  end
end
