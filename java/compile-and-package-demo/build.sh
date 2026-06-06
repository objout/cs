#!/bin/bash

set -eE

export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$CLASSPATH

JAVAC_CMD=$JAVA_HOME/bin/javac
JAVA_CMD=$JAVA_HOME/bin/java
JAR_CMD=$JAVA_HOME/bin/jar

JAVAC_CLASS=com.sun.tools.javac.Main

SRC_DIR=$PWD/app
CLASS_DIR=$PWD/bin
JAR_ENTRYPOINT=app.Main
JAR_NAME=$PWD/app.jar

# Prepare
mkdir -p $CLASS_DIR

# Compile
# -d <directory>  Specify where to place generated class files
$JAVAC_CMD -d $CLASS_DIR $SRC_DIR/Main.java
#$JAVA_CMD $JAVAC_CLASS -d $CLASS_DIR $SRC_DIR/Main.java

#Usage: jar {ctxui}[vfmn0PMe] [jar-file] [manifest-file] [entry-point] [-C dir] files ...
#Options:
#    -c  create new archive
#    -t  list table of contents for archive
#    -x  extract named (or all) files from archive
#    -u  update existing archive
#    -v  generate verbose output on standard output
#    -f  specify archive file name
#    -m  include manifest information from specified manifest file
#    -n  perform Pack200 normalization after creating a new archive
#    -e  specify application entry point for stand-alone application
#        bundled into an executable jar file
#    -0  store only; use no ZIP compression
#    -P  preserve leading '/' (absolute path) and ".." (parent directory) components from file names
#    -M  do not create a manifest file for the entries
#    -i  generate index information for the specified jar files
#    -C  change to the specified directory and include the following file
#If any file is a directory then it is processed recursively.
#The manifest file name, the archive file name and the entry point name are
#specified in the same order as the 'm', 'f' and 'e' flags.
#
#Example 1: to archive two class files into an archive called classes.jar:
#       jar cvf classes.jar Foo.class Bar.class
#Example 2: use an existing manifest file 'mymanifest' and archive all the
#           files in the foo/ directory into 'classes.jar':
#       jar cvfm classes.jar mymanifest -C foo/ .

# Package
$JAR_CMD cfe $JAR_NAME $JAR_ENTRYPOINT -C $CLASS_DIR .
