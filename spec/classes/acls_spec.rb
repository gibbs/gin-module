require 'spec_helper'

describe 'gin', type: :class do
  context 'acls on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'acls' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::acls') }
        it { is_expected.to contain_class('gin::acls') }

        it { is_expected.to contain_posix_acl('/var/log/httpd') }

        it { is_expected.to contain_gin__data('acls') }
        it { is_expected.to contain_concat__fragment('gin-hiera-acls') }
      end
    end
  end
end
