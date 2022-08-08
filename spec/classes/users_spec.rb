require 'spec_helper'

describe 'gin', type: :class do
  context 'users on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'users' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::users') }
        it { is_expected.to contain_class('gin::users') }

        it { is_expected.to contain_gin__data('users') }
        it { is_expected.to contain_concat__fragment('gin-hiera-users') }

        it { is_expected.to contain_accounts__user('test1') }
        it { is_expected.to contain_file('/home/test1/.hushlogin') }
        it { is_expected.to contain_ssh_keygen('test1') }

        it { is_expected.to contain_accounts__user('test2') }
        it { is_expected.to contain_file('/home/test2/.hushlogin') }
        it { is_expected.to contain_ssh_keygen('test2') }

        it { is_expected.to contain_accounts__user('user3') }
        it { is_expected.to contain_file('/home/user3/.hushlogin') }
        it { is_expected.to contain_ssh_keygen('user3') }
        it { is_expected.to contain_concat__fragment('cron.allow - user3') }

        it { is_expected.to contain_accounts__user('systemuser1') }

        it { is_expected.to contain_group('sudo') }
        it { is_expected.to contain_group('admin') }
        it { is_expected.to contain_group('power') }
      end
    end
  end
end
