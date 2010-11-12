class php::base {
  package{'php':
    ensure => present,
    notify => Service['apache'],
  }
  if ! $php::centos_use_testing {
    include php::apc
  }
  include php::suhosin
  include php::extensions::common
}
