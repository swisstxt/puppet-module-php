class php::base {
  Class['php::base'] <- Class['php']
  package{'php':
    name => "php${php::version}",
    ensure => present,
    notify => Class[$php::webserver],
  }
  include php::extensions::common
}
