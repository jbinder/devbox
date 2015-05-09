class nodejs {
    exec { 'add_node_repo':
        command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js',
	require => Package['npm']
    }

    exec { 'update_node_repo':
        command => '/usr/bin/apt-get update',
        require => Exec['add_node_repo']
    }

    $packages = [ 'nodejs' ]
    package { $packages: 
        ensure => latest,
        require => Exec['update_node_repo'],
    }

    file { '/usr/bin/node':
       ensure => 'link',
       target => '/usr/bin/nodejs',
       require => Package[$packages]
    }

} 
