Exec { path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin"] }
# File { owner => 'root', group => 'root' }
group { "puppet": ensure => "present"}
import "settings"

# Ensure that packages are up to date before beginning.
exec { "apt-get update":
  # S'assure que php sera en 5.2
  command => "/usr/bin/apt-get update"
}
Package {
  require => Exec["apt-get update"]
}
File {
  require => Exec["apt-get update"]
}

include tools
include apache
include php
include mysql
include phpmyadmin
#include apc
#include drush
#include git
#include mongodb
