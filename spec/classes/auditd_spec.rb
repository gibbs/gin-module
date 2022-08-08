require 'spec_helper'

describe 'gin', type: :class do
  context 'auditd on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'auditd' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::auditd') }
        it { is_expected.to contain_class('gin::auditd') }

        it { is_expected.to contain_gin__data('auditd') }
        it { is_expected.to contain_concat__fragment('gin-hiera-auditd') }

        it { is_expected.to contain_auditd__rule('apparmor_acl') }
        it { is_expected.to contain_auditd__rule('apparmor_acl_alt') }
        it { is_expected.to contain_auditd__rule('selinux_acl') }
        it { is_expected.to contain_auditd__rule('selinux_acl_shared') }
        it { is_expected.to contain_auditd__rule('sudo_log') }
      end
    end
  end
end
