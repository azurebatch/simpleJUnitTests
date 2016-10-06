#!/bin/bash

platform=`python -mplatform`

InstallJDK () {
  case "$platform" in 
    *Ubuntu*)
      sudo apt-get update
      sudo apt-get --assume-yes install default-jdk
      ;; 
     *)  
        echo "Not supported on this OS yet" 
        exit 1 # Command to come out of the program with status 1
        ;; 
  esac
}

InstallMvn () {
  case "$platform" in 
    *Ubuntu*)
      sudo apt-get update
      sudo apt-get --assume-yes install maven
      ;; 
     *)  
        echo "Not supported on this OS yet" 
        exit 1 # Command to come out of the program with status 1
        ;; 
  esac
}

if ! [ -x "$(command -v javac)" ]; then
  echo 'jdk is not installed, installing'
#  InstallJDK
fi

if ! [ -x "$(command -v mvn)" ]; then
  echo 'maven is not installed, installing'
  InstallMvn
fi
