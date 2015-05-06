class apt_get::update {

    exec { "apt-get update" :
        path    => "/usr/bin",
        returns => [0, 100]
    }
}
