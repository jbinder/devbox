class npm::package {
    package { 'npm':
        ensure => latest,
        require => Exec['apt-get update'],
    }
}

class npm {
    include npm::package
}
