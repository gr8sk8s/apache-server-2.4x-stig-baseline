control 'V-214231' do
  title 'The Apache web server must have system logging enabled.'
  desc 'The server error logs are invaluable because they can also be used to
identify potential problems and enable proactive remediation. Log data can
reveal anomalous behavior such as “not found” or “unauthorized” errors that may
be an evidence of attack attempts. Failure to enable error logging can
significantly reduce the ability of Web Administrators to detect or remediate
problems. The CustomLog directive specifies the log file, syslog facility, or
piped logging utility.'
  desc 'check', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.

Search for the directive "CustomLog" in the "httpd.conf" file:

# cat /<path_to_file>/httpd.conf | grep -i "CustomLog"

If the "CustomLog" directive is missing, this is a finding:

An example CustomLog directive would be as follows:
CustomLog "logs/access_log" common or CustomLog “log/access_log” combined
(May also be "Logs/access_log"))
  desc 'fix', 'Edit the "httpd.conf" file and enter the name, path and level
for the CustomLog.'
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000516-WSR-000174'
  tag gid: 'V-214231'
  tag rid: 'SV-214231r881410_rule'
  tag stig_id: 'AS24-U1-000065'
  tag fix_id: 'F-15443r276954_fix'
  tag cci: ['CCI-000366']
  tag nist: ['CM-6 b']

  config_path = input('config_path')
  describe apache_conf(config_path) do
    its('CustomLog') { should_not be_empty }
  end
end
