#!/bin/bash
#By Vincent Lee / vlee489
#(c) of Vincent Lee 2015
#See LICENSE file for copyright and license details
#The Nexus is made for the SuperNinja Network

#The Nexus
#Versions 2.1

#Constants
#------------------------
BuildToolDownload="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
BuildToolName="BuildTools.jar"
FolderName="BuildTool"
GitPrerequisites="git"
JavaPrerequisites="openjdk-7-jre-headless"
TarPrerequisites="tar"
CurlPrerequisites="curl"
#------------------------
#Colours
#------------------------
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#------------------------

while test $# -gt 0; do
        case "$1" in
                -h|--help)
                        echo "The Nexus Updater 2.0"
                        echo "options:"
                        echo "-h, --help                show brief help"
                        echo "-install | -i             Install the updater's prerequisities"
                        echo "-update  | -u             Update the prerequisities and BuildTool"
                        echo "-build   | -b             Build Spigot/Bukkit/CraftBukkit"
                        exit 0
                        ;;
       -update|-u)
                        echo "${red}This update will delete all of the build tool and it's contents!${reset}"
                        echo "${red}You have 3 SECONDS to cancel this with CTRL+C${reset}"
                        sleep 3
                        echo "${green}updating prerequisities via apt-get${reset}"
                        apt-get update && apt-get upgrade -y
                        clear
                        echo "${red}Deleting BuildTool Folder!${reset}"
                        rm -rf $FolderName
                        echo "${green}Rebuilding folder and Downloading BuildTools!${reset}"
                        mkdir $FolderName
                        cd $FolderName
                        wget $BuildToolDownload
                        exit 0
                        ;;
      -install|-i)
                       clear
                       echo "${green}Installing prerequisities via apt-get${reset}"
                       apt-get update && apt-get upgrade -y
                       apt-get install -y $GitPrerequisites $JavaPrerequisites $TarPrerequisites $CurlPrerequisites
                       clear
                       echo "${green}Build folders and downloading BuildTools${reset}"
                       mkdir $FolderName
                       cd $FolderName
                       wget $BuildToolDownload
                       exit 0
                       ;;
        -build|-b)
                       clear
                       echo "${green}Running main Build setting and BuiltTool${reset}"
                       cd $FolderName
                       git config --global --unset core.autocrlf
                       clear
                       echo "${green}Starting BuildTools${reset}"
                       java -jar $BuildToolName --rev latest
                       exit 0
                       ;;
-updateBuildTools|-ub)
                      clear
                      echo "${green}Updateing only the BuildTools.jar${reset}"
                      cd $FolderName
                      rm -rf $BuildToolName
                      wget $BuildToolDownload
                      exit 0
                      ;;
                *)
                        echo "${red}Try TheNexus.sh --help for help${reset}"
                        break
                        ;;
        esac
done
