control 'SV-214248' do
  title 'Apache web server application directories,  libraries, and
configuration files must only be accessible to privileged users.'
  desc 'By separating Apache web server security functions from non-privileged users, roles can be developed that can then be used to administer the Apache web server. Forcing users to change from a non-privileged account to a privileged account when operating on the Apache web server or on security-relevant information forces users to only operate as a Web Server Administrator when necessary. Operating in this manner allows for better logging of changes and better forensic information and limits accidental changes to the Apache web server.

To limit changes to the Apache web server and limit exposure to any adverse effects from the changes, files such as the Apache web server application files, libraries, and configuration files must have permissions and ownership set properly to only allow privileged users access.'
  desc 'check', 'Obtain a list of the user accounts for the system, noting the privileges
for each account.

    Verify with the SA or the Information System Security Officer (ISSO) that
all privileged accounts are mission essential and documented.

    Verify with the SA or the ISSO that all non-administrator access to shell
scripts and operating system functions are mission essential and documented.

    If undocumented privileged accounts are present, this is a finding.

    If undocumented access to shell scripts or operating system functions is
present, this is a finding.'
  desc 'fix', 'Ensure non-administrators are not allowed access to the
directory tree, the shell, or other operating system functions and utilities.'
  impact 0.7
  ref 'DPMS Target Apache Server 2.4 UNIX Server'
  tag severity: 'high'
  tag gtitle: 'SRG-APP-000211-WSR-000031'
  tag satisfies: ['SRG-APP-000211-WSR-000031', 'SRG-APP-000141-WSR-000078', 'SRG-APP-000380-WSR-000072']
  tag gid: 'V-214248'
  tag rid: 'SV-214248r879631_rule'
  tag stig_id: 'AS24-U1-000440'
  tag fix_id: 'F-15460r505083_fix'
  tag cci: ['CCI-000381', 'CCI-001082', 'CCI-001813']
  tag nist: ['CM-7 a', 'SC-2', 'CM-5 (1)', 'CM-5 (1) (a)']

  describe 'Obtain a list of the user accounts for the system, noting the privileges for each account' do
    skip "Verify with the SA or the Information System Security Officer (ISSO) that all privileged accounts are mission essential and documented.
      Verify with the SA or the ISSO that all non-administrator access to shell scripts and operating system functions are mission essential and documented.
      If undocumented privileged accounts are present, this is a finding.
      If undocumented access to shell scripts or operating system functions is present, this is a finding."
  end
end
