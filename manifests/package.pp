define php::package(
  $ensure = 'installed',
  $mode = 'pear'
){
  notice($php::version)
  
  case $operatingsystem {
    centos,redhat,fedora: {
      case $mode {
        'direct': {
          package{"php${php::version}-$name":
            ensure => $ensure,
            require => [
              Class['php'],
              Package['php'],
            ],
            notify => Class[$php::webserver],
          }
        }
        default: {
          package{"php-${mode}-${name}":
            ensure => $ensure,
            require => [
              Class['php'],
              Package['php'],
            ],
            notify => Class[$php::webserver],
          }
        }
      }
    }
  }
}
