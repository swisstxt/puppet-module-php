define php::pecl(
  $phpversion = '',
  $ensure = 'installed',
  $mode = 'package',
  $state = 'stable',
  $target_mode = 'absent'
) {
  include gcc
  include php::pear::common
  case $mode {
    package: {
      php::package{$name:
        phpversion => $phpversion,
        ensure => $ensure,
        mode => 'pecl',
      }
    }
    cli: {
      php::install{$name:
        ensure => $ensure,
        mode => 'pecl',
        state => $state,
        target_mode => $target_mode,
        require => Package['gcc'],
      }
      file{"/etc/php.d/$name.ini":
        content => "extension=${name}.so\n",
        notify => Service[$php::webserver],
        owner => root, group => 0, mode => 0644;
      }
    }
    default: { fail("no such mode: $mode for php::pecl") }
  }
}
