control 'V-214229' do
  title 'The Apache web server must perform server-side session management.'
  desc "Session management is the practice of protecting the bulk of the user
authorization and identity information. This data can be stored on the client
system or on the server.

    When the session information is stored on the client, the session ID, along
with the user authorization and identity information, is sent along with each
client request and is stored in a cookie, embedded in the uniform resource
locator (URL), or placed in a hidden field on the displayed form. Each of these
offers advantages and disadvantages. The biggest disadvantage to all three is
the possibility of the hijacking of a session along with all of the user's
credentials.

    When the user authorization and identity information is stored on the
server in a protected and encrypted database, the communication between the
client and Apache web server will only send the session identifier, and the
server can then retrieve user credentials for the session when needed. If,
during transmission, the session were to be hijacked, the user's credentials
would not be compromised."
  desc 'check', %q(Issue the following command:
httpd -M |grep -E 'session_module|usertrack'

Expected output:
usertrack_module (shared)
session_module (shared)

If results do not return both "usertrack_module (shared)" and "session_module (shared)", this is a finding.

Alternatively, determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.  

Search for the "session_module" and "usertrack_module" directives:

# cat /<path_to_file>/httpd.conf | grep -i "session_module"
# cat /<path_to_file>/httpd.conf | grep -i "usertrack_module"
If "session_module" and "usertrack_module" are not enabled or do not exist, this is a finding.)
  desc 'fix', 'If the modules are not installed, install any missing packages.

Add the following lines to the "httpd.conf" file:

LoadModule usertrack_module modules/mod_usertrack.so

LoadModule session_module modules/mod_session.so

Additional documentation can be found at:

https://httpd.apache.org/docs/2.4/mod/mod_usertrack.html

https://httpd.apache.org/docs/2.4/mod/mod_session.html

Restart Apache: apachectl restart'
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000001-WSR-000002'
  tag gid: 'V-214229'
  tag rid: 'SV-214229r881406_rule'
  tag stig_id: 'AS24-U1-000020'
  tag fix_id: 'F-15441r276948_fix'
  tag cci: ['CCI-000054']
  tag nist: ['AC-10']

  config_path = input('config_path')
  describe apache_conf(config_path) do
    its('LoadModule') { should include 'session_module modules/mod_session.so' }
    its('LoadModule') { should include 'usertrack_module modules/mod_usertrack.so' }
  end
end
