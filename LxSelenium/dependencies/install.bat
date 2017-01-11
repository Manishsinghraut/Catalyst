@echo off

mvn install:install-file -Dfile=swagger-client-1.0.6.jar -DgroupId=com.lucernex.restful -DartifactId=swagger-client -Dversion=1.0.6 -Dpackaging=jar
mvn install:install-file -Dfile=totallylazy-1077.jar -DgroupId=com.googlecode.totallylazy -DartifactId=totallylazy -Dversion=1077 -Dpackaging=jar
