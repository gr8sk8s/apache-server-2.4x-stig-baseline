control 'V-214255' do
  title 'The Apache web server must be tuned to handle the operational
requirements of the hosted application.'
  desc 'A denial of service (DoS) can occur when the Apache web server is so
overwhelmed that it can no longer respond to additional requests. A web server
not properly tuned may become overwhelmed and cause a DoS condition even with
expected traffic from users. To avoid a DoS, the Apache web server must be
tuned to handle the expected traffic for the hosted applications.'
  desc 'check', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Verify that the "Timeout" directive is specified to have a value of "10" seconds or less.

# cat /<path_to_file>/httpd.conf | grep -i "Timeout"

If the "Timeout" directive is not configured or is set for more than "10" seconds, this is a finding.)
  desc 'fix', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Add or modify the "Timeout" directive to have a value of "10" seconds or less:

"Timeout 10")
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000246-WSR-000149'
  tag satisfies: ['SRG-APP-000246-WSR-000149', 'SRG-APP-000435-WSR-000148']
  tag gid: 'V-214255'
  tag rid: 'SV-214255r881441_rule'
  tag stig_id: 'AS24-U1-000590'
  tag fix_id: 'F-15467r881440_fix'
  tag cci: ['CCI-001094', 'CCI-002385']
  tag nist: ['SC-5 (1)', 'SC-5', 'SC-5 a']

  config_path = input('config_path')
  describe apache_conf(config_path) do
    its('Timeout') { should_not be_nil }
  end

  unless apache_conf(config_path).Timeout.nil?
    apache_conf(config_path).Timeout.each do |value|
      describe 'Timeout value definition' do
        subject { value }
        it { should cmp <= 10 }
      end
    end
  end
end
