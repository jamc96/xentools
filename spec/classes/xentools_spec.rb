require 'spec_helper'

describe 'xentools' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      # validate compilation
      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }
      # class containment
      it { is_expected.to contain_class('xentools::install') }
      # ensure resources
      it { is_expected.to contain_package('xe-guest-utilities').with(ensure: 'present') }
      it { is_expected.to contain_package('xe-guest-utilities-xenstore').with(ensure: 'present') }
    end
  end
  context 'with is_virtual false' do
    let(:facts) { { 'is_virtual' => false } }

    # validate compilation
    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
    # class containment
    it { is_expected.not_to contain_class('xentools::install') }
  end
  context 'with package_utilities_source test' do
    let(:facts) { { 'is_virtual' => true } }
    let(:params) { { 'package_utilities_source' => 'test', 'package_xenstore_source' => 'test' } }

    # validate resources
    it { is_expected.to contain_package('xe-guest-utilities').with(ensure: 'present', source: 'test') }
    it { is_expected.to contain_package('xe-guest-utilities-xenstore').with(ensure: 'present', source: 'test') }
  end
end
