class gulp {
    exec { "gulp": 
        command =>  "/usr/bin/npm install -g gulp",
        require => Class["npm"]
    }
}
