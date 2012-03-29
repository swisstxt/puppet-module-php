class php::extensions::common {
  php::package{[
    'cli', 
    'common', 
    'tidy', 
    'gd', 
    'bcmath', 
    'mbstring',
    'mcrypt',
  ]:
      mode => 'direct',
  }
  include php::pear::common
}
