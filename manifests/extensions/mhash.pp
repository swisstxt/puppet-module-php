# manifests/extensions/imap.pp

class php::extensions::mhash {
    php::package{'mhash':
        mode => 'direct',
    }
}

