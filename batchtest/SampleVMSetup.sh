#!/bin/bash

platform=`python -mplatform`

InstallGit () {
  case "$platform" in 
    *Ubuntu*)
      apt-get update
      apt-get --assume-yes install git
      ;; 
    *centos*)
      yum check-update
      yum install -y git
      ;; 
     *)  
        echo "Not supported installing Git on this OS yet" 
        exit 1 # Command to come out of the program with status 1
        ;; 
  esac
}

InstallJDK () {
  case "$platform" in 
    *Ubuntu*)
      apt-get update
      apt-get --assume-yes install default-jdk
      ;; 
    *centos*)
      yum check-update
      yum install -y java-1.7.0-openjdk-devel
      ;; 
     *)  
        echo "Not supported installing JDK on this OS yet" 
        exit 1 # Command to come out of the program with status 1
        ;; 
  esac
}

InstallMvn () {
  case "$platform" in 
    *Ubuntu*)
      apt-get update
      apt-get --assume-yes install maven
      ;; 
    *centos*)
      yum check-update
      yum install -y maven
      ;; 
     *)  
        echo "Not supported installing Mvn on this OS yet" 
        exit 1 # Command to come out of the program with status 1
        ;; 
  esac
}

if ! [ -x "$(command -v git)" ]; then
  echo 'git is not installed, installing'
  InstallGit
fi

if ! [ -x "$(command -v javac)" ]; then
  echo 'jdk is not installed, installing'
  InstallJDK
fi

if ! [ -x "$(command -v mvn)" ]; then
  echo 'maven is not installed, installing'
  InstallMvn
fi
