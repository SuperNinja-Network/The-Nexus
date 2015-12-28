#!/bin/bash
#By Vincent Lee / vlee489
#(c) of Vincent Lee 2015
#See LICENSE file for copyright and license details
#The Nexus is made for the SuperNinja Network

#The Nexus
#Versions 1.0

#Constants
#------------------------
BuildToolDownload="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
BuildToolName="BuildTool.jar"
FolderName="BuildTool"
GitPrerequisites="git"
JavaPrerequisites="openjdk-7-jre-headless"
TarPrerequisites="tar"
1="install"
2="update"
#------------------------

if [ ${!i} = "$1" ]
then
  echo "Installing prerequisities via apt-get"
  apt-get update && apt-get upgrade -y
  apt-get install -y $GitPrerequisites $JavaPrerequisites $TarPrerequisites
  mkdir BuildTool
  cd $FolderName
  wget $BuildToolDownload

elif [ ${!i} = "$2" ];
then
  echo "This update will delete all of the build tool and it's contents!"
  echo "You have 3 SECONDS to cancel this with CTRL+C"
  sleep 3
  echo "updating prerequisities via apt-get"
  apt-get update && apt-get upgrade -y
  echo "Deleting BuildTool Folder!"
  rm -rf $FolderName
  echo "Rebuilding folder and Downloading Build tool!"
  mkdir $FolderName
  wget $BuildToolDownload

else
  echo "Running main build tool"
  cd $FolderName
  git config --global --unset core.autocrlf
  java -jar BuildTools.jar --rev latest
fi
