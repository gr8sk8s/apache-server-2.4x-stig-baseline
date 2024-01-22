## Automatic Update:  -> 

### New Controls:

### Updated Control IDs:
<details>
  <summary>Click to expand.</summary>
  
 -  V-92597 -> V-214228
 -  V-92599 -> V-214229
 -  V-92601 -> V-214230
 -  V-92607 -> V-214231
 -  V-92609 -> V-214232
 -  V-92621 -> V-214233
 -  V-92627 -> V-214234
 -  V-92629 -> V-214235
 -  V-92631 -> V-214236
 -  V-92635 -> V-214237
 -  V-92637 -> V-214238
 -  V-92639 -> V-214239
 -  V-92641 -> V-214240
 -  V-92643 -> V-214241
 -  V-92645 -> V-214242
 -  V-92653 -> V-214243
 -  V-92655 -> V-214244
 -  V-92659 -> V-214245
 -  V-92661 -> V-214246
 -  V-92671 -> V-214247
 -  V-92673 -> V-214248
 -  V-92675 -> V-214249
 -  V-92677 -> V-214250
 -  V-92679 -> V-214251
 -  V-92687 -> V-214252
 -  V-92689 -> V-214253
 -  V-92695 -> V-214254
 -  V-92697 -> V-214255
 -  V-92699 -> V-214256
 -  V-92701 -> V-214257
 -  V-92705 -> V-214258
 -  V-92709 -> V-214259
 -  V-92711 -> V-214260
 -  V-92713 -> V-214261
 -  V-92715 -> V-214262
 -  V-92717 -> V-214263
 -  V-92719 -> V-214264
 -  V-92723 -> V-214265
 -  V-92727 -> V-214266
 -  V-92731 -> V-214267
 -  V-92741 -> V-214268
 -  V-92745 -> V-214269
 -  V-92749 -> V-214270
 -  V-92751 -> V-214271
 -  V-92753 -> V-214272
 -  V-92755 -> V-214273
 -  V-92757 -> V-214274
</details>

### Updated Check/Fixes:
#### Checks:
<details open>
  <summary>Click to expand.</summary>
V-214228:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the directives "KeepAlive" and "MaxKeepAliveRequests" in the
"httpd.conf" file:

    # cat /<path_to_file>/httpd.conf | grep -i "keepalive"

    KeepAlive On
    MaxKeepAliveRequests 100

    If the value of "KeepAlive" is set to "off" or does not exist, this is
a finding.

    If the value of "MaxKeepAliveRequests" is set to a value less than
"100" or does not exist, this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.

Search for the directives "KeepAlive" and "MaxKeepAliveRequests" in the "httpd.conf" file:

# cat /<path_to_file>/httpd.conf | grep -i "keepalive"

KeepAlive On
MaxKeepAliveRequests 100

If the value of "KeepAlive" is set to "off" or does not exist, this is a finding.

If the value of "MaxKeepAliveRequests" is set to a value less than "100" or does not exist, this is a finding.

```
---
V-214229:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the "session_module" and "usertrack_module" directives:

    # cat /<path_to_file>/httpd.conf | grep -i "session_module"
    # cat /<path_to_file>/httpd.conf | grep -i "usertrack_module"
    If "session_module" and "usertrack_module" are not enabled or do not
exist, this is a finding.

    Alternatively, issue the following command:
    httpd -M |grep -E 'session_module|usertrack'
    If results do not return both usertrack_module (shared) and session_module
(shared), this is a finding.

```

Updated:
```
Issue the following command:
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
If "session_module" and "usertrack_module" are not enabled or do not exist, this is a finding.

```
---
V-214230:
Old: 
```
In a command line, run "httpd -M | grep -i ssl_module".

    If the "ssl_module" is not found, this is a finding.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the "SSLCACertificateFile" directive:

    # cat /<path_to_file>/httpd.conf | grep -i "SSLCACertificateFile"

    Review the path of the "SSLCACertificateFile" directive.

    Review the contents of <'path of SSLCACertificateFile'>\ca-bundle.crt.

    Examine the contents of this file to determine if the trusted CAs are DoD
approved.

    If the trusted CA that is used to authenticate users to the website does
not lead to an approved DoD CA, this is a finding.

    NOTE: There are non-DoD roots that must be on the server for it to
function. Some applications, such as antivirus programs, require root CAs to
function. DoD-approved certificate can include the External Certificate
Authorities (ECA) if approved by the AO. The PKE InstallRoot 3.06 System
Administrator Guide (SAG), dated 08 Jul 2008, contains a complete list of DoD,
ECA, and IECA CAs.

```

Updated:
```
Verify the "ssl module" module is loaded
# httpd -M | grep -i ssl_module
Output:  ssl_module (shared) 

If the "ssl_module" is not found, this is a finding. 

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.  

Search for the directive "SSLProtocol" in the "httpd.conf" file: 

# cat /<path_to_file>/httpd.conf | grep -i "SSLProtocol" 

If the "SSLProtocol" directive is missing or does not look like the following, this is a finding: 

SSLProtocol -ALL +TLSv1.2 

If the TLS version is not TLS 1.2 or higher, according to NIST SP 800-52 Rev 2, or if non-FIPS-approved algorithms are enabled, this is a finding.

```
---
V-214231:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the directive "CustomLog" in the "httpd.conf" file:

    # cat /<path_to_file>/httpd.conf | grep -i "CustomLog"

    If the "CustomLog" directive is missing, this is a finding:

    An example CustomLog directive would be as follows:
    CustomLog "logs/access_log" common or CustomLog “log/access_log” combined
    (May also be "Logs/access_log")

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.

Search for the directive "CustomLog" in the "httpd.conf" file:

# cat /<path_to_file>/httpd.conf | grep -i "CustomLog"

If the "CustomLog" directive is missing, this is a finding:

An example CustomLog directive would be as follows:
CustomLog "logs/access_log" common or CustomLog “log/access_log” combined
(May also be "Logs/access_log")

```
---
V-214232:
Old: 
```
In a command line, run "httpd -M | grep -i log_config_module".

    If the "log_config_module" is not enabled, this is a finding.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the directive "LogFormat" in the "httpd.conf" file:

    # cat /<path_to_file>/httpd.conf | grep -i "LogFormat"

    If the "LogFormat" directive is missing, this is a finding:

    An example is:
    LogFormat "%a %A %h %H %l %m %s %t %u %U \"%{Referer}i\" " common

```

Updated:
```
Verify the Log Configuration Module is loaded:
# httpd -M | grep -i log_config_module
Output:  log_config_module (shared)

If the "log_config_module" is not enabled, this is a finding.

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.  

Search for the directive "LogFormat" in the "httpd.conf" file:

# cat /<path_to_file>/httpd.conf | grep -i "LogFormat"

If the "LogFormat" directive is missing, this is a finding:

An example is:
LogFormat "%a %A %h %H %l %m %s %t %u %U \"%{Referer}i\" " common

```
---
V-214233:
Old: 
```
Interview the System Administrator to review the configuration of the
Apache web server architecture and determine if inbound web traffic is passed
through a proxy.

    If the Apache web server is receiving inbound web traffic through a proxy,
the audit logs must be reviewed to determine if correct source information is
being passed through by the proxy server.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Review the location of the log files.

    When the log file is displayed, review the source IP information in the log
entries and verify the entries do not reflect the IP address of the proxy
server.
    If the log entries in the log file(s) reflect the IP address of the client
in addition to the proxy address, this is not a finding.
    If the log entries in the log file(s) reflect the IP address of the proxy
server as the source, this is a finding.

    If logs containing source/destination IPs can be obtained at the load
balancer/proxy server, this is not a finding.

```

Updated:
```
If Apache server is not behind a load balancer or proxy server, this check is Not Applicable.

Interview the System Administrator to review the configuration of the Apache web server architecture and determine if inbound web traffic is passed through a proxy.

If the Apache web server is receiving inbound web traffic through a proxy, the audit logs must be reviewed to determine if correct source information is being passed through by the proxy server.

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Review the location of the log files.

When the log file is displayed, review the source IP information in the log entries and verify the entries do not reflect the IP address of the proxy server.
If the log entries in the log file(s) reflect the IP address of the client in addition to the proxy address, this is not a finding.
If the log entries in the log file(s) reflect the IP address of the proxy server as the source, this is a finding.

If logs containing source/destination IPs can be obtained at the load balancer/proxy server, this is not a finding.

```
---
V-214235:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Review the log file location.

    To determine permissions for log files, from the command line, navigate to
the directory where the log files are located and enter the following command:

    ls -alH <HTTPD_ROOT>/log*

    Note the owner and group permissions on these files. Only system
administrators and service accounts running the server should have permissions
to the files.

    If any users other than those authorized have read access to the log files,
this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

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

If any users other than those authorized have read access to the log files, this is a finding.

```
---
V-214240:
Old: 
```
Verify the document root directory and the configuration files do not
provide for default index.html or welcome page.

    Verify the Apache User Manual content is not installed by checking the
configuration files for manual location directives.

    Verify the Apache configuration files do not have the Server Status handler
configured.

    Verify the Server Information handler is not configured.

    Verify that any other handler configurations such as perl-status are not
enabled.

    If any of these are present, this is a finding.

```

Updated:
```
If the site requires the use of a particular piece of software, verify that the Information System Security Officer (ISSO) maintains documentation identifying this software as necessary for operations. The software must be operated at the vendor’s current patch level and must be a supported vendor release.

If programs or utilities that meet the above criteria are installed on the web server and appropriate documentation and signatures are in evidence, this is not a finding.

Determine whether the web server is configured with unnecessary software.

Determine whether processes other than those that support the web server are loaded and/or run on the web server.

Examples of software that should not be on the web server are all web development tools, office suites (unless the web server is a private web development server), compilers, and other utilities that are not part of the web server suite or the basic operating system.

Check the directory structure of the server and verify that additional, unintended, or unneeded applications are not loaded on the system.

If, after review of the application on the system, there is no justification for the identified software, this is a finding.

```
---
V-214241:
Old: 
```
If the server is a proxy server and not a web server, this check is Not
Applicable.

    In a command line, run "httpd -M | sort" to view a list of installed
modules.

    If any of the following modules are present, this is a finding:

    proxy_module
    proxy_ajp_module
    proxy_balancer_module
    proxy_ftp_module
    proxy_http_module
    proxy_connect_module
    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:
    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the directive "ProxyRequest" in the "httpd.conf" file.
    If the ProxyRequest directive is set to “On”, this is a finding.

```

Updated:
```
If the server is a proxy server and not a web server, this check is Not Applicable.

In a command line, run "httpd -M | sort" to view a list of installed modules.

If any of the following modules are present, this is a finding:

proxy_module
proxy_ajp_module
proxy_balancer_module
proxy_ftp_module
proxy_http_module
proxy_connect_module

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Search for the directive "ProxyRequest" in the "httpd.conf" file. 
If the ProxyRequest directive is set to “On”, this is a finding.

```
---
V-214242:
Old: 
```
If the site requires the use of a particular piece of software, verify that
the Information System Security Officer (ISSO) maintains documentation
identifying this software as necessary for operations. The software must be
operated at the vendor’s current patch level and must be a supported vendor
release.

    If programs or utilities that meet the above criteria are installed on the
web server and appropriate documentation and signatures are in evidence, this
is not a finding.

    Determine whether the web server is configured with unnecessary software.

    Determine whether processes other than those that support the web server
are loaded and/or run on the web server.

    Examples of software that should not be on the web server are all web
development tools, office suites (unless the web server is a private web
development server), compilers, and other utilities that are not part of the
web server suite or the basic operating system.

    Check the directory structure of the server and verify that additional,
unintended, or unneeded applications are not loaded on the system.

    If, after review of the application on the system, there is no
justification for the identified software, this is a finding.

```

