define php::package(
  $ensure = 'installed',
  $mode = 'pear'
){
  Class['php::package'] <- Class['php']
  notice($php::version)
  package{"php-$name":
    ensure => $ensure,
    require => Package['php'],
    notify => Service[$php::webserver],
  }
  case $operatingsystem {
    centos,redhat,fedora: {
      case $mode {
        'direct': {
          Package["php-$name"]{
            name => "php${php::version}-$name",
          }
        }
        default: {
          Package["php-$name"]{
            name => "php${php::version}-${mode}-${name}",
          }
        }
      }
    }
  }
}
