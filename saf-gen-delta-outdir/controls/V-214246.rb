control 'V-214246' do
  title 'The Apache web server must be configured to use a specified IP address
and port.'
  desc 'The web server must be configured to listen on a specified IP address
and port. Without specifying an IP address and port for the web server to use,
the web server will listen on all IP addresses available to the hosting server.
If the web server has multiple IP addresses, i.e., a management IP address, the
web server will also accept connections on the management IP address.

    Accessing the hosted application through an IP address normally used for
non-application functions opens the possibility of user access to resources,
utilities, files, ports, and protocols that are protected on the desired
application IP address.'
  desc 'check', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 
Search for the "Listen" directive:

# cat /<path_to_file>/httpd.conf | grep -i "Listen"

Verify that any enabled "Listen" directives specify both an IP address and port number.

If the "Listen" directive is found with only an IP address or only a port number specified, this is finding.

If the IP address is all zeros (i.e., 0.0.0.0:80 or [::ffff:0.0.0.0]:80), this is a finding.

If the "Listen" directive does not exist, this is a finding.)
  desc 'fix', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Set the "Listen" directive to listen on a specific IP address and port.

Restart Apache: apachectl restart)
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000142-WSR-000089'
  tag satisfies: ['SRG-APP-000142-WSR-000089', 'SRG-APP-000176-WSR-000096']
  tag gid: 'V-214246'
  tag rid: 'SV-214246r881430_rule'
  tag stig_id: 'AS24-U1-000360'
  tag fix_id: 'F-15458r881429_fix'
  tag cci: ['CCI-000186', 'CCI-000382']
  tag nist: ['IA-5 (2) (b)', 'CM-7 b', 'IA-5 (2) (a) (1)']

  config_path = input('config_path')
  listen = apache_conf(config_path).params('Listen')

  if !listen.nil?
    listen.each do |address|
      describe address do
        it { should match /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]):[0-9]+$/ }
        it { should_not match /^0.0.0.0:[0-9]+$/ }
      end
    end
  else
    describe apache_conf(config_path) do
      its('Listen') { should_not cmp nil }
    end
  end
end
