require 'spec_helper'

describe 'gin', type: :class do
  context 'archives on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'archives' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::archives') }
        it { is_expected.to contain_class('gin::archives') }

        it { is_expected.to contain_archive('/tmp/jta-1.1.jar') }
        it { is_expected.to contain_archive('/tmp/test100k.db') }
        it { is_expected.to contain_archive('/tmp/vagrant.deb') }

        it { is_expected.to contain_gin__data('archives') }
        it { is_expected.to contain_concat__fragment('gin-hiera-archives') }
      end
    end
  end
end
