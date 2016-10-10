#!/bin/bash

platform=`python -mplatform`

InstallBlobxfer () {
  platform=`python -mplatform`
  case "$platform" in 
    *centos-7.0*)
      yum check-update
      yum install -y gcc libffi-devel python-devel openssl-devel

      python -m pip install --upgrade pip
      pip install --upgrade blobxfer
      ;;
     *)  
        # Do nothing
        ;; 
  esac
}

InstallGit () {
  case "$platform" in 
    *Ubuntu*)
      sudo apt-get update
      sudo apt-get --assume-yes install git
      ;; 
     *)  
        echo "Not supported on this OS yet" 
        exit 1 # Command to come out of the program with status 1
        ;; 
  esac
}

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

# Install blobxfer which is required for uploading test logs
if ! [ -x "$(command -v blobxfer)" ]; then
  echo 'blobxfer is not installed, installing'  
  InstallBlobxfer
fi

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
