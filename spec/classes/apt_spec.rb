require 'spec_helper'

describe 'gin', type: :class do
  context 'apt on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'apt' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::apt') }
        it { is_expected.to contain_class('gin::apt') }

        if facts[:os]['family'] == 'Debian'
          it { is_expected.to contain_file('/var/lib/apt/tmp/') }
          it { is_expected.to contain_gin__data('apt') }
          it { is_expected.to contain_concat__fragment('gin-hiera-apt') }

          it { is_expected.to contain_apt__conf('progressbar') }
          it { is_expected.to contain_apt__key('puppetlabs') }
          it { is_expected.to contain_apt__mark('emacs') }
          it { is_expected.to contain_apt__mark('ruby') }
          it { is_expected.to contain_apt__pin('docker') }
          it { is_expected.to contain_apt__source('ubuntu-partner') }

          if facts[:os]['name'] != 'Debian'
            it { is_expected.to contain_apt__ppa('ppa:ondrej/apache2') }
            it { is_expected.to contain_apt__ppa('ppa:ondrej/php') }
          end
        end
      end
    end
  end
end
