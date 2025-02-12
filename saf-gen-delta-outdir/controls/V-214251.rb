control 'V-214251' do
  title 'Cookies exchanged between the Apache web server and client, such as
session cookies, must have security settings that disallow cookie access
outside the originating Apache web server and hosted application.'
  desc 'Cookies are used to exchange data between the web server and the
client. Cookies, such as a session cookie, may contain session information and
user credentials used to maintain a persistent connection between the user and
the hosted application since HTTP/HTTPS is a stateless protocol.

    When the cookie parameters are not set properly (i.e., domain and path
parameters), cookies can be shared within hosted applications residing on the
same web server or to applications hosted on different web servers residing on
the same domain.'
  desc 'check', %q(Note: For web servers acting as a public facing with static content that do not require authentication, this is Not Applicable.

Review the web server documentation and configuration to determine if cookies between the web server and client are accessible by applications or web servers other than the originating pair.

grep SessionCookieName <'INSTALL LOCATION'>/mod_session.conf

Confirm that the "HttpOnly" and "Secure" settings are present in the line returned.

Confirm that the line does not contain the "Domain" cookie setting.

Verify the "headers_module (shared)" module is loaded in the web server:

"# httpd -M 
Verify " headers_module (shared)" is returned in the list of Loaded Modules from the above command."

If the "headers_module (shared)" is not loaded, this is a finding.)
  desc 'fix', 'Edit the "mod_session.conf" file and find the "SessionCookieName"
directive.

    Set the "SessionCookieName" to "session path=/; HttpOnly; Secure; "

    Example:

    SessionCookieName session path=/; HttpOnly; Secure;

    Restart Apache: apachectl restart'
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000223-WSR-000011'
  tag gid: 'V-214251'
  tag rid: 'SV-214251r879638_rule'
  tag stig_id: 'AS24-U1-000470'
  tag fix_id: 'F-15463r277014_fix'
  tag cci: ['CCI-001664']
  tag nist: ['SC-23 (3)']

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

  headers_module = command('httpd -M | grep -i headers_module (shared)')

  describe headers_module.stdout.strip do
    it { should_not cmp '' }
  end
end
