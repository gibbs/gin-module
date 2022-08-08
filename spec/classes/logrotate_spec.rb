require 'spec_helper'

describe 'gin', type: :class do
  context 'logrotate on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'logrotate' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::logrotate') }
        it { is_expected.to contain_class('gin::logrotate') }

        it { is_expected.to contain_gin__data('logrotate') }
        it { is_expected.to contain_concat__fragment('gin-hiera-logrotate') }

        it { is_expected.to contain_logrotate__rule('alternatives') }
        it { is_expected.to contain_logrotate__rule('pxp-agent') }
      end
    end
  end
end