Updated:
```
Verify the document root directory and the configuration files do not provide for default index.html or welcome page.

Verify the Apache User Manual content is not installed by checking the configuration files for manual location directives.

Verify the Apache configuration files do not have the Server Status handler configured.

Verify the Server Information handler is not configured.

Verify that any other handler configurations such as perl-status are not enabled.

If any of these are present, this is a finding.

```
---
V-214243:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Review any "Action" or "AddHandler" directives:

    # cat /<path_to_file>/httpd.conf | grep -i "Action"
    # cat /<path_to_file>/httpd.conf | grep -i "AddHandler"

    If "Action" or "AddHandler" exist and they configure .exe, .dll, .com,
.bat, or .csh, or any other shell as a viewer for documents, this is a finding.

    If this is not documented and approved by the Information System Security
Officer (ISSO), this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.

Review any "Action" or "AddHandler" directives:

# cat /<path_to_file>/httpd.conf | grep -i "Action"
# cat /<path_to_file>/httpd.conf | grep -i "AddHandler"

If "Action" or "AddHandler" exist and they configure .exe, .dll, .com, .bat, or .csh, or any other shell as a viewer for documents, this is a finding.

If this is not documented and approved by the Information System Security Officer (ISSO), this is a finding.

```
---
V-214244:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Locate "cgi-bin" files and directories enabled in the Apache
configuration via "Script", "ScriptAlias" or "ScriptAliasMatch", and
"ScriptInterpreterSource" directives:

    # cat /<path_to_file>/httpd.conf | grep -i "Script"

    If any scripts are present that are not needed for application operation,
this is a finding.

    If this is not documented and approved by the Information System Security
Officer (ISSO), this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.  

Locate "cgi-bin" files and directories enabled in the Apache configuration via "Script", "ScriptAlias" or "ScriptAliasMatch", and "ScriptInterpreterSource" directives:

# cat /<path_to_file>/httpd.conf | grep -i "Script"

If any scripts are present that are not needed for application operation, this is a finding.

If this is not documented and approved by the Information System Security Officer (ISSO), this is a finding.

```
---
V-214246:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the "Listen" directive:

    # cat /<path_to_file>/httpd.conf | grep -i "Listen"

    Verify that any enabled "Listen" directives specify both an IP address
and port number.

    If the "Listen" directive is found with only an IP address or only a port
number specified, this is finding.

    If the IP address is all zeros (i.e., 0.0.0.0:80 or [::ffff:0.0.0.0]:80),
this is a finding.

    If the "Listen" directive does not exist, this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 
Search for the "Listen" directive:

# cat /<path_to_file>/httpd.conf | grep -i "Listen"

Verify that any enabled "Listen" directives specify both an IP address and port number.

If the "Listen" directive is found with only an IP address or only a port number specified, this is finding.

If the IP address is all zeros (i.e., 0.0.0.0:80 or [::ffff:0.0.0.0]:80), this is a finding.

If the "Listen" directive does not exist, this is a finding.

```
---
V-214250:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the following directive:

    "SessionMaxAge"

    # cat /<path_to_file>/httpd.conf | grep -i "SessionMaxAge"

    Verify the value of "SessionMaxAge" is set to "600" or less.

    If the "SessionMaxAge" does not exist or is set to more than "600",
this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Search for the following directive:

"SessionMaxAge"

# cat /<path_to_file>/httpd.conf | grep -i "SessionMaxAge"

Verify the value of "SessionMaxAge" is set to "600" or less.

If the "SessionMaxAge" does not exist or is set to more than "600", this is a finding.

```
---
V-214251:
Old: 
```
Review the web server documentation and configuration to determine if
cookies between the web server and client are accessible by applications or web
servers other than the originating pair.

    grep SessionCookieName <'INSTALL LOCATION'>/mod_session.conf

    Confirm that the "HttpOnly" and "Secure" settings are present in the
line returned.

    Confirm that the line does not contain the "Domain" cookie setting.

    Verify the "headers_module (shared)" module is loaded in the web server:

    "# httpd -M
    Verify " headers_module (shared)" is returned in the list of Loaded
Modules from the above command."

    If the "headers_module (shared)" is not loaded, this is a finding.

```

Updated:
```
Note: For web servers acting as a public facing with static content that do not require authentication, this is Not Applicable.

Review the web server documentation and configuration to determine if cookies between the web server and client are accessible by applications or web servers other than the originating pair.

grep SessionCookieName <'INSTALL LOCATION'>/mod_session.conf

Confirm that the "HttpOnly" and "Secure" settings are present in the line returned.

Confirm that the line does not contain the "Domain" cookie setting.

Verify the "headers_module (shared)" module is loaded in the web server:

"# httpd -M 
Verify " headers_module (shared)" is returned in the list of Loaded Modules from the above command."

If the "headers_module (shared)" is not loaded, this is a finding.

```
---
V-214252:
Old: 
```
Review the web server documentation and deployed configuration to determine
the length of the generated session identifiers.

    First ensure that "session_crypto" is enabled:

    httpd -M |grep session_crypto

    If the above command returns "session_crypto_module", the module is
enabled in the running server.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Review the "httpd.conf" file.

    If the "SessionCryptoCipher" is not used or "SessionCryptoCipher" is
not set to "aes256", this is a finding.

```

Updated:
```
Review the web server documentation and deployed configuration to determine the length of the generated session identifiers.

First ensure that "session_crypto" is enabled:

httpd -M |grep session_crypto

If the above command returns "session_crypto_module", the module is enabled in the running server.

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Review the "httpd.conf" file.

If the "SessionCryptoCipher" is not used or "SessionCryptoCipher" is not set to "aes256", this is a finding.

```
---
V-214253:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Verify the "unique_id_module" is loaded:

    run httpd -M | grep unique_id
    If no unique_id is returned, open finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Verify the "unique_id_module" is loaded:

run httpd -M | grep unique_id 
If no unique_id is returned, this is a finding.

```
---
V-214255:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Verify that the "Timeout" directive is specified to have a value of
"10" seconds or less.

    # cat /<path_to_file>/httpd.conf | grep -i "Timeout"

    If the "Timeout" directive is not configured or is set for more than
"10" seconds, this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Verify that the "Timeout" directive is specified to have a value of "10" seconds or less.

# cat /<path_to_file>/httpd.conf | grep -i "Timeout"

If the "Timeout" directive is not configured or is set for more than "10" seconds, this is a finding.

```
---
V-214256:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    If the "ErrorDocument" directive is not being used for custom error pages
for "4xx" or "5xx" HTTP status codes, this is a finding.

    # cat /<path_to_file>/httpd.conf | grep -i "ErrorDocument"

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

If the "ErrorDocument" directive is not being used for custom error pages for "4xx" or "5xx" HTTP status codes, this is a finding.

# cat /<path_to_file>/httpd.conf | grep -i "ErrorDocument"

```
---
V-214257:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    For any enabled "TraceEnable" directives, verify they are part of the
server-level configuration (i.e., not nested in a "Directory" or "Location"
directive).

    Verify that the "TraceEnable" directive is set to "Off":

    # cat /<path_to_file>/httpd.conf | grep -i "TraceEnable"

    If the "TraceEnable" directive is not part of the server-level
configuration and/or is not set to "Off", this is a finding.

    If the directive does not exist in the "conf" file, this is a finding
because the default value is "On".

    If the "LogLevel" directive is not being used, this is a finding:

    # cat /<path_to_file>/httpd.conf | grep -i "LogLevel"

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

For any enabled "TraceEnable" directives, verify they are part of the server-level configuration (i.e., not nested in a "Directory" or "Location" directive). 

Verify that the "TraceEnable" directive is set to "Off":

# cat /<path_to_file>/httpd.conf | grep -i "TraceEnable"

If the "TraceEnable" directive is not part of the server-level configuration and/or is not set to "Off", this is a finding.

If the directive does not exist in the "conf" file, this is a finding because the default value is "On".

If the "LogLevel" directive is not being used, this is a finding: 

# cat /<path_to_file>/httpd.conf | grep -i "LogLevel"

```
---
V-214258:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Verify the "reqtimeout_module" is loaded:

    # cat /<path_to_file>/httpd.conf | grep -i "reqtimeout_module"

    If the "reqtimeout_module" is not loaded, this is a finding.

    Verify the "RequestReadTimeout" directive is configured.

    If the "reqtimeout_module" is loaded and the "RequestReadTimeout"
directive is not configured, this is a finding.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Verify the "reqtimeout_module" is loaded:

Change to the root directory of Apache and run the following command to verify the "reqtimeout_module" is loaded:

# httpd -M | grep reqtimeout_module
Outout: reqtimeout_module (shared)

If the "reqtimeout_module" is not loaded, this is a finding.

Verify the "RequestReadTimeout" directive is configured. 
Example: RequestReadTimeout handshake=5 header=10 body=30
Allows for 5 seconds to complete the TLS handshake, 10 seconds to receive the request headers, and 30 seconds for receiving the request body.
The values will depend upon the website. 
The intent of this requirement is to ensure the RequestReadTimeout is explicitly configured.
If the "reqtimeout_module" is loaded and the "RequestReadTimeout" directive is not configured, this is a finding.

```
---
V-214259:
Old: 
```
If external controls such as host-based firewalls are used to restrict this
access, this check is Not Applicable.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the "RequireAll" directive:

    # cat /<path_to_file>/httpd.conf | grep -i "RequireAll"

    If "RequireAll" is not configured or IP ranges configured to allow are
not restrictive enough to prevent connections from nonsecure zones, this is a
finding.

```

Updated:
```
If external controls such as host-based firewalls are used to restrict this access, this check is Not Applicable.

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used. 

Search for the "RequireAll" directive:

# cat /<path_to_file>/httpd.conf | grep -i "RequireAll"

If "RequireAll" is not configured, or IP ranges configured to allow are not restrictive enough to prevent connections from nonsecure zones, this is a finding.

```
---
V-214260:
Old: 
```
Interview the SA and Web Manager.

    Ask for documentation for the Apache web server administration.

    Verify there are documented procedures for shutting down an Apache website
in the event of an attack. The procedure should, at a minimum, provide the
following steps:

    Determine the respective website for the application at risk of an attack.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    In a command line, enter the following command:

    "kill -TERM `cat <'INSTALLED PATH'>/logs/httpd.pid`"

    If the web server is not capable of or cannot be configured to disconnect
or disable remote access to the hosted applications when necessary, this is a
finding.

```

Updated:
```
Interview the SA and Web Manager.

Ask for documentation for the Apache web server administration.

Verify there are documented procedures for shutting down an Apache website in the event of an attack. 

The procedure must, at a minimum, provide the following steps:

1. Determine the respective website for the application at risk of an attack.

2. Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file|pidlog'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"
-D DEFAULT_PIDLOG=”/run/httpd/httpd.pid”
 
3. Search for the PidFile runtime directive. (This example uses the combined results of HTTPD_ROOT and SERVER_CONFIG_FILE, above.) 

# grep -i pidfile /etc/httpd/conf/httpd.conf  

4. If this command returns a result, use this value in the kill command, otherwise, use the DEFAULT_PIDLOG value, above.

# kill -TERM `cat <FULLY-QUALIFIED_PIDFILE_FILENAME>`
Note: These should be documented steps, validators should not run kill commands while reviewing production systems.

If the web server is not capable of or cannot be configured to disconnect or disable remote access to the hosted applications when necessary, this is a finding.

```
---
V-214265:
Old: 
```
Review the web server documentation and configuration to determine the time
stamp format for log data.

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the "log_config_module" directive:

    # cat /<path_to_file>/httpd.conf | grep -i "LogFormat"

    Verify the "LogFormat" directive exists.

    If the "LogFormat" directive does not exist, this is a finding.

    Verify the "LogFormat" line contains the "%t" flag.

    If "%t" flag is not present, time is not mapped to UTC or GMT time, this
is a finding.

```

Updated:
```
Review the web server documentation and configuration to determine the time stamp format for log data.

Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.  

Search for the "log_config_module" directive:

# cat /<path_to_file>/httpd.conf | grep -i "LogFormat"

Verify the "LogFormat" directive exists.

If the "LogFormat" directive does not exist, this is a finding.

