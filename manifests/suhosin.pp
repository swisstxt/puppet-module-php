class php::suhosin {
  case $operatingsystem {
    centos: {
      if $php::centos_use_remi {
        include php::suhosin::package
      }
    }
    default: {
      include php::suhosin::package
    }
  }
}
class php::suhosin::package {
  Class['php::suhosin::package'] <- Class['php']
  package{'php-suhosin':
    name => "php${php::version}-suhosin",
    ensure => installed,
    require => Package['php'],
  }
}
