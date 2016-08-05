# Update apt repository
exec { "apt-update":
	user => root,
	command => "apt-get update",
	path => "/usr/bin/",
} ->

# Installing Postgresql 
# You can choose other like: mysql, firebird, mariadb and etc...
package { "postgresql":
	ensure => "latest",
}
