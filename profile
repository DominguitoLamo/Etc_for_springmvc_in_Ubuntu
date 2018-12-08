# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "${PS1-}" ]; then
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

 #Java Path
export JAVA_HOME=/opt/java/jdk-11.0.1
export JRE_HOME=/opt/java/jdk-11.0.1/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH

 #set maven environment
M2_HOME=/usr/local/maven/apache-maven-3.6.0

export MAVEN_OPTS="-Xms256m -Xmx512m"

export PATH=$M2_HOME/bin:$PATH 

#tomcat
export TOMCAT_HOME=/usr/local/lib/tomcat/apache-tomcat-9.0.13
