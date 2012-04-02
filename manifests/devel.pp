class php::devel {
  Class['php::devel'] <- Class['php']
  package{"php-devel":
    name => "php${php::version}-devel":
    ensure => installed,
    require => Package['php'],
  }
}
