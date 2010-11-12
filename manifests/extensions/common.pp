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

  if $php::centos_use_remi or $php::centos_use_testing {
    info("php-pecl-json is included in php-common")
  } else {
    php::package{'json':
      mode => 'pecl',
    }
  }
  include php::pear::common
}
