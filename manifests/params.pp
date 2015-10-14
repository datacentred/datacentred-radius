# == Class: radius::params
#
# Default parameters for different operating systems, etc
#
class radius::params {

  $package_ensure  = 'present'
  $service_enable  = true
  $service_ensure  = 'running'
  $service_manage  = true

  case $::osfamily {
    'Debian': {
      $package_name    = 'freeradius'
      $service_name    = 'freeradius'
      $config          = '/etc/freeradius'

      $ldap_module_package_name = 'freeradius-ldap'
    }
    default: {
      fail("${::module_name} is not supported on ${::operatingsystem}.")
    }
  }

}
