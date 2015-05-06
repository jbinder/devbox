class apache2::package {
    package { 'apache2':
        ensure => latest,
        require => Exec['apt-get update'],
    }
}

class apache2::service {
  service { 'apache2':
    ensure => running,
    enable => true,
    require => Class['apache2::package'],
  }
}

class apache2 {
    include apache2::package, apache2::service
}
