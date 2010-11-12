class php::base::centos inherits php::base {
  if $php::centos_use_remi {
    include yum::repo::remi
    Package['php']{
      require => Yum::Repo['remi'],
    }
  }
  if $php::centos_use_testing {
    include yum::repo::dist::testing
    Package['php']{
      require => Yum::Repo['centos-testing'],
    }
  }
  file{'/etc/httpd/conf.d/php.conf':
    source => [
      "puppet://$server/modules/site-php/apache/$operatingsystem/$fqdn/php.conf",
      "puppet://$server/modules/site-php/apache/$operatingsystem/php.conf",
      "puppet://$server/modules/php/apache/$operatingsystem/php.conf",
    ],
    require => [
      Package['php'],
      Package['apache'],
    ],
    notify => Service['apache'],
    owner => root, group => 0, mode => 0644;
  }
}
