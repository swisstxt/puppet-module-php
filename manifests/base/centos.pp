class php::base::centos inherits php::base {
  if $php::centos_use_remi {
    class{'yum::repo::remi':
      priority => 1,
      includepkgs => 'php*',
    }
  }
  if $php::centos_use_testing {
    require yum::repo::dist::testing
  }
  file{'/etc/httpd/conf.d/php.conf':
    source => [
      "puppet://$server/modules/site-php/apache/$operatingsystem/$fqdn/php.conf",
      "puppet://$server/modules/site-php/apache/$operatingsystem/php.conf",
      "puppet://$server/modules/php/apache/$operatingsystem/php.conf",
    ],
    require => [
      Package['php'],
      Package[$php::webserver],
    ],
    notify => Service[$php::webserver],
    owner => root, group => 0, mode => 0644;
  }
}
