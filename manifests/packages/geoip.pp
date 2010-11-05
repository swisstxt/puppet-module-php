class php::packages::geoip {
  include geoip::devel
  php::pecl{'geoip': 
    mode => 'cli', 
  }
}
