require 'spec_helper'

describe 'gin', type: :class do
  context 'lvm on supported systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:params) do
          {
            components: { 'lvm' => true },
          }
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('gin::lvm') }
        it { is_expected.to contain_class('gin::lvm') }

        it { is_expected.to contain_gin__data('lvm') }
        it { is_expected.to contain_concat__fragment('gin-hiera-lvm') }

        it { is_expected.to contain_lvm__volume('mylv') }
        it { is_expected.to contain_lvm__logical_volume('mylv2') }
        it { is_expected.to contain_lvm__physical_volume('/dev/sdb3') }
        it { is_expected.to contain_lvm__volume_group('myvg2') }
        it { is_expected.to contain_lvm__volume_group('myvg3') }
      end
    end
  end
end
