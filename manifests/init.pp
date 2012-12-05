# Class god
# 
# Install god process monitring daemon and config
#
# == Parameters
#
#
# == Examples
#
#
# == Requires:
#
#
class god (
  $ensure            = 'present',
  $ensure_service    = 'running',
  $service_provider  = $god::params::service_provider,
  $package_provider  = $god::params::package_provider,
  $god_master_conf   = $god::params::god_master_conf,
  $god_master_erb    = $god::params::god_master_erb,
  $god_conf_path     = $god::params::god_conf_path,
  $god_conf_owner    = $god::params::god_conf_owner,
  $god_conf_group    = $god::params::god_conf_group,
  $god_conf_dir_mode = $god::params::god_conf_dir_mode,
  $god_conf_mode     = $god::params::god_conf_mode,
) inherits god::params {

  Class['god'] -> Class['god::master::config'] ~> Class['god::service']
  include god::master::config
  include god::service

  package { 'god':
    ensure   => $ensure,
    provider => $package_provider,
  }

}