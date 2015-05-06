stage { 'first':
    before => Stage['second'],
}

stage { 'second':
    before => Stage['third'],
}

stage { 'third':
    before => Stage['main']
}

class { "apt_get::update":
    stage  => first,
}

class { 'tools':
    stage => second,
}

include apt_get::update
include tools
include git
include vim
include nodejs
include npm
include gulp
include apache2
include sqlite3
include mongodb

/*

class { 'php':
    stage => third,
}

include avahi-daemon
include mysql
include php
include nginx
include supervisor
include sphinx
include redis
include composer
include beanstalkd
include ngrok
*/
