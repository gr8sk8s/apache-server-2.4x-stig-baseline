control 'V-214249' do
  title 'The Apache web server must separate the hosted applications from
hosted Apache web server management functionality.'
  desc 'The separation of user functionality from web server management can be
accomplished by moving management functions to a separate IP address or port.
To further separate the management functions, separate authentication methods
and certificates should be used.

    By moving the management functionality, the possibility of accidental
discovery of the management functions by non-privileged users during hosted
application use is minimized.'
  desc 'check', 'Review the web server documentation and deployed configuration to determine
whether hosted application functionality is separated from web server
management functions.

    If the functions are not separated, this is a finding.'
  desc 'fix', 'Configure Apache to separate the hosted applications from web
server management functionality.'
  impact 0.5
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000211-WSR-000129'
  tag gid: 'V-214249'
  tag rid: 'SV-214249r879631_rule'
  tag stig_id: 'AS24-U1-000450'
  tag fix_id: 'F-15461r277008_fix'
  tag cci: ['CCI-001082']
  tag nist: ['SC-2']

  describe 'The Apache web server must separate the hosted applications from hosted Apache web server management functionality.' do
    skip "Review the web server documentation and deployed configuration to determine whether hosted application functionality is separated from web server management functions.
    If the functions are not separated, this is a finding."
  end
end
