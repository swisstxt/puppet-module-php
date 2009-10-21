class php::debian inherits php::base {
    Package[php]{
        name => 'php5',
    }
    package{'libapache2-mod-php5':
        ensure => installed,
        required => Package[php],
    }
    php::pear{ [ "auth-pam", "curl", "idn", "imap", "ldap",
                  "ming", "mysql", "odbc", "pgsql", "ps", "pspell", "recode", "snmp",
                  "sqlite", "sqlrelay", "uuid", "xapian", "xmlrpc", "xsl" ]:
        version => 5
  }
  include "php::debian::common"
}
