require 'spec_helper'

describe 'gin', type: :class do
  context 'docker on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'docker' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::docker') }
        it { is_expected.to contain_class('gin::docker') }

        it { is_expected.to contain_gin__data('docker') }
        it { is_expected.to contain_concat__fragment('gin-hiera-docker') }

        it { is_expected.to contain_docker__image('traefik') }
        it { is_expected.to contain_docker__run('httpd') }
      end
    end
  end
end
