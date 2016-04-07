#
class bitbucket::config inherits bitbucket {

  file { "${install_dir}/bin/setenv.sh":
    ensure => file,
    content => template('bitbucket/setenv.sh.erb'),
    owner => "${bitbucket_user}",
    group => "${bitbucket_group}",
  }

}
