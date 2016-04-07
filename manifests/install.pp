#
class bitbucket::install inherits bitbucket {

  group { "$bitbucket_group":
    ensure => 'present'
  }

  ah::zone::user::create{"$bitbucket_user":
    require => Group["$bitbucket_group"]
  }

  package { 'jdk':
    ensure  => 'installed'
  }

  package { 'git':
    ensure  => 'installed'
  }

  package { "curl":
    ensure => 'installed'
  }

  package { ['jboss-eap','perl-CPAN.noarch','perl-YAML.noarch','perl-DBD-Oracle']:
    ensure => 'installed',
    require => Package [ 'jdk' ]
  }

  file { "${atlassian_dir}":
    ensure  => directory,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => File['/opt']
  }

  file { "${home_dir}":
    ensure  => directory,
    mode    => '0755',
    owner   => "${bitbucket_user}",
    group   => "${bitbucket_group}",
    require => File["${atlassian_dir}"]
  }

  exec { 'get_unpack':
    cwd     => '/opt',
    path    => '/sbin:/bin:/usr/sbin:/usr/bin',
    user    => "${bitbucket_user}",
    group   => "${bitbucket_group}",
    command => "curl http://gb2inffilp1.resources.corp.internal/SOURCES/atlassian/bitbucket/atlassian-bitbucket-4.4.1.tar.gz | tar zxf -",
    require => [ Package['curl'], User["$bitbucket_user"] ]
  }

}
