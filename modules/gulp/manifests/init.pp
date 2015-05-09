include npm

class gulp {
    exec { "gulp": 
        command =>  "/usr/bin/npm install -g gulp",
        require => Package["npm"]
    }
}
