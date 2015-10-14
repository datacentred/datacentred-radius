# == Class: radius::module::ldap
#
# Radius Module - LDAP
#
class radius::module::ldap (
  $server,
  $port = undef,
  $basedn,
  $filter,
  $use_ssl = false,
  $start_tls = undef,
  $ssl_cacert = undef,
  $ssl_cert = undef,
  $ssl_key = undef,
  $require_cert = undef,
) inherits radius {

  package { 'radius-ldap':
    ensure  => $radius::package_ensure,
    name    => $radius::ldap_module_package_name,
    require => Package['radius'],
  } ->

  file { "${radius::config}/modules/ldap":
    content => template('radius/module/ldap.erb'),
    notify  => Service['radius'],
  }

}
