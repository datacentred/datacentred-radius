# == Class: radius::install
#
# Manage the installation of the radius package
#
class radius::install {

  # Bugfix: Correct upstart losing track of the forked process on Ubuntu
  if $::operatingsystem == 'Ubuntu' {

    file { '/etc/init/freeradius.conf':
      source => 'puppet:///modules/radius/freeradius.upstart',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    } ->

    Package[$radius::package_name]

  }

  package { $radius::package_name:
    ensure => $radius::package_ensure,
  }

}
