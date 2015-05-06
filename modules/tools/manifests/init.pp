class tools {
    $packages = ['python-software-properties', 'curl', 'imagemagick', 'build-essential', 'software-properties-common']
    
    package { $packages:
        ensure => installed,
    }
}
