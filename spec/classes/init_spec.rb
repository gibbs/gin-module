require 'spec_helper'

describe 'gin', type: :class do
  context 'on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin') }
        it { is_expected.to contain_class('gin') }

        it { is_expected.to create_class('gin::components') }
        it { is_expected.to contain_class('gin::components') }

        it { is_expected.to contain_concat('/tmp/gin.yaml') }
      end
    end
  end
end
