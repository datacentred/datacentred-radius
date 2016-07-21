# == Class: radius::config
#
# Manage the configuration of the radius service
#
class radius::config {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }

  file { [$radius::config, "${radius::config}/modules", "${radius::config}/sites-available", "${radius::config}/sites-enabled"]:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
  }

  file { "${radius::config}/radiusd.conf":
    content => template('radius/radiusd.conf.erb'),
  }

  file { "${radius::config}/dictionary":
    source => 'puppet:///modules/radius/dictionary',
  }

  file { "${radius::config}/ldap.attrmap":
    source => 'puppet:///modules/radius/ldap.attrmap',
  }
}
