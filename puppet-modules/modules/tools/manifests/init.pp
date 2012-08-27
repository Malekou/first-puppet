# Class: tools
#
#   This class installs other usefull packages.
#
class tools::install {
  $packages = [ "curl", "wget", "vim", "unzip" ]
  package { $packages:
    ensure => present
  }
}


class tools::aptlimit {
  file {
    "apt_limit":
      path    => "/etc/apt/apt.conf.d/90local",
      ensure  => present,
      source  => "puppet:///modules/tools/apt.limit",
      owner   => 'root',
      group   => 'root';
  }
}

class tools::downgrading {
  file { "karmic_list":
    path    => "/etc/apt/sources.list.d/karmic.list",
    ensure  => present,
    source  => "puppet:///modules/tools/karmic.list",
    owner   => 'root',
    group   => 'root';
  }

  file { "php_list":
    path    => "/etc/apt/preferences.d/php",
    ensure  => present,
    source  => "puppet:///modules/tools/php.list",
    owner   => 'root',
    group   => 'root';
  }
}

class tools::reloadapt {
  exec { "apt-get-update":
    # S'assure que php sera en 5.2
    command => "/usr/bin/apt-get update"
  }
}

class tools {
  include tools::install
  include tools::aptlimit, tools::downgrading
  include tools::reloadapt
}

