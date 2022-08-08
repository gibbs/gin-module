require 'spec_helper'

describe 'gin', type: :class do
  context 'repositories on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'repositories' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::repositories') }
        it { is_expected.to contain_class('gin::repositories') }

        it { is_expected.to contain_gin__data('repositories') }
        it { is_expected.to contain_concat__fragment('gin-hiera-repositories') }

        it { is_expected.to contain_vcsrepo('/path/to/repo1') }
        it { is_expected.to contain_vcsrepo('/path/to/repo2') }
        it { is_expected.to contain_vcsrepo('/path/to/repo3') }
        it { is_expected.to contain_vcsrepo('/path/to/repo4') }
        it { is_expected.to contain_vcsrepo('/vagrant/lockss-daemon-source') }
      end
    end
  end
end
