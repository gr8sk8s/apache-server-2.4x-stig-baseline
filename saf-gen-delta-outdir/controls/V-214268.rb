control 'V-214268' do
  title 'Cookies exchanged between the Apache web server and the client, such
as session cookies, must have cookie properties set to prohibit client-side
scripts from reading the cookie data.'
  desc 'A cookie can be read by client-side scripts easily if cookie
properties are not set properly. By allowing cookies to be read by the
client-side scripts, information such as session identifiers could be
compromised and used by an attacker who intercepts the cookie. Setting cookie
properties (i.e., HttpOnly property) to disallow client-side scripts from
reading cookies better protects the information inside the cookie.'
  desc 'check', %q(Verify the session cookie module is loaded

# httpd -M | grep -i session_cookie_module
Output should look similar to: session_cookie_module (shared)

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Search for the directive "Session" in the "httpd.conf" file:

# cat httpd.conf  | grep -i "Session"
Output should be similar to: 
Session on
SessionCookieName httpOnly Secure
SessionCryptoCipher aes256
SessionMaxAge 600

Note: SSL directives can also be located in /etc/httpd/conf.d/ssl.conf.

If the "Session" and "SessionCookieName" directives are not present, this is a finding.

If "Session" is not set to "on" and "SessionCookieName" does not contain "httpOnly" and "secure", this is a finding.)
  desc 'fix', %q(Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"
 
NOTE: SSL directives may also be located in /etc/httpd/conf.d/ssl.conf.

Set "Session" to "on".

Ensure the "SessionCookieName" directive includes "httpOnly" and "secure".)
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000439-WSR-000154'
  tag satisfies: ['SRG-APP-000439-WSR-000154', 'SRG-APP-000439-WSR-000155']
  tag gid: 'V-214268'
  tag rid: 'SV-214268r881461_rule'
  tag stig_id: 'AS24-U1-000870'
  tag fix_id: 'F-15480r881460_fix'
  tag cci: ['CCI-002418']
  tag nist: ['SC-8']

  config_path = input('config_path')
  describe apache_conf(config_path) do
    its('SessionCookieName') { should_not be_nil }
  end

  unless apache_conf(config_path).SessionCookieName.nil?
    apache_conf(config_path).SessionCookieName.each do |value|
      describe 'SessionCookieName value should return httpOnly and Secure' do
        subject { value }
        it { should include 'httpOnly' }
        it { should include 'Secure' }
      end
    end
  end

  describe apache_conf(config_path) do
    its('Session') { should_not be_nil }
  end

  unless apache_conf(config_path).Session.nil?
    apache_conf(config_path).Session.each do |value|
      describe 'Session value should be set to on' do
        subject { value }
        it { should cmp 'on' }
      end
    end
  end
end