Verify the "LogFormat" line contains the "%t" flag.
 
If "%t" flag is not present, time is not mapped to UTC or GMT time, this is a finding.

```
---
V-214267:
Old: 
```
Review the web server documentation and deployed configuration to determine
where the process ID is stored and which utilities are used to start/stop the
web server.

    Determine where the "httpd.pid" file is located by running the following
command:

    find / -name "httpd.pid"
     
    This file is automatically generated upon service start. Verify the file
owner/group is of an administrative  service account:
     
    ls -lah <'httpd.pid location'>/httpd.pid
     
    If the file owner/group is not an administrative service account, this is a
finding.
     
    Verify the service utilities used to manage the Apache service owner/group
is of an administrative service account.
     
    ls -lah /usr/sbin/service
    ls -lah /usr/sbin/apachectl
     
    If the service utilities owner/group is not an administrative service
account, this is a finding.
     
    Determine whether the process ID and the utilities are protected from
non-privileged users.
     
    If the process ID and the utilities are not protected from non-privileged
users, this is a finding.

```

Updated:
```
Review the web server documentation and deployed configuration to determine where the process ID is stored and which utilities are used to start/stop the web server.

Locate the httpd.pid file and list its permission set and owner/group

# find / -name “httpd.pid
Output should be similar to: /run/httpd/httpd.pid 

# ls -laH /run/httpd/httpd.pid
Output should be similar -rw-r--r--. 1 root root 5 Jun 13 03:18 /run/httpd/httpd.pid

If the file owner/group is not an administrative service account, this is a finding.

If permission set is not 644 or more restrictive, this is a finding.
 
Verify the Apache service utilities (binaries) have the correct permission set and are user/group owned by an administrator account

# ls -laH /usr/sbin/service
Output should be similar: -rwxr-xr-x. 1 root root 3.2K Aug 19, 2019 /usr/sbin/service

# ls -laH /usr/sbin/apachectl
Output should be similar: -rwxr-xr-x. 1 root root 4.2K Oct 8, 2019 /usr/sbin/apachectl
 
If the service utilities owner/group is not an administrative service account, this is a finding.
 
If permission set is not 755 or more restrictive, this is a finding.

```
---
V-214268:
Old: 
```
In a command line, run "httpd -M | grep -i session_cookie_module".

    Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the directive "Session" in the "httpd.conf" file:

    # cat /<path_to_file>/httpd.conf | grep -i "Session"

    If the "Session" and "SessionCookieName" directives are not present,
this is a finding.

    If "Session" is not set to "on" and "SessionCookieName" does not
contain "httpOnly" and "secure", this is a finding.

```

Updated:
```
Verify the session cookie module is loaded

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

If "Session" is not set to "on" and "SessionCookieName" does not contain "httpOnly" and "secure", this is a finding.

```
---
V-214269:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Search for the "SSLCACertificateFile" directive:

    # cat /<path_to_file>/httpd.conf | grep -i "SSLCACertificateFile"

    Review the path of the "SSLCACertificateFile" directive.

    Review the contents of <'path of cert'>\ca-bundle.crt.

    Examine the contents of this file to determine if the trusted CAs are DoD
approved.

    If the trusted CA that is used to authenticate users to the website does
not lead to an approved DoD CA, this is a finding.

    NOTE: There are non-DoD roots that must be on the server for it to
function. Some applications, such as antivirus programs, require root CAs to
function. DoD-approved certificate can include the External Certificate
Authorities (ECA) if approved by the AO. The PKE InstallRoot 3.06 System
Administrator Guide (SAG), dated 08 Jul 2008, contains a complete list of DoD,
ECA, and IECA CAs.

```

Updated:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" and "ssl.conf" files:

Search the httpd.conf and ssl.conf file for the following uncommented directive: SSLCipherSuite

# cat httpd.conf  | grep -i SSLCipherSuite
Output: None

# cat /etc/httpd/conf.d/ssl.conf | grep -i SSLCipherSuite
Output: SSLCipherSuite HIGH:3DES:!NULL:!MD5:!SEED:!IDEA:!EXPORT

For all enabled SSLCipherSuite directives, ensure the cipher specification string contains the kill cipher from list option for all export cipher suites, i.e., !EXPORT, which may be abbreviated !EXP as in the following example:

Example: SSLCipherSuite="HIGH:MEDIUM:!MD5!EXP:!NULL:!LOW:!ADH

If the SSLCipherSuite directive does not contain !EXPORT or !EXP or there are no enabled SSLCipherSuite directives, this is a finding.

```
---
V-214270:
Old: 
```
Determine the most recent patch level of the Apache Web Server 2.4
software, as posted on the Apache HTTP Server Project website.

    In a command line, type "httpd -v".

    If the version is more than one version behind the most recent patch level,
this is a finding.

```

Updated:
```
Determine the most recent patch level of the Apache Web Server 2.4 software, as posted on the Apache HTTP Server Project website. If the Apache installation is a proprietary installation supporting an application and is supported by a vendor, determine the most recent patch level of the vendor’s installation.

In a command line, type "httpd -v".

If the version is more than one version behind the most recent patch level, this is a finding.

```
---
</details>

#### Fixes:
<details open>
  <summary>Click to expand.</summary>
V-214228:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Set the "KeepAlive" directive to a value of "on"; add the directive if
it does not exist.

    Set the "MaxKeepAliveRequests" directive to a value of "100" or
greater; add the directive if it does not exist.

    Restart Apache: apachectl restart

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Note: The apachectl front end is the preferred method for locating the Apache httpd file. For some Linux distributions, "apache2ctl -V" or  "httpd -V" can also be used.  

Set the "KeepAlive" directive to a value of "on"; add the directive if it does not exist.

Set the "MaxKeepAliveRequests" directive to a value of "100" or greater; add the directive if it does not exist.

Restart Apache: apachectl restart

```
---
V-214230:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Ensure the "SSLProtocol" is added and looks like the following:

    SSLProtocol -ALL +TLSv1.2

    Restart Apache: apachectl restart

```
New:
```
# cat /etc/httpd/conf.d/ssl.conf | grep "SSLProtocol - ALL +TLSv1.2"

Ensure the "SSLProtocol" is added to the ssl.conf file and looks like the following:

SSLProtocol -ALL +TLSv1.2

Restart Apache: apachectl restart

```
---
V-214232:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Uncomment the "log_config_module" module line.

    Configure the "LogFormat" in the "httpd.conf" file to look like the
following:

    LogFormat "%a %A %h %H %l %m %s %t %u %U \"%{Referer}i\" " common

    Restart Apache: apachectl restart

    NOTE: Your log format may be using different variables based on your
environment, however  it should be verified to be producing the same end result
of logged elements.

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Uncomment the "log_config_module" module line.

Configure the "LogFormat" in the "httpd.conf" file to look like the following:

LogFormat "%a %A %h %H %l %m %s %t %u %U \"%{Referer}i\" " common

Restart Apache: apachectl restart

Note: The log format could be using different variables based on the environment; however it should be verified to ensure it is producing the same end result of logged elements.  

The logging elements required breakdown as follows:
%a       remote IP address
%A       local IP address
%h       IP address of requesting client
%H      the request protocol
%l        user ID of the requesting client
%m      request method
%s        status
%t        time the request was received
%u       user ID of the remote user
%U       URL path requested

```
---
V-214236:
Old: 
```
Determine the location of the "ErrorLog" directory in the "httpd.conf"
file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Open the "httpd.conf" file.

    Look for the "ErrorLog" directive.

    Ensure the permissions and ownership of all files in the Apache log
directory are correct by executing the following commands as an administrative
service account:

    # chown <'service account'> <'ErrorLog directive PATH'>/*

```
New:
```
Determine the location of the "ErrorLog" directory in the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Open the "httpd.conf" file.

Look for the "ErrorLog" directive.

Ensure the permissions and ownership of all files in the Apache log directory are correct by executing the following commands as an administrative service account:
 
# chown <'service account'> <'ErrorLog directive PATH'>/*

```
---
V-214240:
Old: 
```
Review all pre-installed content and remove content that is not required.
In particular, look for the unnecessary content that may be found in the
document root directory, a configuration directory such as conf/extra
directory, or as a UNIX/Linux package.

    Remove the default index.html or welcome page if it is a separate package.
If the default welcome page is part of the main Apache httpd package as it is
on Red Hat Linux, then comment out the configuration as shown below. Removing a
file such as "welcome.conf" is not recommended as it may be replaced if the
package is updated.

    #
    # This configuration file enables the default "Welcome"
    # page if there is no default index page present for
    # the root URL. To disable the Welcome page, comment
    # out all the lines below.
    #
    ##<LocationMatch "^/+$">
    ## Options -Indexes
    ## ErrorDocument 403 /error/noindex.html
    ##</LocationMatch>

    Remove the Apache User Manual content or comment out configurations
referencing the manual.

    Example:

    # yum erase httpd-manual

    Remove or comment out any Server Status handler configuration:

    #
    # Allow server status reports generated by mod_status,
    # with the URL of http://servername/server-status
    # Change the ".example.com" to match your domain to enable.
    #
    ##<Location /server-status>
    ## SetHandler server-status
    ## Order deny,allow
    ## Deny from all
    ## Allow from .example.com
    ##</Location>

    Remove or comment out any Server Information handler configuration:

    #
    # Allow remote server configuration reports, with the URL of
    # http://servername/server-info (requires that mod_info.c be loaded).
    # Change the ".example.com" to match your domain to enable.
    #
    ##<Location /server-info>
    ## SetHandler server-info
    ## Order deny,allow
    ## Deny from all
    ## Allow from .example.com
    ##</Location>

    Remove or comment out any other handler configuration such as perl-status:

    # This will allow remote server configuration reports, with the URL of
    # http://servername/perl-status
    # Change the ".example.com" to match your domain to enable.
    #
    ##<Location /perl-status>
    ## SetHandler perl-script
    ## PerlResponseHandler Apache2::Status
    ## Order deny,allow
    ## Deny from all
    ## Allow from .example.com
    ##</Location>

    The default source build provides extra content available in the
<'INSTALLED PATH'>/conf/extra/ directory, but the configuration of most of the
extra content is commented out by default. In particular, the inclusion of
conf/extra/proxyhtml.conf is not commented out in "httpd.conf":

    # Server-pool management (MPM specific)
    #Include conf/extra/httpd-mpm.conf
    # Multi-language error messages
    #Include conf/extra/httpd-multilang-errordoc.conf
    # Fancy directory listings
    #Include conf/extra/httpd-autoindex.conf
    # Language settings
    #Include conf/extra/httpd-languages.conf
    # User home directories
    #Include conf/extra/httpd-userdir.conf
    # Real-time info on requests and configuration
    #Include conf/extra/httpd-info.conf
    # Virtual hosts
    #Include conf/extra/httpd-vhosts.conf
    # Local access to the Apache HTTP Server Manual
    #Include conf/extra/httpd-manual.conf
    # Distributed authoring and versioning (WebDAV)
    #Include conf/extra/httpd-dav.conf
    # Various default settings
    #Include conf/extra/httpd-default.conf
    # Configure mod_proxy_html to understand HTML4/XHTML1
    <IfModule proxy_html_module>
    Include conf/extra/proxy-html.conf
    </IfModule>
    # Secure (SSL/TLS) connections
    #Include conf/extra/httpd-ssl.conf

    For applications developed in-house, ensure that development artifacts
(sample data and scripts; unused libraries, components, debug code; or tools)
are not included in the deployed software or accessible in the production
environment.

```
New:
```
Remove any unnecessary applications per ISSO documentation.

```
---
V-214242:
Old: 
```
Remove any unnecessary applications per ISSO documentation.

```
New:
```
Review all pre-installed content and remove content that is not required. In particular, look for the unnecessary content that may be found in the document root directory, a configuration directory such as conf/extra directory, or as a UNIX/Linux package.

Remove the default index.html or welcome page if it is a separate package. If the default welcome page is part of the main Apache httpd package as it is on Red Hat Linux, then comment out the configuration as shown below. Removing a file such as "welcome.conf" is not recommended as it may be replaced if the package is updated.

#
# This configuration file enables the default "Welcome"
# page if there is no default index page present for
# the root URL. To disable the Welcome page, comment
# out all the lines below.
#
##<LocationMatch "^/+$">
## Options -Indexes
## ErrorDocument 403 /error/noindex.html
##</LocationMatch>

Remove the Apache User Manual content or comment out configurations referencing the manual.

Example:

# yum erase httpd-manual

Remove or comment out any Server Status handler configuration:

#
# Allow server status reports generated by mod_status,
# with the URL of http://servername/server-status
# Change the ".example.com" to match your domain to enable.
#
##<Location /server-status>
## SetHandler server-status
## Order deny,allow
## Deny from all
## Allow from .example.com
##</Location>

Remove or comment out any Server Information handler configuration:

#
# Allow remote server configuration reports, with the URL of
# http://servername/server-info (requires that mod_info.c be loaded).
# Change the ".example.com" to match your domain to enable.
#
##<Location /server-info>
## SetHandler server-info
## Order deny,allow
## Deny from all
## Allow from .example.com
##</Location>

Remove or comment out any other handler configuration such as perl-status:

# This will allow remote server configuration reports, with the URL of
# http://servername/perl-status
# Change the ".example.com" to match your domain to enable.
#
##<Location /perl-status>
## SetHandler perl-script
## PerlResponseHandler Apache2::Status
## Order deny,allow
## Deny from all
## Allow from .example.com
##</Location>

The default source build provides extra content available in the <'INSTALLED PATH'>/conf/extra/ directory, but the configuration of most of the extra content is commented out by default. In particular, the inclusion of conf/extra/proxyhtml.conf is not commented out in "httpd.conf":

# Server-pool management (MPM specific)
#Include conf/extra/httpd-mpm.conf
# Multi-language error messages
#Include conf/extra/httpd-multilang-errordoc.conf
# Fancy directory listings
#Include conf/extra/httpd-autoindex.conf
# Language settings
#Include conf/extra/httpd-languages.conf
# User home directories
#Include conf/extra/httpd-userdir.conf
# Real-time info on requests and configuration
#Include conf/extra/httpd-info.conf
# Virtual hosts
#Include conf/extra/httpd-vhosts.conf
# Local access to the Apache HTTP Server Manual
#Include conf/extra/httpd-manual.conf
# Distributed authoring and versioning (WebDAV)
#Include conf/extra/httpd-dav.conf
# Various default settings
#Include conf/extra/httpd-default.conf
# Configure mod_proxy_html to understand HTML4/XHTML1
<IfModule proxy_html_module>
Include conf/extra/proxy-html.conf
</IfModule>
# Secure (SSL/TLS) connections
#Include conf/extra/httpd-ssl.conf

For applications developed in-house, ensure that development artifacts (sample data and scripts; unused libraries, components, debug code; or tools) are not included in the deployed software or accessible in the production environment.

```
---
V-214243:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Disable MIME types for .exe, .dll, .com, .bat, and .csh programs.

    If "Action" or "AddHandler" exist within the "httpd.conf" file and
