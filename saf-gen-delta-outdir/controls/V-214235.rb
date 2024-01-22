control 'V-214235' do
  title 'The Apache web server log files must only be accessible by privileged
users.'
  desc 'Log data is essential in the investigation of events. If log data were
to become compromised, competent forensic analysis and discovery of the true
source of potentially malicious system activity would be difficult, if not
impossible, to achieve. In addition, access to log records provides information
an attacker could potentially use to their advantage since each event record
might contain communication ports, protocols, services, trust relationships,
user names, etc.

    The web server must protect the log data from unauthorized read, write,
copy, etc. This can be done by the web server if the web server is also doing
the logging function. The web server may also use an external log system. In
either case, the logs must be protected from access by non-privileged users.'
  desc 'check', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.

Work with the Administrator to locate the log files:
Example: /etc/httpd/logs

List the POSIX permission set and owner/group of the log files:
# ls -laH /etc/httpd/logs/*log*
Output Example:
-rw-r------. 1 apache root    0 Sep 27 2020 /etc/httpd/logs/access_log
-rw-r------. 1 apache root 1235 Sep 23 2020 /etc/httpd/logs/access_log-20200927
-rw-r------. 1 apache root  332 Sep 26 03:40 /etc/httpd/logs/error_log

Only system administrators and service accounts running the server should have permissions to the files and the POSIX permissions should be set to 640 or more restrictive

If any users other than those authorized have read access to the log files, this is a finding.)
  desc 'fix', 'To protect the integrity of the data that is being captured in
the log files, ensure that only the members of the Auditors group,
Administrators, and the user assigned to run the web server software is granted
permissions to read the log files.'
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000118-WSR-000068'
  tag gid: 'V-214235'
  tag rid: 'SV-214235r881417_rule'
  tag stig_id: 'AS24-U1-000180'
  tag fix_id: 'F-15447r276966_fix'
  tag cci: ['CCI-000162']
  tag nist: ['AU-9', 'AU-9 a']

  config_path = input('config_path')
  apache_conf_dir = apache_conf(config_path).conf_dir
  apache_logs_dir = File.join(apache_conf_dir[0], 'logs')
  log_files = command("find #{apache_logs_dir}").stdout.split("\n")

  if !log_files.empty?
    log_files.each do |log|
      describe 'Only system administrators and service accounts running the server should have permissions to the files.' do
        subject { file(log) }
        its('owner') { should be_in input('server_admins') }
        its('group') { should be_in input('server_admin_groups') }
      end
    end
  else
    describe 'Only system administrators and service accounts running the server should have permissions to the files.' do
      skip 'Logs files could not be found. This check has to be manually reviewed.'
    end
  end
end
