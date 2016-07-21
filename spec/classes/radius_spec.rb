require 'spec_helper'

describe 'radius', :type => :class do
  context 'on Debian' do
    let(:facts) { {
      :osfamily => 'Debian',
      :lsbdistid => 'debian',
      :lsbdistcodename => 'squeeze'
    }}

    context 'with no parameters' do
      it { should compile.with_all_deps }

      it { should contain_package('freeradius').with(
        :ensure => 'present',
      )}

      it { should contain_service('radius').with(
        :ensure => 'running',
        :enable => true,
        :name   => 'freeradius'
      )}

      it { should contain_file('/etc/freeradius/radiusd.conf').with(
        :owner   => 'root',
        :group   => 'root',
        :mode    => '0644'
      )}
    end

    context 'with a custom package name' do
      let(:params) { { 'package_name' => 'dave' } }
      it { should contain_package('freeradius').with_name('dave') }
    end

    context 'with the package at a latest version' do
      let(:params) { { 'package_ensure' => 'latest' } }
      it { should contain_package('freeradius').with_ensure('latest') }
    end

    context 'with service management disabled' do
      let(:params) { { 'service_manage' => false } }
      it { should_not contain_service('radius') }
    end

    context 'with a custom service name' do
      let(:params) { { 'service_name' => 'dave' } }
      it { should contain_service('radius').with_name('dave') }
    end

    context 'with the service disabled' do
      let(:params) { { 'service_enable' => false } }
      it { should contain_service('radius').with_enable(false) }
    end

    context 'with the service stopped' do
      let(:params) { { 'service_ensure' => 'stopped' } }
      it { should contain_service('radius').with_ensure('stopped') }
    end

  end
end
