# == Class: bitbucket
# === Authors
#
# Ali Karimkhani <ali@maatiss.co.uk>

class bitbucket (

    $db_server = $bitbucket::params::db_server,
    $db_port = $bitbucket::params::db_port,
    $db_username = $bitbucket::params::db_username,
    $db_password = $bitbucket::params::db_password,
    $java_opts = $bitbucket::params::java_opts,
    $jdk_ver = $bitbucket::params::jdk_ver,
    $jvm_support_recommended_args = $bitbucket::params::jvm_support_recommended_args,
    $jvm_xms = $bitbucket::params::jvm_xms,
    $jvm_permgen = $bitbucket::params::jvm_permgen,
    $admin_username = $bitbucket::params::admin_username,
    $admin_password = $bitbucket::params::admin_password,
    $server_port = $bitbucket::params::server_port,
    $bitbucket_user = $bitbucket::params::bitbucket_user,
    $bitbucket_group = $bitbucket::params::bitbucket_group,
    $install_dir = $bitbucket::params::install_dir,
    $atlassian_dir = $bitbucket::params::atlassian_dir,
    $home_dir = $bitbucket::params::home_dir,
    $service_path = $bitbucket::params::service_path,

) inherits bitbucket::params {
    anchor { 'bitbucket::begin': } ->
    class { '::bitbucket::install': } ->
    class { '::bitbucket::config': } ~>
    class { '::bitbucket::service': } ->
    anchor { 'bitbucket::end': }
}
