# Update apt repository
exec { "apt-update":
	user => root,
	command => "apt-get update",
	path => "/usr/bin/",
} ->

# Installing xfce4 like a User Interface.
# You can choose other like: xfce4, LXDE, IceWM, Openbox and etc...
package { "xubuntu-desktop":
	ensure => "latest",
}

# Installing environment for java development
package {"firefox","openjdk-7-jdk","maven","tomcat7","eclipse"]
	ensure => "latest",
}
