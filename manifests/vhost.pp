# == Definition: radius::vhost
#
# Install a radius vhost
#
define radius::vhost (
  $ensure       = 'present',
  $authorize    = [],
  $authenticate = [],
  $post_auth    = [],
) {

  # The base class must be included first because it is used by parameter defaults
  if ! defined(Class['radius']) {
    fail('You must include the radius base class before using any radius defined resources')
  }

  # Validations
  validate_array($authorize)
  validate_array($authenticate)
  validate_array($post_auth)

  # Path to configuration file
  $config_file = "${radius::config}/sites-available/${name}"

  # Create the vhost in sites-available
  concat { $config_file: }

  # vhost header
  concat::fragment{"radius_vhost_${name}_header":
    target  => $config_file,
    content => template('radius/vhost/_header.erb'),
    order   => 01,
  }

  # vhost footer
  concat::fragment{"radius_vhost_${name}_footer":
    target  => $config_file,
    content => "\n}\n",
    order   => 99,
  }

  # Symlink the site if it's enabled
  $vhost_symlink_ensure = $ensure ? {
    present => link,
    default => $ensure,
  }

  file { "${::radius::config}/sites-enabled/${name}":
    ensure => $vhost_symlink_ensure,
    target => "${::radius::config}/sites-available/${name}",
  }

}
