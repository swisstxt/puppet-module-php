class php::base {
  package{'php':
    ensure => present,
    notify => Service[$php::webserver],
  }
  include php::suhosin
  include php::extensions::common
}
