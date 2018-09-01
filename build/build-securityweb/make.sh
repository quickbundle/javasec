#!/bin/bash

function extractJar()
{
  echo extracting $1
  mkdir $1
  cd $1
  jar xf ../$1.jar
  cd ..
  rm -f $1.jar
}

cd target 

echo rename directory...
mv build-securityweb-5.0.1-bin eclipse
cd eclipse
mv build-securityweb-5.0.1 plugins
cd plugins

echo extract plugin jars...
extractJar org.quickbundle.mda.gc-5.0.1
extractJar org.quickbundle.mda.gp-5.0.1
extractJar org.quickbundle.mda.libs-5.0.1
extractJar org.quickbundle.mda.mvm-5.0.1

echo copy quickbundle-securityweb...
cd ../../../../../archetype/quickbundle-securityweb
mvn clean eclipse:clean eclipse:eclipse
#mvn clean
cd ..
echo extract quickbundle-securityweb.jar...
jar cfM ../build/build-securityweb/target/quickbundle-securityweb.jar quickbundle-securityweb
pwd
cd ../build/build-securityweb/target/eclipse/plugins/org.quickbundle.mda.gp-5.0.1/t/j1
jar xfM ../../../../../quickbundle-securityweb.jar
