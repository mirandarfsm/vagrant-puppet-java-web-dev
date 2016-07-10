# Update apt repository
exec { "apt-update":
	user => root,
	command => "apt-get update",
	path => "/usr/bin/",
}

# Installing xfce4 like a User Interface.
# You can choose other like: LXDE, IceWM, Openbox and etc...
package { "xfce4":
	ensure => "latest",
}