they configure .exe, .dll, .com, .bat, or .csh, remove those references.

    Restart Apache: apachectl restart

    Ensure this process is documented and approved by the ISSO.

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Disable MIME types for .exe, .dll, .com, .bat, and .csh programs.

If "Action" or "AddHandler" exist within the "httpd.conf" file and they configure .exe, .dll, .com, .bat, or .csh, remove those references.

Restart Apache: apachectl restart

Ensure this process is documented and approved by the ISSO.

```
---
V-214244:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Review "Script", "ScriptAlias" or "ScriptAliasMatch", and
"ScriptInterpreterSource" directives.

    Go into each directory and locate "cgi-bin" files. Remove any script that
is not needed for application operation.

    Ensure this process is documented and approved by the ISSO.

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Review "Script", "ScriptAlias" or "ScriptAliasMatch", and "ScriptInterpreterSource" directives.

Go into each directory and locate "cgi-bin" files. Remove any script that is not needed for application operation.

Ensure this process is documented and approved by the ISSO.

```
---
V-214246:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Set the "Listen" directive to listen on a specific IP address and port.

    Restart Apache: apachectl restart

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Set the "Listen" directive to listen on a specific IP address and port.

Restart Apache: apachectl restart

```
---
V-214250:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Add the following line to the "httpd.conf" file:

    SessionMaxAge 600

    Restart Apache: apachectl restart

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Add the following line to the "httpd.conf" file:

SessionMaxAge 600

Restart Apache: apachectl restart

```
---
V-214253:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Load the "unique_id_module".

    Example: LoadModule unique_id_module modules/mod_unique_id.so

    Restart Apache: apachectl restart

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Load the "unique_id_module". 

Example: LoadModule unique_id_module modules/mod_unique_id.so

Restart Apache: apachectl restart

```
---
V-214255:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Add or modify the "Timeout" directive to have a value of "10" seconds
or less:

    "Timeout 10"

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Add or modify the "Timeout" directive to have a value of "10" seconds or less:

"Timeout 10"

```
---
V-214256:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Use the "ErrorDocument" directive to enable custom error pages for 4xx or
5xx HTTP status codes.

    ErrorDocument 500 "Sorry, our script crashed. Oh dear"
    ErrorDocument 500 /cgi-bin/crash-recover
    ErrorDocument 500 http://error.example.com/server_error.html
    ErrorDocument 404 /errors/not_found.html
    ErrorDocument 401 /subscription/how_to_subscribe.html

    The syntax of the ErrorDocument directive is:

    ErrorDocument <3-digit-code> <action>

    Additional information:

    https://httpd.apache.org/docs/2.4/custom-error.html

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Use the "ErrorDocument" directive to enable custom error pages for 4xx or 5xx HTTP status codes.

ErrorDocument 500 "Sorry, our script crashed. Oh dear"
ErrorDocument 500 /cgi-bin/crash-recover
ErrorDocument 500 http://error.example.com/server_error.html
ErrorDocument 404 /errors/not_found.html
ErrorDocument 401 /subscription/how_to_subscribe.html

The syntax of the ErrorDocument directive is:

ErrorDocument <3-digit-code> <action>

Additional information: 

https://httpd.apache.org/docs/2.4/custom-error.html

```
---
V-214257:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Add or set the value of "TraceEnable" to "Off".

    Set the "LogLevel" directive to "info" or below.

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Add or set the value of "TraceEnable" to "Off". 

Set the "LogLevel" directive to "info" or below.

```
---
V-214258:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Load the "reqtimeout_module".

    Set the "RequestReadTimeout" directive.

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"

Load the "reqtimeout_module".

Set the "RequestReadTimeout" directive to specific values applicable to the website.

```
---
V-214260:
Old: 
```
Prepare documented procedures for shutting down an Apache website in the
event of an attack.

    The procedure should, at a minimum, provide the following steps:

    In a command line, enter the following command:

    "kill -TERM `cat <'INSTALLED PATH'>/logs/httpd.pid`"

```
New:
```
Prepare documented procedures for shutting down an Apache website in the event of an attack.

The procedure should, at a minimum, provide the following steps:

Search for the PidFile runtime directive. (This example uses the combined results of HTTPD_ROOT and SERVER_CONFIG_FILE, above.) If this command returns a result, use this value in the kill command, otherwise, use the DEFAULT_PIDLOG value, above.

In a command line, enter the following command:

# grep -i pidfile /etc/httpd/conf/httpd.conf  

# kill -TERM 'cat <FULLY-QUALIFIED_PIDFILE_FILENAME>'

```
---
V-214268:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Set "Session" to "on".

    Ensure the "SessionCookieName" directive includes "httpOnly" and
"secure".

```
New:
```
Determine the location of the "HTTPD_ROOT" directory and the "httpd.conf" file:

# apachectl -V | egrep -i 'httpd_root|server_config_file'
-D HTTPD_ROOT="/etc/httpd"
-D SERVER_CONFIG_FILE="conf/httpd.conf"
 
NOTE: SSL directives may also be located in /etc/httpd/conf.d/ssl.conf.

Set "Session" to "on".

Ensure the "SessionCookieName" directive includes "httpOnly" and "secure".

```
---
V-214269:
Old: 
```
Determine the location of the "HTTPD_ROOT" directory and the
"httpd.conf" file:

    # httpd -V | egrep -i 'httpd_root|server_config_file'
    -D HTTPD_ROOT="/etc/httpd"
    -D SERVER_CONFIG_FILE="conf/httpd.conf"

    Ensure the "SSLProtocol" is added and looks like the following:

    SSLProtocol -ALL +TLSv1.2

    Restart Apache: apachectl restart

```
New:
```
Update the cipher specification string for all enabled SSLCipherSuite directives to include !EXPORT.

```
---
</details>

### Updated Impacts
<details open>
  <summary>Click to expand.</summary>
</details>

### Updated Titles
<details>
  <summary>Click to expand.</summary>
