# Alter locale in Debian and Ubuntu
file { "/etc/locale.gen":
	owner => vagrant,
	mode => 0755, 
	source => "puppet:///modules/locale/locale.gen",
}

exec { "locale-generation":
	command => "locale-gen",
	path => ["/usr/sbin/","/usr/bin/","/bin/"],
	require => File["/etc/locale.gen"]
}

file { "/etc/default/locale":
	owner => vagrant,
	mode => 0755, 
	source => "puppet:///modules/locale/locale",
}

file { "/etc/apt/source.list":
	owner => vagrant,
	mode => 0755, 
	source => "puppet:///modules/apt/source.list",
	require => File["/etc/default/locale"]
}

# Update apt repository
exec { "apt-update":
	user => root,
	command => "apt-get update",
	path => "/usr/bin/",
	require => File["/etc/apt/source.list"],
}

# Installing xfce4 like a User Interface.
# You can choose other like: xfce4-goodies, LXDE, IceWM, Openbox and etc...
package { "xubuntu-desktop":
	ensure => "latest",
	require => Exec["apt-update"],
}

# Installing environment for java development
package {["firefox","openjdk-7-jdk","maven","tomcat7","eclipse"]:
	ensure => "latest",
	require => Exec["apt-update"],
}
