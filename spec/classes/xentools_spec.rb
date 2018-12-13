require 'spec_helper'

describe 'xentools' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }

      # ensure resources
      it { is_expected.to contain_package('xe-guest-utilities').with(ensure: 'present') }
      it { is_expected.to contain_package('xe-guest-utilities-xenstore').with(ensure: 'present') }
    end
  end
end