V-214228:
Old: The Apache web server must limit the number of allowed simultaneous
session requests.
New: The Apache web server must limit the number of allowed simultaneous session requests.
---
V-214230:
Old: The Apache web server must use cryptography to protect the integrity
of remote sessions.
New: The Apache web server must use cryptography to protect the integrity of remote sessions.
---
V-214232:
Old: The Apache web server must generate, at a minimum, log records for
system startup and shutdown, system access, and system authentication events.
New: The Apache web server must generate, at a minimum, log records for system startup and shutdown, system access, and system authentication events.
---
V-214233:
Old: An Apache web server, behind a load balancer or proxy server, must
produce log records containing the client IP information as the source and
destination and not the load balancer or proxy IP information with each event.
New: An Apache web server, behind a load balancer or proxy server, must produce log records containing the client IP information as the source and destination and not the load balancer or proxy IP information with each event.
---
V-214234:
Old: The Apache web server must use a logging mechanism that is configured
to alert the Information System Security Officer (ISSO) and System
Administrator (SA) in the event of a processing failure.
New: The Apache web server must use a logging mechanism that is configured to alert the Information System Security Officer (ISSO) and System Administrator (SA) in the event of a processing failure.
---
V-214235:
Old: The Apache web server log files must only be accessible by privileged
users.
New: The Apache web server log files must only be accessible by privileged users.
---
V-214236:
Old: The log information from the Apache web server must be protected from
unauthorized modification or deletion.
New: The log information from the Apache web server must be protected from unauthorized modification or deletion.
---
V-214237:
Old: The log data and records from the Apache web server must be backed up
onto a different system or media.
New: The log data and records from the Apache web server must be backed up onto a different system or media.
---
V-214238:
Old: Expansion modules must be fully reviewed, tested, and signed before
they can exist on a production Apache web server.
New: Expansion modules must be fully reviewed, tested, and signed before they can exist on a production Apache web server.
---
V-214239:
Old: The Apache web server must not perform user management for hosted
applications.
New: The Apache web server must not perform user management for hosted applications.
---
V-214240:
Old: The Apache web server must only contain services and functions
necessary for operation.
New: The Apache web server must only contain services and functions necessary for operation.
---
V-214242:
Old: The Apache web server must provide install options to exclude the
installation of documentation, sample code, example applications, and
tutorials.
New: The Apache web server must provide install options to exclude the installation of documentation, sample code, example applications, and tutorials.
---
V-214243:
Old: The Apache web server must have resource mappings set to disable the
serving of certain file types.
New: The Apache web server must have resource mappings set to disable the serving of certain file types.
---
V-214244:
Old: The Apache web server must allow the mappings to unused and vulnerable
scripts to be removed.
New: The Apache web server must allow the mappings to unused and vulnerable scripts to be removed.
---
V-214245:
Old: The Apache web server must have Web Distributed Authoring (WebDAV)
disabled.
New: The Apache web server must have Web Distributed Authoring (WebDAV) disabled.
---
V-214246:
Old: The Apache web server must be configured to use a specified IP address
and port.
New: The Apache web server must be configured to use a specified IP address and port.
---
V-214247:
Old: Apache web server accounts accessing the directory tree, the shell, or
other operating system functions and utilities must only be administrative
accounts.
New: Apache web server accounts accessing the directory tree, the shell, or other operating system functions and utilities must only be administrative accounts.
---
V-214248:
Old: Apache web server application directories,  libraries, and
configuration files must only be accessible to privileged users.
New: Apache web server application directories,  libraries, and configuration files must only be accessible to privileged users.
---
V-214249:
Old: The Apache web server must separate the hosted applications from
hosted Apache web server management functionality.
New: The Apache web server must separate the hosted applications from hosted Apache web server management functionality.
---
V-214250:
Old: The Apache web server must invalidate session identifiers upon hosted
application user logout or other session termination.
New: The Apache web server must invalidate session identifiers upon hosted application user logout or other session termination.
---
V-214251:
Old: Cookies exchanged between the Apache web server and client, such as
session cookies, must have security settings that disallow cookie access
outside the originating Apache web server and hosted application.
New: Cookies exchanged between the Apache web server and client, such as session cookies, must have security settings that disallow cookie access outside the originating Apache web server and hosted application.
---
V-214252:
Old: The Apache web server must generate a session ID long enough that it
cannot be guessed through brute force.
New: The Apache web server must generate a session ID long enough that it cannot be guessed through brute force.
---
V-214253:
Old: The Apache web server must generate a session ID using as much of the
character set as possible to reduce the risk of brute force.
New: The Apache web server must generate a session ID using as much of the character set as possible to reduce the risk of brute force.
---
V-214254:
Old: The Apache web server must be built to fail to a known safe state if
system initialization fails, shutdown fails, or aborts fail.
New: The Apache web server must be built to fail to a known safe state if system initialization fails, shutdown fails, or aborts fail.
---
V-214255:
Old: The Apache web server must be tuned to handle the operational
requirements of the hosted application.
New: The Apache web server must be tuned to handle the operational requirements of the hosted application.
---
V-214256:
Old: Warning and error messages displayed to clients must be modified to
minimize the identity of the Apache web server, patches, loaded modules, and
directory paths.
New: Warning and error messages displayed to clients must be modified to minimize the identity of the Apache web server, patches, loaded modules, and directory paths.
---
V-214257:
Old: Debugging and trace information used to diagnose the Apache web server
must be disabled.
New: Debugging and trace information used to diagnose the Apache web server must be disabled.
---
V-214259:
Old: The Apache web server must restrict inbound connections from nonsecure
zones.
New: The Apache web server must restrict inbound connections from nonsecure zones.
---
V-214260:
Old: The Apache web server must be configured to immediately disconnect or
disable remote access to the hosted applications.
New: The Apache web server must be configured to immediately disconnect or disable remote access to the hosted applications.
---
V-214261:
Old: Non-privileged accounts on the hosting system must only access Apache
web server security-relevant information and functions through a distinct
administrative account.
New: Non-privileged accounts on the hosting system must only access Apache web server security-relevant information and functions through a distinct administrative account.
---
V-214262:
Old: The Apache web server must use a logging mechanism that is configured
to allocate log record storage capacity large enough to accommodate the logging
requirements of the Apache web server.
New: The Apache web server must use a logging mechanism that is configured to allocate log record storage capacity large enough to accommodate the logging requirements of the Apache web server.
---
V-214263:
Old: The Apache web server must not impede the ability to write specified
log record content to an audit log server.
New: The Apache web server must not impede the ability to write specified log record content to an audit log server.
---
V-214264:
Old: The Apache web server must be configured to integrate with an
organizations security infrastructure.
New: The Apache web server must be configured to integrate with an organizations security infrastructure.
---
V-214265:
Old: The Apache web server must generate log records that can be mapped to
Coordinated Universal Time (UTC) or Greenwich Mean Time (GMT) which are stamped
at a minimum granularity of one second.
New: The Apache web server must generate log records that can be mapped to Coordinated Universal Time (UTC) or Greenwich Mean Time (GMT) which are stamped at a minimum granularity of one second.
---
V-214266:
Old: The Apache web server must prohibit or restrict the use of nonsecure
or unnecessary ports, protocols, modules, and&#x2F;or services.
New: The Apache web server must prohibit or restrict the use of nonsecure or unnecessary ports, protocols, modules, and&#x2F;or services.
---
V-214267:
Old: The Apache web server must be protected from being stopped by a
non-privileged user.
New: The Apache web server must be protected from being stopped by a non-privileged user.
---
V-214268:
Old: Cookies exchanged between the Apache web server and the client, such
as session cookies, must have cookie properties set to prohibit client-side
scripts from reading the cookie data.
New: Cookies exchanged between the Apache web server and the client, such as session cookies, must have cookie properties set to prohibit client-side scripts from reading the cookie data.
---
V-214269:
Old: The Apache web server must remove all export ciphers to protect the
confidentiality and integrity of transmitted information.
New: The Apache web server must remove all export ciphers to protect the confidentiality and integrity of transmitted information.
---
V-214270:
Old: The Apache web server must install security-relevant software updates
within the configured time period directed by an authoritative source (e.g.,
IAVM, CTOs, DTMs, and STIGs).
New: The Apache web server must install security-relevant software updates within the configured time period directed by an authoritative source (e.g., IAVM, CTOs, DTMs, and STIGs).
---
V-214271:
Old: The account used to run the Apache web server must not have a valid
login shell and password defined.
New: The account used to run the Apache web server must not have a valid login shell and password defined.
---
V-214272:
Old: The Apache web server must be configured in accordance with the
security configuration settings based on DoD security configuration or
implementation guidance, including STIGs, NSA configuration guides, CTOs, and
DTMs.
New: The Apache web server must be configured in accordance with the security configuration settings based on DoD security configuration or implementation guidance, including STIGs, NSA configuration guides, CTOs, and DTMs.
---
V-214274:
Old: The Apache web server htpasswd files (if present) must reflect proper
ownership and permissions.
New: The Apache web server htpasswd files (if present) must reflect proper ownership and permissions.
---
</details>

### Updated Descriptions
<details>
  <summary>Click to expand.</summary>
