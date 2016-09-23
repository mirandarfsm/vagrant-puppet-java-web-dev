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

# Graphical User Interface
# Installing xfce4 like a User Interface.
# You can choose other like: xfce4-goodies, LXDE, IceWM, Openbox and etc...
package { "xfce4-goodies":
	ensure => "latest",
}

# Java
file { "/opt/jdk":
	mode => 0755, 
	recurse => true,
	source => "puppet://modules/java/jdk1.8u36/",
}

exec { "set-java-home":
	command => "update-alternatives --install /usr/bin/java java /opt/jdk/bin/java 1000",
	unless => "java -version",
	path => "/usr/bin/",
}

exec { "set-javac-home":
	command => "update-alternatives --install /usr/bin/javac javac /opt/jdk/bin/javac 1000",
	unless => "javac -version",
	path => "/usr/bin/",
}

# Maven
file { "/opt/maven":
	mode => 0755, 
	recurse => true,
	source => "puppet://modules/maven/apache-maven-3.2/",
}

exec { "set-maven-home":
	command => "update-alternatives --install /usr/bin/mvn mvn /opt/maven/bin/mvn 1000",
	unless => "mvn -version",
	path => "/usr/bin/",
}

# Tomcat
file { "/opt/tomcat":
	owner => vagrant,
	mode => 0755, 
	source => "puppet://modules/tomcat/apache-tomcat-8/",
}

# Eclipse
file { "/opt/eclipse":
	owner => vagrant,
	mode => 0755, 
	source => "puppet://modules/eclipse/eclipse-neon/",
}

file { "/home/vagrant/.local/share/applications/eclipse.desktop":
	owner => vagrant,
	group => vagrant,
	mode => 0755, 
	source => "puppet://modules/eclipse/eclipse.desktop",
}
