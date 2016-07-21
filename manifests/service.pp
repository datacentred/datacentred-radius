# == Class: radius::service
#
# Manage the radius service
#
class radius::service {
  if $radius::service_manage == true {
    service { 'radius':
      ensure     => $radius::service_ensure,
      enable     => $radius::service_enable,
      name       => $radius::service_name,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