V-214228:
Old:
```
Apache web server management includes the ability to control the
number of users and user sessions that utilize an Apache web server. Limiting
the number of allowed users and sessions per user is helpful in limiting risks
related to several types of denial-of-service (DOS) attacks.

    Although there is some latitude concerning the settings, they should follow
DoD-recommended values and be configurable to allow for future DoD direction.
While the DoD will specify recommended values, the values can be adjusted to
accommodate the operational requirements of a given system.

```
New:
```
Apache web server management includes the ability to control the number of users and user sessions that utilize an Apache web server. Limiting the number of allowed users and sessions per user is helpful in limiting risks related to several types of denial-of-service (DOS) attacks.

Although there is some latitude concerning the settings, they should follow DoD-recommended values and be configurable to allow for future DoD direction. While the DoD will specify recommended values, the values can be adjusted to accommodate the operational requirements of a given system.

```
---
V-214229:
Old:
```
Session management is the practice of protecting the bulk of the user
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
would not be compromised.

```
New:
```
Session management is the practice of protecting the bulk of the user authorization and identity information. This data can be stored on the client system or on the server.

When the session information is stored on the client, the session ID, along with the user authorization and identity information, is sent along with each client request and is stored in a cookie, embedded in the uniform resource locator (URL), or placed in a hidden field on the displayed form. Each of these offers advantages and disadvantages. The biggest disadvantage to all three is the possibility of the hijacking of a session along with all of the user's credentials.

When the user authorization and identity information is stored on the server in a protected and encrypted database, the communication between the client and Apache web server will only send the session identifier, and the server can then retrieve user credentials for the session when needed. If, during transmission, the session were to be hijacked, the user's credentials would not be compromised.

```
---
V-214230:
Old:
```
Data exchanged between the user and the Apache web server can range
from static display data to credentials used to log on to the hosted
application. Even when data appears to be static, the non-displayed logic in a
web page may expose business logic or trusted system relationships. The
integrity of all the data being exchanged between the user and the Apache web
server must always be trusted. To protect the integrity and trust, encryption
methods should be used to protect the complete communication session.

```
New:
```
Data exchanged between the user and the Apache web server can range from static display data to credentials used to log on to the hosted application. Even when data appears to be static, the non-displayed logic in a web page may expose business logic or trusted system relationships. The integrity of all the data being exchanged between the user and the Apache web server must always be trusted. To protect the integrity and trust, encryption methods should be used to protect the complete communication session.



```
---
V-214231:
Old:
```
The server error logs are invaluable because they can also be used to
identify potential problems and enable proactive remediation. Log data can
reveal anomalous behavior such as “not found” or “unauthorized” errors that may
be an evidence of attack attempts. Failure to enable error logging can
significantly reduce the ability of Web Administrators to detect or remediate
problems. The CustomLog directive specifies the log file, syslog facility, or
piped logging utility.

```
New:
```
The server error logs are invaluable because they can also be used to identify potential problems and enable proactive remediation. Log data can reveal anomalous behavior such as “not found” or “unauthorized” errors that may be an evidence of attack attempts. Failure to enable error logging can significantly reduce the ability of Web Administrators to detect or remediate problems. The CustomLog directive specifies the log file, syslog facility, or piped logging utility.

```
---
V-214232:
Old:
```
Log records can be generated from various components within the Apache
web server (e.g., httpd, plug-ins to external backends, etc.). From a web
server perspective, certain specific Apache web server functionalities may be
logged as well. The Apache web server must allow the definition of what events
are to be logged. As conditions change, the number and types of events to be
logged may change, and the Apache web server must be able to facilitate these
changes.

    The minimum list of logged events should be those pertaining to system
startup and shutdown, system access, and system authentication events. If these
events are not logged at a minimum, any type of forensic investigation would be
missing pertinent information needed to replay what occurred.

```
New:
```
Log records can be generated from various components within the Apache web server (e.g., httpd, plug-ins to external backends, etc.). From a web server perspective, certain specific Apache web server functionalities may be logged as well. The Apache web server must allow the definition of what events are to be logged. As conditions change, the number and types of events to be logged may change, and the Apache web server must be able to facilitate these changes.

The minimum list of logged events should be those pertaining to system startup and shutdown, system access, and system authentication events. If these events are not logged at a minimum, any type of forensic investigation would be missing pertinent information needed to replay what occurred.




```
---
V-214233:
Old:
```
Apache web server logging capability is critical for accurate forensic
analysis. Without sufficient and accurate information, a correct replay of the
events cannot be determined.

    Ascertaining the correct source of the events (e.g., source IP) is
important during forensic analysis. Correctly determining the source of events
will add information to the overall reconstruction of the logable event. By
determining the source of the event correctly, analysis of the enterprise can
be undertaken to determine if events tied to the source occurred in other areas
within the enterprise.

    A web server behind a load balancer or proxy server, when not configured
correctly, will record the load balancer or proxy server as the source of every
logable event. When looking at the information forensically, this information
is not helpful in the investigation of events. The web server must record with
each event the client source of the event.

```
New:
```
Apache web server logging capability is critical for accurate forensic analysis. Without sufficient and accurate information, a correct replay of the events cannot be determined.

Ascertaining the correct source of the events (e.g., source IP) is important during forensic analysis. Correctly determining the source of events will add information to the overall reconstruction of the loggable event. By determining the source of the event correctly, analysis of the enterprise can be undertaken to determine if events tied to the source occurred in other areas within the enterprise.

A web server behind a load balancer or proxy server, when not configured correctly, will record the load balancer or proxy server as the source of every loggable event. When looking at the information forensically, this information is not helpful in the investigation of events. The web server must record with each event the client source of the event.

```
---
V-214234:
Old:
```
Reviewing log data allows an investigator to recreate the path of an
attacker and to capture forensic data for later use. Log data is also essential
to SAs in their daily administrative duties on the hosted system or within the
hosted applications.

    If the logging system begins to fail, events will not be recorded.
Organizations must define logging failure events, at which time the application
or the logging mechanism the application uses will provide a warning to the
ISSO and SA at a minimum.

```
New:
```
Reviewing log data allows an investigator to recreate the path of an attacker and to capture forensic data for later use. Log data is also essential to SAs in their daily administrative duties on the hosted system or within the hosted applications.

If the logging system begins to fail, events will not be recorded. Organizations must define logging failure events, at which time the application or the logging mechanism the application uses will provide a warning to the ISSO and SA at a minimum.



```
---
V-214235:
Old:
```
Log data is essential in the investigation of events. If log data were
to become compromised, competent forensic analysis and discovery of the true
source of potentially malicious system activity would be difficult, if not
impossible, to achieve. In addition, access to log records provides information
an attacker could potentially use to their advantage since each event record
might contain communication ports, protocols, services, trust relationships,
user names, etc.

    The web server must protect the log data from unauthorized read, write,
copy, etc. This can be done by the web server if the web server is also doing
the logging function. The web server may also use an external log system. In
either case, the logs must be protected from access by non-privileged users.

```
New:
```
Log data is essential in the investigation of events. If log data were to become compromised, competent forensic analysis and discovery of the true source of potentially malicious system activity would be difficult, if not impossible, to achieve. In addition, access to log records provides information an attacker could potentially use to their advantage since each event record might contain communication ports, protocols, services, trust relationships, user names, etc.

The web server must protect the log data from unauthorized read, write, copy, etc. This can be done by the web server if the web server is also doing the logging function. The web server may also use an external log system. In either case, the logs must be protected from access by non-privileged users.

```
---
V-214236:
Old:
```
Log data is essential in the investigation of events. If log data were
to become compromised, competent forensic analysis and discovery of the true
source of potentially malicious system activity would be difficult, if not
impossible, to achieve. In addition, access to log records provides information
an attacker could potentially use to their advantage since each event record
might contain communication ports, protocols, services, trust relationships,
user names, etc.

    The web server must protect the log data from unauthorized read, write,
copy, etc. This can be done by the web server if the web server is also doing
the logging function. The web server may also use an external log system. In
either case, the logs must be protected from access by non-privileged users.

```
New:
```
Log data is essential in the investigation of events. If log data were to become compromised, competent forensic analysis and discovery of the true source of potentially malicious system activity would be difficult, if not impossible, to achieve. In addition, access to log records provides information an attacker could potentially use to their advantage since each event record might contain communication ports, protocols, services, trust relationships, user names, etc.

The web server must protect the log data from unauthorized read, write, copy, etc. This can be done by the web server if the web server is also doing the logging function. The web server may also use an external log system. In either case, the logs must be protected from access by non-privileged users.



```
---
V-214237:
Old:
```
Protection of log data includes ensuring log data is not accidentally
lost or deleted. Backing up log records to an unrelated system or onto separate
media than the system the web server is actually running on helps to ensure
that, in the event of a catastrophic system failure, the log records will be
retained.

```
New:
```
Protection of log data includes ensuring log data is not accidentally lost or deleted. Backing up log records to an unrelated system or onto separate media than the system the web server is actually running on helps to ensure that, in the event of a catastrophic system failure, the log records will be retained.

```
---
V-214238:
Old:
```
In the case of a production web server, areas for content development
and testing will not exist, as this type of content is only permissible on a
development website. The process of developing on a functional production
website entails a degree of trial and error and repeated testing. This process
is often accomplished in an environment where debugging, sequencing, and
formatting of content are the main goals. The opportunity for a malicious user
to obtain files that reveal business logic and logon schemes is high in this
situation. The existence of such immature content on a web server represents a
significant security risk that is totally avoidable.

    The web server must enforce, internally or through an external utility, the
signing of modules before they are implemented into a production environment.
By signing modules, the author guarantees that the module has been reviewed and
tested before production implementation.

```
New:
```
In the case of a production web server, areas for content development and testing will not exist, as this type of content is only permissible on a development website. The process of developing on a functional production website entails a degree of trial and error and repeated testing. This process is often accomplished in an environment where debugging, sequencing, and formatting of content are the main goals. The opportunity for a malicious user to obtain files that reveal business logic and logon schemes is high in this situation. The existence of such immature content on a web server represents a significant security risk that is totally avoidable.

The web server must enforce, internally or through an external utility, the signing of modules before they are implemented into a production environment. By signing modules, the author guarantees that the module has been reviewed and tested before production implementation.

```
---
V-214239:
Old:
```
User management and authentication can be an essential part of any
application hosted by the web server. Along with authenticating users, the user
management function must perform several other tasks such as password
complexity, locking users after a configurable number of failed logons, and
management of temporary and emergency accounts. All of this must be done
enterprise-wide.

    The web server contains a minimal user management function, but the web
server user management function does not offer enterprise-wide user management,
and user management is not the primary function of the web server. User
management for the hosted applications should be done through a facility that
is built for enterprise-wide user management, such as LDAP and Active Directory.

```
New:
```
User management and authentication can be an essential part of any application hosted by the web server. Along with authenticating users, the user management function must perform several other tasks such as password complexity, locking users after a configurable number of failed logons, and management of temporary and emergency accounts. All of this must be done enterprise-wide.

The web server contains a minimal user management function, but the web server user management function does not offer enterprise-wide user management, and user management is not the primary function of the web server. User management for the hosted applications should be done through a facility that is built for enterprise-wide user management, such as LDAP and Active Directory.

```
---
V-214240:
Old:
```
A web server can provide many features, services, and processes. Some
of these may be deemed unnecessary or too unsecure to run on a production DoD
system.

    The web server must provide the capability to disable, uninstall, or
deactivate functionality and services that are deemed to be non-essential to
the web server mission or can adversely impact server performance.

```
New:
```
A web server can provide many features, services, and processes. Some of these may be deemed unnecessary or too unsecure to run on a production DoD system.

The web server must provide the capability to disable, uninstall, or deactivate functionality and services that are deemed to be non-essential to the web server mission or can adversely impact server performance.

```
---
V-214241:
Old:
```
A web server should be primarily a web server or a proxy server but
not both, for the same reasons that other multi-use servers are not
recommended. Scanning for web servers that will also proxy requests into an
otherwise protected network is a very common attack, making the attack
anonymous.

```
New:
```
A web server should be primarily a web server or a proxy server but not both, for the same reasons that other multi-use servers are not recommended. Scanning for web servers that will also proxy requests into an otherwise protected network is a very common attack, making the attack anonymous.

```
---
V-214242:
Old:
```
Apache web server documentation, sample code, example applications,
and tutorials may be an exploitable threat to an Apache web server because this
type of code has not been evaluated and approved. A production Apache web
server must only contain components that are operationally necessary (e.g.,
compiled code, scripts, web content, etc.).

    Any documentation, sample code, example applications, and tutorials must be
removed from a production Apache web server. To ensure that the documentation
and code are not installed or are uninstalled completely, the Apache web server
must offer an option as part of the installation process to exclude these
packages or to uninstall the packages if necessary.

```
New:
```
Apache web server documentation, sample code, example applications, and tutorials may be an exploitable threat to an Apache web server because this type of code has not been evaluated and approved. A production Apache web server must only contain components that are operationally necessary (e.g., compiled code, scripts, web content, etc.).

Any documentation, sample code, example applications, and tutorials must be removed from a production Apache web server. To ensure that the documentation and code are not installed or are uninstalled completely, the Apache web server must offer an option as part of the installation process to exclude these packages or to uninstall the packages if necessary.



```
---
V-214243:
Old:
```
Resource mapping is the process of tying a particular file type to a
process in the web server that can serve that type of file to a requesting
client and to identify which file types are not to be delivered to a client.

    By not specifying which files can and cannot be served to a user, the web
server could deliver to a user web server configuration files, log files,
password files, etc.

    The web server must only allow hosted application file types to be served
to a user, and all other types must be disabled.

```
New:
```
Resource mapping is the process of tying a particular file type to a process in the web server that can serve that type of file to a requesting client and to identify which file types are not to be delivered to a client.

By not specifying which files can and cannot be served to a user, the web server could deliver to a user web server configuration files, log files, password files, etc.

The web server must only allow hosted application file types to be served to a user, and all other types must be disabled.



```
---
V-214244:
Old:
```
Scripts allow server-side processing on behalf of the hosted
application user or as processes needed in the implementation of hosted
applications. Removing scripts not needed for application operation or deemed
vulnerable helps to secure the web server.

    To ensure scripts are not added to the web server and run maliciously,
script mappings that are not needed or used by the web server for hosted
application operation must be removed.

```
New:
```
Scripts allow server-side processing on behalf of the hosted application user or as processes needed in the implementation of hosted applications. Removing scripts not needed for application operation or deemed vulnerable helps to secure the web server.

To ensure scripts are not added to the web server and run maliciously, script mappings that are not needed or used by the web server for hosted application operation must be removed.

```
---
V-214245:
Old:
```
A web server can be installed with functionality that, by its nature,
is not secure. WebDAV is an extension to the HTTP protocol that, when
developed, was meant to allow users to create, change, and move documents on a
server, typically a web server or web share. Allowing this functionality,
development, and deployment is much easier for web authors.

    WebDAV is not widely used and has serious security concerns because it may
allow clients to modify unauthorized files on the web server.

```
New:
```
A web server can be installed with functionality that, by its nature, is not secure. WebDAV is an extension to the HTTP protocol that, when developed, was meant to allow users to create, change, and move documents on a server, typically a web server or web share. Allowing this functionality, development, and deployment is much easier for web authors.

WebDAV is not widely used and has serious security concerns because it may allow clients to modify unauthorized files on the web server.

```
---
V-214246:
Old:
```
The web server must be configured to listen on a specified IP address
and port. Without specifying an IP address and port for the web server to use,
the web server will listen on all IP addresses available to the hosting server.
If the web server has multiple IP addresses, i.e., a management IP address, the
web server will also accept connections on the management IP address.

    Accessing the hosted application through an IP address normally used for
non-application functions opens the possibility of user access to resources,
utilities, files, ports, and protocols that are protected on the desired
application IP address.

```
New:
```
The web server must be configured to listen on a specified IP address and port. Without specifying an IP address and port for the web server to use, the web server will listen on all IP addresses available to the hosting server. If the web server has multiple IP addresses, i.e., a management IP address, the web server will also accept connections on the management IP address.

Accessing the hosted application through an IP address normally used for non-application functions opens the possibility of user access to resources, utilities, files, ports, and protocols that are protected on the desired application IP address.



```
---
V-214247:
Old:
```
As a rule, accounts on a web server are to be kept to a minimum. Only
administrators, web managers, developers, auditors, and web authors require
accounts on the machine hosting the web server. The resources to which these
accounts have access must also be closely monitored and controlled. Only the
system administrator needs access to all the system's capabilities, while the
web administrator and associated staff require access and control of the web
content and web server configuration files.

```
New:
```
As a rule, accounts on a web server are to be kept to a minimum. Only administrators, web managers, developers, auditors, and web authors require accounts on the machine hosting the web server. The resources to which these accounts have access must also be closely monitored and controlled. Only the system administrator needs access to all the system's capabilities, while the web administrator and associated staff require access and control of the web content and web server configuration files.

```
---
V-214248:
Old:
```
To properly monitor the changes to the web server and the hosted
applications, logging must be enabled. Along with logging being enabled, each
record must properly contain the changes made and the names of those who made
the changes.

    Allowing anonymous users the capability to change the web server or the
hosted application will not generate proper log information that can then be
used for forensic reporting in the case of a security issue. Allowing anonymous
users to make changes will also grant change capabilities to anybody without
forcing a user to authenticate before the changes can be made.

```
New:
```
By separating Apache web server security functions from non-privileged users, roles can be developed that can then be used to administer the Apache web server. Forcing users to change from a non-privileged account to a privileged account when operating on the Apache web server or on security-relevant information forces users to only operate as a Web Server Administrator when necessary. Operating in this manner allows for better logging of changes and better forensic information and limits accidental changes to the Apache web server.

To limit changes to the Apache web server and limit exposure to any adverse effects from the changes, files such as the Apache web server application files, libraries, and configuration files must have permissions and ownership set properly to only allow privileged users access.

```
---
V-214249:
Old:
```
The separation of user functionality from web server management can be
accomplished by moving management functions to a separate IP address or port.
To further separate the management functions, separate authentication methods
and certificates should be used.

    By moving the management functionality, the possibility of accidental
discovery of the management functions by non-privileged users during hosted
application use is minimized.

```
New:
```
The separation of user functionality from web server management can be accomplished by moving management functions to a separate IP address or port. To further separate the management functions, separate authentication methods and certificates should be used.

By moving the management functionality, the possibility of accidental discovery of the management functions by non-privileged users during hosted application use is minimized.

```
---
V-214250:
Old:
```
Captured sessions can be reused in "replay" attacks. This
requirement limits the ability of adversaries from capturing and continuing to
employ previously valid session IDs.

    Session IDs are tokens generated by web applications to uniquely identify
an application user's session. Unique session IDs help to reduce predictability
of said identifiers. When a user logs out, or when any other session
termination event occurs, the web server must terminate the user session to
minimize the potential for an attacker to hijack that particular user session.

```
New:
```
Captured sessions can be reused in "replay" attacks. This requirement limits the ability of adversaries from capturing and continuing to employ previously valid session IDs.

Session IDs are tokens generated by web applications to uniquely identify an application user's session. Unique session IDs help to reduce predictability of said identifiers. When a user logs out, or when any other session termination event occurs, the web server must terminate the user session to minimize the potential for an attacker to hijack that particular user session.



```
---
V-214251:
Old:
```
Cookies are used to exchange data between the web server and the
client. Cookies, such as a session cookie, may contain session information and
user credentials used to maintain a persistent connection between the user and
the hosted application since HTTP/HTTPS is a stateless protocol.

    When the cookie parameters are not set properly (i.e., domain and path
parameters), cookies can be shared within hosted applications residing on the
same web server or to applications hosted on different web servers residing on
the same domain.

```
New:
```
Cookies are used to exchange data between the web server and the client. Cookies, such as a session cookie, may contain session information and user credentials used to maintain a persistent connection between the user and the hosted application since HTTP/HTTPS is a stateless protocol.

When the cookie parameters are not set properly (i.e., domain and path parameters), cookies can be shared within hosted applications residing on the same web server or to applications hosted on different web servers residing on the same domain.

```
---
V-214252:
Old:
```
Generating a session identifier (ID) that is not easily guessed
through brute force is essential to deter several types of session attacks. By
knowing the session ID, an attacker can hijack a user session that has already
been user authenticated by the hosted application. The attacker does not need
to guess user identifiers and passwords or have a secure token since the user
session has already been authenticated.

    Generating session IDs that are at least 128 bits (16 bytes) in length will
cause an attacker to take a large amount of time and resources to guess,
reducing the likelihood of an attacker guessing a session ID.

```
New:
```
Generating a session identifier (ID) that is not easily guessed through brute force is essential to deter several types of session attacks. By knowing the session ID, an attacker can hijack a user session that has already been user authenticated by the hosted application. The attacker does not need to guess user identifiers and passwords or have a secure token since the user session has already been authenticated.

Generating session IDs that are at least 128 bits (16 bytes) in length will cause an attacker to take a large amount of time and resources to guess, reducing the likelihood of an attacker guessing a session ID.

```
---
V-214253:
Old:
```
Generating a session identifier (ID) that is not easily guessed
through brute force is essential to deter several types of session attacks. By
knowing the session ID, an attacker can hijack a user session that has already
been user-authenticated by the hosted application. The attacker does not need
to guess user identifiers and passwords or have a secure token since the user
session has already been authenticated.

    By generating session IDs that contain as much of the character set as
possible, i.e., A-Z, a-z, and 0-9, the session ID becomes exponentially harder
to guess.

```
New:
```
Generating a session identifier (ID) that is not easily guessed through brute force is essential to deter several types of session attacks. By knowing the session ID, an attacker can hijack a user session that has already been user-authenticated by the hosted application. The attacker does not need to guess user identifiers and passwords or have a secure token since the user session has already been authenticated.

By generating session IDs that contain as much of the character set as possible, i.e., A-Z, a-z, and 0-9, the session ID becomes exponentially harder to guess.



```
---
V-214254:
Old:
```
Determining a safe state for failure and weighing that against a
potential denial of service for users depends on what type of application the
web server is hosting. For an application presenting publicly available
information that is not critical, a safe state for failure might be to shut
down for any type of failure, but for an application that presents critical and
timely information, a shutdown might not be the best state for all failures.

    Performing a proper risk analysis of the hosted applications and
configuring the web server according to what actions to take for each failure
condition will provide a known fail safe state for the web server.

```
New:
```
Determining a safe state for failure and weighing that against a potential denial of service for users depends on what type of application the web server is hosting. For an application presenting publicly available information that is not critical, a safe state for failure might be to shut down for any type of failure, but for an application that presents critical and timely information, a shutdown might not be the best state for all failures.

Performing a proper risk analysis of the hosted applications and configuring the web server according to what actions to take for each failure condition will provide a known fail safe state for the web server.



```
---
V-214255:
Old:
```
A denial of service (DoS) can occur when the Apache web server is so
overwhelmed that it can no longer respond to additional requests. A web server
not properly tuned may become overwhelmed and cause a DoS condition even with
expected traffic from users. To avoid a DoS, the Apache web server must be
tuned to handle the expected traffic for the hosted applications.

```
New:
```
A denial of service (DoS) can occur when the Apache web server is so overwhelmed that it can no longer respond to additional requests. A web server not properly tuned may become overwhelmed and cause a DoS condition even with expected traffic from users. To avoid a DoS, the Apache web server must be tuned to handle the expected traffic for the hosted applications.



```
---
V-214256:
Old:
```
Information needed by an attacker to begin looking for possible
vulnerabilities in a web server includes any information about the web server,
backend systems being accessed, and plug-ins or modules being used.

    Web servers will often display error messages to client users, displaying
enough information to aid in the debugging of the error. The information given
back in error messages may display the web server type, version, patches
installed, plug-ins and modules installed, type of code being used by the
hosted application, and any backends being used for data storage.

    This information could be used by an attacker to blueprint what type of
attacks might be successful. The information given to users must be minimized
to not aid in the blueprinting of the Apache web server.

```
New:
```
Information needed by an attacker to begin looking for possible vulnerabilities in a web server includes any information about the web server, backend systems being accessed, and plug-ins or modules being used.

Web servers will often display error messages to client users, displaying enough information to aid in the debugging of the error. The information given back in error messages may display the web server type, version, patches installed, plug-ins and modules installed, type of code being used by the hosted application, and any backends being used for data storage.

This information could be used by an attacker to blueprint what type of attacks might be successful. The information given to users must be minimized to not aid in the blueprinting of the Apache web server.

```
---
V-214257:
Old:
```
Information needed by an attacker to begin looking for possible
vulnerabilities in a web server includes any information about the web server
and plug-ins or modules being used.

    When debugging or trace information is enabled in a production web server,
information about the web server, such as web server type, version, patches
installed, plug-ins and modules installed, type of code being used by the
hosted application, and any backends being used for data storage may be
displayed. Since this information may be placed in logs and general messages
during normal operation of the web server, an attacker does not need to cause
an error condition to gain this information.

```
New:
```
Information needed by an attacker to begin looking for possible vulnerabilities in a web server includes any information about the web server and plug-ins or modules being used.

When debugging or trace information is enabled in a production web server, information about the web server, such as web server type, version, patches installed, plug-ins and modules installed, type of code being used by the hosted application, and any backends being used for data storage may be displayed. Since this information may be placed in logs and general messages during normal operation of the web server, an attacker does not need to cause an error condition to gain this information.

```
---
V-214258:
Old:
```
Leaving sessions open indefinitely is a major security risk. An
attacker can easily use an already authenticated session to access the hosted
application as the previously authenticated user. By closing sessions after a
set period of inactivity, the Apache web server can make certain that those
sessions that are not closed through the user logging out of an application are
eventually closed.

    Acceptable values are 5 minutes for high-value applications, 10 minutes for
medium-value applications, and 20 minutes for low-value applications.

```
New:
```
Leaving sessions open indefinitely is a major security risk. An attacker can easily use an already authenticated session to access the hosted application as the previously authenticated user. By closing sessions after a set period of inactivity, the Apache web server can make certain that those sessions that are not closed through the user logging out of an application are eventually closed. mod_reqtimeout is an Apache module designed to shut down connections from clients taking too long to send their request, as seen in many attacks. This module provides a directive that allows Apache to close the connection if it senses that the client is not sending data quickly enough.

Acceptable values are 5 minutes for high-value applications, 10 minutes for medium-value applications, and 20 minutes for low-value applications.

```
---
V-214259:
Old:
```
Remote access to the Apache web server is any access that communicates
through an external, non-organization-controlled network. Remote access can be
used to access hosted applications or to perform management functions.

    A web server can be accessed remotely and must be capable of restricting
access from what the DoD defines as nonsecure zones. Nonsecure zones are
defined as any IP, subnet, or region that is defined as a threat to the
organization. The nonsecure zones must be defined for public web servers
logically located in a DMZ, as well as private web servers with perimeter
protection devices. By restricting access from nonsecure zones, through the
internal web server access list, the Apache web server can stop or slow
denial-of-service (DoS) attacks on the web server.

```
New:
```
Remote access to the Apache web server is any access that communicates through an external, non-organization-controlled network. Remote access can be used to access hosted applications or to perform management functions.

A web server can be accessed remotely and must be capable of restricting access from what the DoD defines as nonsecure zones. Nonsecure zones are defined as any IP, subnet, or region that is defined as a threat to the organization. The nonsecure zones must be defined for public web servers logically located in a DMZ, as well as private web servers with perimeter protection devices. By restricting access from nonsecure zones, through the internal web server access list, the Apache web server can stop or slow denial-of-service (DoS) attacks on the web server.

```
---
V-214260:
Old:
```
During an attack on the Apache web server or any of the hosted
applications, the System Administrator (SA) may need to disconnect or disable
access by users to stop the attack.

    The Apache web server must be configured to disconnect users from a hosted
application without compromising other hosted applications unless deemed
necessary to stop the attack. Methods to disconnect or disable connections are
to stop the application service for a specified hosted application, stop the
Apache web server, or block all connections through the Apache web server
access list.

    The Apache web server capabilities used to disconnect or disable users from
connecting to hosted applications and the Apache web server must be documented
to make certain that, during an attack, the proper action is taken to conserve
connectivity to any other hosted application if possible and to make certain
log data is conserved for later forensic analysis.

```
New:
```
During an attack on the Apache web server or any of the hosted applications, the System Administrator (SA) may need to disconnect or disable access by users to stop the attack.

The Apache web server must be configured to disconnect users from a hosted application without compromising other hosted applications unless deemed necessary to stop the attack. Methods to disconnect or disable connections are to stop the application service for a specified hosted application, stop the Apache web server, or block all connections through the Apache web server access list.

The Apache web server capabilities used to disconnect or disable users from connecting to hosted applications and the Apache web server must be documented to make certain that, during an attack, the proper action is taken to conserve connectivity to any other hosted application if possible and to make certain log data is conserved for later forensic analysis.

```
---
V-214261:
Old:
```
By separating Apache web server security functions from non-privileged
users, roles can be developed that can then be used to administer the Apache
web server. Forcing users to change from a non-privileged account to a
privileged account when operating on the Apache web server or on
security-relevant information forces users to only operate as a Web Server
Administrator when necessary. Operating in this manner allows for better
logging of changes and better forensic information and limits accidental
changes to the Apache web server.

```
New:
```
By separating Apache web server security functions from non-privileged users, roles can be developed that can then be used to administer the Apache web server. Forcing users to change from a non-privileged account to a privileged account when operating on the Apache web server or on security-relevant information forces users to only operate as a Web Server Administrator when necessary. Operating in this manner allows for better logging of changes and better forensic information and limits accidental changes to the Apache web server.

```
---
V-214262:
Old:
```
To make certain that the logging mechanism used by the web server has
sufficient storage capacity in which to write the logs, the logging mechanism
needs to be able to allocate log record storage capacity.

    The task of allocating log record storage capacity is usually performed
during initial installation of the logging mechanism. The System Administrator
will usually coordinate the allocation of physical drive space with the Web
Server Administrator along with the physical location of the partition and
disk. Refer to NIST SP 800-92 for specific requirements on log rotation and
storage dependent on the impact of the web server.

```
New:
```
To make certain that the logging mechanism used by the web server has sufficient storage capacity in which to write the logs, the logging mechanism needs to be able to allocate log record storage capacity.

The task of allocating log record storage capacity is usually performed during initial installation of the logging mechanism. The System Administrator will usually coordinate the allocation of physical drive space with the Web Server Administrator along with the physical location of the partition and disk. Refer to NIST SP 800-92 for specific requirements on log rotation and storage dependent on the impact of the web server.

```
---
V-214263:
Old:
```
Writing events to a centralized management audit system offers many
benefits to the enterprise over having dispersed logs. Centralized management
of audit records and logs provides for efficiency in maintenance and management
of records, enterprise analysis of events, and backup and archiving of event
records enterprise-wide. The web server and related components are required to
be capable of writing logs to centralized audit log servers.

```
New:
```
Writing events to a centralized management audit system offers many benefits to the enterprise over having dispersed logs. Centralized management of audit records and logs provides for efficiency in maintenance and management of records, enterprise analysis of events, and backup and archiving of event records enterprise-wide. The web server and related components are required to be capable of writing logs to centralized audit log servers.

```
---
V-214264:
Old:
```
A web server will typically use logging mechanisms for maintaining a
historical log of activity that occurs within a hosted application. This
information can then be used for diagnostic purposes, forensics purposes, or
other purposes relevant to ensuring the availability and integrity of the
hosted application.

    While it is important to log events identified as being critical and
relevant to security, it is equally important to notify the appropriate
personnel in a timely manner so they are able to respond to events as they
occur.

    Manual review of the web server logs may not occur in a timely manner, and
each event logged is open to interpretation by a reviewer. By integrating the
web server into an overall or organization-wide log review, a larger picture of
events can be viewed, and analysis can be done in a timely and reliable manner.

```
New:
```
A web server will typically use logging mechanisms for maintaining a historical log of activity that occurs within a hosted application. This information can then be used for diagnostic purposes, forensics purposes, or other purposes relevant to ensuring the availability and integrity of the hosted application.

While it is important to log events identified as being critical and relevant to security, it is equally important to notify the appropriate personnel in a timely manner so they are able to respond to events as they occur. 

Manual review of the web server logs may not occur in a timely manner, and each event logged is open to interpretation by a reviewer. By integrating the web server into an overall or organization-wide log review, a larger picture of events can be viewed, and analysis can be done in a timely and reliable manner.

```
---
V-214265:
Old:
```
If time stamps are not consistently applied and there is no common
time reference, it is difficult to perform forensic analysis across multiple
devices and log records.

    Time stamps generated by the Apache web server include date and time. Time
is commonly expressed in UTC, a modern continuation of GMT, or local time with
an offset from UTC.

    Without sufficient granularity of time stamps, it is not possible to
adequately determine the chronological order of records.

    Time stamps generated by the Apache web server include date and time and
must be to a granularity of one second.

```
New:
```
If time stamps are not consistently applied and there is no common time reference, it is difficult to perform forensic analysis across multiple devices and log records.

Time stamps generated by the Apache web server include date and time. Time is commonly expressed in UTC, a modern continuation of GMT, or local time with an offset from UTC.

Without sufficient granularity of time stamps, it is not possible to adequately determine the chronological order of records.

Time stamps generated by the Apache web server include date and time and must be to a granularity of one second.



```
---
V-214266:
Old:
```
Web servers provide numerous processes, features, and functionalities
that use TCP/IP ports. Some of these processes may be deemed unnecessary or too
unsecure to run on a production system.

    The Apache web server must provide the capability to disable or deactivate
network-related services that are deemed to be non-essential to the server
mission, are too unsecure, or are prohibited by the Ports, Protocols, and
Services Management (PPSM) Category Assurance List (CAL) and vulnerability
assessments.

```
New:
```
Web servers provide numerous processes, features, and functionalities that use TCP/IP ports. Some of these processes may be deemed unnecessary or too unsecure to run on a production system.

The Apache web server must provide the capability to disable or deactivate network-related services that are deemed to be non-essential to the server mission, are too unsecure, or are prohibited by the Ports, Protocols, and Services Management (PPSM) Category Assurance List (CAL) and vulnerability assessments.

```
---
V-214267:
Old:
```
An attacker has at least two reasons to stop a web server. The first
is to cause a denial of service (DoS), and the second is to put in place
changes the attacker made to the web server configuration.

    To prohibit an attacker from stopping the Apache web server, the process ID
(pid) of the web server and the utilities used to start/stop it must be
protected from access by non-privileged users. By knowing the "pid" and
having access to the Apache web server utilities, a non-privileged user has a
greater capability of stopping the server, whether intentionally or
unintentionally.

```
New:
```
An attacker has at least two reasons to stop a web server. The first is to cause a denial of service (DoS), and the second is to put in place changes the attacker made to the web server configuration.

To prohibit an attacker from stopping the Apache web server, the process ID (pid) of the web server and the utilities used to start/stop it must be protected from access by non-privileged users. By knowing the "pid" and having access to the Apache web server utilities, a non-privileged user has a greater capability of stopping the server, whether intentionally or unintentionally.

```
---
V-214268:
Old:
```
A cookie can be read by client-side scripts easily if cookie
properties are not set properly. By allowing cookies to be read by the
client-side scripts, information such as session identifiers could be
compromised and used by an attacker who intercepts the cookie. Setting cookie
properties (i.e., HttpOnly property) to disallow client-side scripts from
reading cookies better protects the information inside the cookie.

```
New:
```
A cookie can be read by client-side scripts easily if cookie properties are not set properly. By allowing cookies to be read by the client-side scripts, information such as session identifiers could be compromised and used by an attacker who intercepts the cookie. Setting cookie properties (i.e., HttpOnly property) to disallow client-side scripts from reading cookies better protects the information inside the cookie.



```
---
V-214269:
Old:
```
During the initial setup of a Transport Layer Security (TLS)
connection to the Apache web server, the client sends a list of supported
cipher suites in order of preference. The Apache web server will reply with the
cipher suite it will use for communication from the client list. If an attacker
can intercept the submission of cipher suites to the Apache web server and
place, as the preferred cipher suite, a weak export suite, the encryption used
for the session becomes easy for the attacker to break, often within minutes to
hours.

```
New:
```
During the initial setup of a Transport Layer Security (TLS) connection to the Apache web server, the client sends a list of supported cipher suites in order of preference. The Apache web server will reply with the cipher suite it will use for communication from the client list. If an attacker can intercept the submission of cipher suites to the Apache web server and place, as the preferred cipher suite, a weak export suite, the encryption used for the session becomes easy for the attacker to break, often within minutes to hours.

Configuring the Apache server with only strong ciphersuites, denying or disabling weak ciphersuites, will prevent this vulnerability.

```
---
V-214270:
Old:
```
Security flaws with software applications are discovered daily.
Vendors are constantly updating and patching their products to address newly
discovered security vulnerabilities. Organizations (including any contractor to
the organization) are required to promptly install security-relevant software
updates (e.g., patches, service packs, and hot fixes). Flaws discovered during
security assessments, continuous monitoring, incident response activities, or
information system error handling must also be addressed expeditiously.

    The Apache web server will be configured to check for and install
security-relevant software updates from an authoritative source within an
identified time period from the availability of the update. By default, this
time period will be every 24 hours.

```
New:
```
Security flaws with software applications are discovered daily. Vendors are constantly updating and patching their products to address newly discovered security vulnerabilities. Organizations (including any contractor to the organization) are required to promptly install security-relevant software updates (e.g., patches, service packs, and hot fixes). Flaws discovered during security assessments, continuous monitoring, incident response activities, or information system error handling must also be addressed expeditiously.

The Apache web server will be configured to check for and install security-relevant software updates from an authoritative source within an identified time period from the availability of the update. By default, this time period will be every 24 hours.

```
---
V-214271:
Old:
```
During installation of the Apache web server software, accounts are
created for the Apache web server to operate properly. The accounts installed
can have either no password installed or a default password, which will be
known and documented by the vendor and the user community.

    The first things an attacker will try when presented with a logon screen
are the default user identifiers with default passwords. Installed applications
may also install accounts with no password, making the logon even easier. Once
the Apache web server is installed, the passwords for any created accounts
should be changed and documented. The new passwords must meet the requirements
for all passwords, i.e., uppercase/lowercase characters, numbers, special
characters, time until change, reuse policy, etc.

    Service accounts or system accounts that have no logon capability do not
need to have passwords set or changed.

```
New:
```
During installation of the Apache web server software, accounts are created for the Apache web server to operate properly. The accounts installed can have either no password installed or a default password, which will be known and documented by the vendor and the user community.

The first things an attacker will try when presented with a logon screen are the default user identifiers with default passwords. Installed applications may also install accounts with no password, making the logon even easier. Once the Apache web server is installed, the passwords for any created accounts should be changed and documented. The new passwords must meet the requirements for all passwords, i.e., uppercase/lowercase characters, numbers, special characters, time until change, reuse policy, etc. 

Service accounts or system accounts that have no logon capability do not need to have passwords set or changed.

```
---
V-214272:
Old:
```
Configuring the Apache web server to implement organization-wide
security implementation guides and security checklists guarantees compliance
with federal standards and establishes a common security baseline across the
DoD that reflects the most restrictive security posture consistent with
operational requirements.

    Configuration settings are the set of parameters that can be changed that
affect the security posture and/or functionality of the system.
Security-related parameters are parameters impacting the security state of the
Apache web server, including those required to satisfy other security control
requirements.

```
New:
```
Configuring the Apache web server to implement organization-wide security implementation guides and security checklists guarantees compliance with federal standards and establishes a common security baseline across the DoD that reflects the most restrictive security posture consistent with operational requirements.

Configuration settings are the set of parameters that can be changed that affect the security posture and/or functionality of the system. Security-related parameters are parameters impacting the security state of the Apache web server, including those required to satisfy other security control requirements.

```
---
V-214273:
Old:
```
Many vulnerabilities are associated with older versions of web server
software. As hot fixes and patches are issued, these solutions are included in
the next version of the server software. Maintaining the web server at a
current version makes the efforts of a malicious user to exploit the web
service more difficult.

```
New:
```
Many vulnerabilities are associated with older versions of web server software. As hot fixes and patches are issued, these solutions are included in the next version of the server software. Maintaining the web server at a current version makes the efforts of a malicious user to exploit the web service more difficult.

```
---
V-214274:
Old:
```
In addition to OS restrictions, access rights to files and directories
can be set on a website using the web server software. That is, in addition to
allowing or denying all access rights, a rule can be specified that allows or
denies partial access rights. For example, users can be given read-only access
rights to files to view the information but not change the files.

    This check verifies that the htpasswd file is only accessible by System
Administrators (SAs) or Web Managers, with the account running the web service
having group permissions of read and execute. "htpasswd" is a utility used by
Netscape and Apache to provide for password access to designated websites.

```
New:
```
In addition to OS restrictions, access rights to files and directories can be set on a website using the web server software. That is, in addition to allowing or denying all access rights, a rule can be specified that allows or denies partial access rights. For example, users can be given read-only access rights to files to view the information but not change the files.

This check verifies that the htpasswd file is only accessible by System Administrators (SAs) or Web Managers, with the account running the web service having group permissions of read and execute. "htpasswd" is a utility used by Netscape and Apache to provide for password access to designated websites.

```
---
</details>