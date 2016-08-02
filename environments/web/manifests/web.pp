#include oracle_java
# Update apt repository
exec { "apt-update":
	user => root,
	command => "apt-get update",
	path => "/usr/bin/",
}

class { 'oracle_java':
	version => '8u5',
	type => 'jdk'
}

# Installing xfce4 like a User Interface.
# You can choose other like: xfce4, LXDE, IceWM, Openbox and etc...
#package { ["xubuntu-desktop","firefox"]:
#	ensure => "latest",
#}
