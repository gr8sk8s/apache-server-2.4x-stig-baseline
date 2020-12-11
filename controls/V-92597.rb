# encoding: UTF-8

control 'V-92597' do
  title "The Apache web server must limit the number of allowed simultaneous
session requests."
  desc  "Apache web server management includes the ability to control the
number of users and user sessions that utilize an Apache web server. Limiting
the number of allowed users and sessions per user is helpful in limiting risks
related to several types of denial-of-service (DOS) attacks.

    Although there is some latitude concerning the settings, they should follow
DoD-recommended values and be configurable to allow for future DoD direction.
While the DoD will specify recommended values, the values can be adjusted to
accommodate the operational requirements of a given system.
  "
  desc  'rationale', ''
  desc  'check', "
    Determine the location of the \"HTTPD_ROOT\" directory and the
\"httpd.conf\" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT=\"/etc/httpd\"
    -D SERVER_CONFIG_FILE=\"conf/httpd.conf\"

    Search for the directives \"KeepAlive\" and \"MaxKeepAliveRequests\" in the
\"httpd.conf\" file:

    # cat /<path_to_file>/httpd.conf | grep -i \"keepalive\"

    KeepAlive On
    MaxKeepAliveRequests 100

    If the value of \"KeepAlive\" is set to \"off\" or does not exist, this is
a finding.

    If the value of \"MaxKeepAliveRequests\" is set to a value less than
\"100\" or does not exist, this is a finding.
  "
  desc  'fix', "
    Determine the location of the \"HTTPD_ROOT\" directory and the
\"httpd.conf\" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT=\"/etc/httpd\"
    -D SERVER_CONFIG_FILE=\"conf/httpd.conf\"

    Set the \"KeepAlive\" directive to a value of \"on\"; add the directive if
it does not exist.

    Set the \"MaxKeepAliveRequests\" directive to a value of \"100\" or
greater; add the directive if it does not exist.

    Restart Apache: apachectl restart
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000001-WSR-000001'
  tag gid: 'V-92597'
  tag rid: 'SV-102685r1_rule'
  tag stig_id: 'AS24-U1-000010'
  tag fix_id: 'F-98839r1_fix'
  tag cci: ['CCI-000054']
  tag nist: ['AC-10']

  config_path = input('config_path')

  describe apache_conf(config_path) do 
    its('KeepAlive') { should_not be_nil }
  end

  if !apache_conf(config_path).KeepAlive.nil?
    apache_conf(config_path).KeepAlive.each do |value|
      describe "KeepAlive value should be set to On" do
        subject { value } 
        it { should cmp 'On' }
      end
    end
  end

  describe apache_conf(config_path) do 
    its('MaxKeepAliveRequests') { should_not be_nil }
  end

  if !apache_conf(config_path).MaxKeepAliveRequests.nil?
    apache_conf(config_path).MaxKeepAliveRequests.each do |value|
      describe "If the value of \"MaxKeepAliveRequests\" is set to a value less than \"100\" or does not exist, this is a finding." do
        subject { value } 
        it { should cmp < '100' }
      end
    end
  end
  
end

