require 'spec_helper'

describe 'safekeep' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "safekeep class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('safekeep::params') }
        it { should contain_class('safekeep::install').that_comes_before('safekeep::config') }
        it { should contain_class('safekeep::config') }
        it { should contain_class('safekeep::service').that_subscribes_to('safekeep::config') }

        it { should contain_service('safekeep') }
        it { should contain_package('safekeep').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'safekeep class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('safekeep') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
