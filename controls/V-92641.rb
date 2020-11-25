# encoding: UTF-8

control 'V-92641' do
  title "The Apache web server must only contain services and functions
necessary for operation."
  desc  "A web server can provide many features, services, and processes. Some
of these may be deemed unnecessary or too unsecure to run on a production DoD
system.

    The web server must provide the capability to disable, uninstall, or
deactivate functionality and services that are deemed to be non-essential to
the web server mission or can adversely impact server performance.
  "
  desc  'rationale', ''
  desc  'check', "
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
  "
  desc  'fix', "
    Review all pre-installed content and remove content that is not required.
In particular, look for the unnecessary content that may be found in the
document root directory, a configuration directory such as conf/extra
directory, or as a UNIX/Linux package.

    Remove the default index.html or welcome page if it is a separate package.
If the default welcome page is part of the main Apache httpd package as it is
on Red Hat Linux, then comment out the configuration as shown below. Removing a
file such as \"welcome.conf\" is not recommended as it may be replaced if the
package is updated.

    #
    # This configuration file enables the default \"Welcome\"
    # page if there is no default index page present for
    # the root URL. To disable the Welcome page, comment
    # out all the lines below.
    #
    ##<LocationMatch \"^/+$\">
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
    # Change the \".example.com\" to match your domain to enable.
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
    # Change the \".example.com\" to match your domain to enable.
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
    # Change the \".example.com\" to match your domain to enable.
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
conf/extra/proxyhtml.conf is not commented out in \"httpd.conf\":

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
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000141-WSR-000075'
  tag gid: 'V-92641'
  tag rid: 'SV-102729r1_rule'
  tag stig_id: 'AS24-U1-000250'
  tag fix_id: 'F-98883r1_fix'
  tag cci: ['CCI-000381']
  tag nist: ['CM-7 a']

  describe "The Apache web server must only contain services and functions necessary for operation" do 
    skip "Verify the document root directory and the configuration files do not provide for default index.html or welcome page."
  end

  describe package('httpd-manual') do 
    it { should_not be_installed }
  end

  config_path = input('config_path')
  apache_config = apache_conf(config_path)

  describe apache_config.params("SetHandler") do
    it { should_not cmp 'server-status' }
    it { should_not cmp 'server-info' }
    it { should_not cmp 'pearl-script' }
  end

end
