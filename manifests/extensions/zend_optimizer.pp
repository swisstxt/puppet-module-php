class php::extensions::zend_optimizer {
  # well, this depends on a custom made rpm
  package{'ZendOptimizer':
    ensure => installed,
  }
}
