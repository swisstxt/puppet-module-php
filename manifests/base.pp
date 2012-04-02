class php::base {
  Class['php::base'] <- Class['php']
  package{'php':
    name => "php${php::version}",
    ensure => present,
    notify => Service[$php::webserver],
  }
  include php::suhosin
  include php::extensions::common
}
