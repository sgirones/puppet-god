# Define god::config
# 
# All config settings for candiapp class
#
# == Parameters
#
#   [*user*]
#     App directory owner
#   [*config_flag*]
#     config flag for specific gem compile settings
#   [*app_dir*]
#     App directory where Gemfile is located
#   [*home_dir_base_path*]
#     Home directory of the specified user 
#   [*god_path*]
#     God install directory
#
# == Examples
#
#
# == Requires:
#
#   class { god: }
#
define god::config (
  $ensure = 'present',
) {

  Class['god::master::config'] -> God::Config[$name] ~> Class['god::service']

  file { "god_config_${name}":
    ensure  => $ensure,
    path    => "${god::god_conf_d}/${name}.god",
    owner   => $god::god_config_owner,
    group   => $god::god_config_group,
    mode    => $god::god_config_mode,
    content => template("god/${name}.god.erb")
  }

}
