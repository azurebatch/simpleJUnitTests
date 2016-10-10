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

# Install blobxfer which is required for uploading test logs
if ! [ -x "$(command -v blobxfer)" ]; then
  echo 'blobxfer is not installed, installing'  
  InstallBlobxfer
fi

# Call SampleVMSetup.sh to install git, jdk and mvn
source SampleVMSetup.sh

# Upgrade nss on centos otherwise we will see InternalError exception in 
# sun.security.ec.SunEC.initialize when build sample JUnit test
yum upgrade nss
