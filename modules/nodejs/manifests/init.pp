class nodejs {

    $packages = [ 'nodejs' ]
    package { $packages: 
        ensure => latest,
    }

    file { '/usr/bin/node':
       ensure => 'link',
       target => '/usr/bin/nodejs',
       require => Package[$packages],
    }

} 
