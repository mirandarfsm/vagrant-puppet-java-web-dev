# Java
file { "/opt/jdk":
	owner => vagrant,
	mode => 0755, 
	#recurse => true,
	#ensure => 'directory',
	source => "file:///jdk",
}

exec { "set-java-home":
	command => "update-alternatives --install /usr/bin/java java /opt/jdk/bin/java 1000",
	path => "/usr/bin/",
}

exec { "set-javac-home":
	command => "update-alternatives --install /usr/bin/javac javac /opt/jdk/bin/javac 1000",
	path => "/usr/bin/",
}

# Maven
file { "/opt/maven":
	owner => vagrant,
	mode => 0755, 
	source => "file:///maven",
}

exec { "set-maven-home":
	command => "update-alternatives --install /usr/bin/mvn mvn /opt/maven/bin/mvn 1000",
	path => "/usr/bin/",
}

# Tomcat
file { "/opt/tomcat":
	owner => vagrant,
	mode => 0755, 
	source => "file:///tomcat",
}

# Eclipse
file { "/opt/eclipse":
	owner => vagrant,
	mode => 0755, 
	source => "file:///eclipse",
}

file { "/home/vagrant/.local/share/applications/eclipse.desktop":
	owner => vagrant,
	group => vagrant,
	mode => 0755, 
	source => "file:///eclipse.desktop",
}

# Graphical User Interface
# Installing xfce4 like a User Interface.
# You can choose other like: xfce4, LXDE, IceWM, Openbox and etc...
package { "xfce4":
	ensure => "latest",
}