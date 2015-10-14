# == Class: radius::install
#
# Manage the installation of the radius package
#
class radius::install inherits radius {

  # Bugfix: Correct upstart losing track of the forked process on Ubuntu
  if $::operatingsystem == 'Ubuntu' {
    file { '/etc/init/freeradius.conf':
      source => 'puppet:///modules/radius/freeradius.upstart',
      before => Package['radius'],
    }
  }

  package { 'radius':
    ensure => $radius::package_ensure,
    name   => $radius::package_name,
  }

}
