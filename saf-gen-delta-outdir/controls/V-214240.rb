control 'V-214240' do
  title 'The Apache web server must only contain services and functions
necessary for operation.'
  desc 'A web server can provide many features, services, and processes. Some
of these may be deemed unnecessary or too unsecure to run on a production DoD
system.

    The web server must provide the capability to disable, uninstall, or
deactivate functionality and services that are deemed to be non-essential to
the web server mission or can adversely impact server performance.'
  desc 'check', 'If the site requires the use of a particular piece of software, verify that the Information System Security Officer (ISSO) maintains documentation identifying this software as necessary for operations. The software must be operated at the vendor’s current patch level and must be a supported vendor release.

If programs or utilities that meet the above criteria are installed on the web server and appropriate documentation and signatures are in evidence, this is not a finding.

Determine whether the web server is configured with unnecessary software.

Determine whether processes other than those that support the web server are loaded and/or run on the web server.

Examples of software that should not be on the web server are all web development tools, office suites (unless the web server is a private web development server), compilers, and other utilities that are not part of the web server suite or the basic operating system.

Check the directory structure of the server and verify that additional, unintended, or unneeded applications are not loaded on the system.

If, after review of the application on the system, there is no justification for the identified software, this is a finding.'
  desc 'fix', 'Remove any unnecessary applications per ISSO documentation.'
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000141-WSR-000075'
  tag gid: 'V-214240'
  tag rid: 'SV-214240r879587_rule'
  tag stig_id: 'AS24-U1-000250'
  tag fix_id: 'F-15452r622513_fix'
  tag cci: ['CCI-000381']
  tag nist: ['CM-7 a']

  describe 'The Apache web server must only contain services and functions necessary for operation' do
    skip 'Verify the document root directory and the configuration files do not provide for default index.html or welcome page.'
  end

  describe package('httpd-manual') do
    it { should_not be_installed }
  end

  config_path = input('config_path')
  apache_config = apache_conf(config_path)

  describe apache_config.params('SetHandler') do
    it { should_not include 'server-status' }
    it { should_not include 'server-info' }
    it { should_not include 'perl-script' }
  end
end
