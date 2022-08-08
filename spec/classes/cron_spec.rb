require 'spec_helper'

describe 'gin', type: :class do
  context 'cron on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'cron' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::cron') }
        it { is_expected.to contain_class('gin::cron') }

        it { is_expected.to contain_concat__fragment('cron.allow - root') }
        it { is_expected.to contain_concat('/etc/cron.allow') }
        it { is_expected.to contain_cron('MAILTO') }
        it { is_expected.to contain_cron('laravel-schedule') }
        it { is_expected.to contain_file('/etc/cron.d/') }
        it { is_expected.to contain_file('/etc/cron.daily/') }
        it { is_expected.to contain_file('/etc/cron.hourly/') }
        it { is_expected.to contain_file('/etc/cron.monthly/') }
        it { is_expected.to contain_file('/etc/cron.weekly/') }
        it { is_expected.to contain_file('/etc/cron.deny') }
        it { is_expected.to contain_file('/etc/crontab') }
        it { is_expected.to contain_resources('cron') }

        it { is_expected.to contain_gin__data('cron') }
        it { is_expected.to contain_concat__fragment('gin-hiera-cron') }
      end
    end
  end
end
