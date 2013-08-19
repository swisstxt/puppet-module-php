class php::base::debian inherits php::base {
  Package['php']{
    name => 'php5',
  }
  package{'libapache2-mod-php5':
    ensure => installed,
    require => Package['php'],
  }
}
