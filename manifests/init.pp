# == Class: cp_helper
#
# Full description of class cp_helper here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { cp_helper:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
define cp_helper ( 
  $puppet_install_directory  = "${puppet_install_dir}/puppet",
  $ensure = 'present',
) {
 case $ensure {
    'present','installed':  { $ensure_safe = file   }
    'absent','uninstalled': { $ensure_safe = absent }
    default: {
      fail "Unknown value ${ensure} of 'ensure' parameter for Class[cloud-provisioner].  Accepted values are ['present','absent']"
    }
  }
  file { "${puppet_install_directory}/application/${name}.rb":
    ensure => $ensure_safe,
    source => "puppet:///modules/${name}/${name}.rb",
    mode   => 0644,
  }
}
