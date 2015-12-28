# The-Nexus
#### Only works on Debian based distros! E.G. Ubuntu , Debian

Software and scripts to automatically update Spigot via BuildTools and distribute to servers

Not the confused with Nexus by Spigot MC that is there Maven Repository. The Nexus is a piece of software that will become a automated system for build spigot and pushing it to servers.

# Usage

#### All commands require root privileges via Sudo!

To use the script use

    sudo bash TheNexus.sh

#### You will need to add one of these 3 arguments for the script to work.


    -i or -install
###### This used to installed the required Prerequisites and makes the folders need and Downloads the BuildsTools.jar from Spigot's Jenkin's Servers.

    -b or -build
###### This executes the commands need that are required before running the BuildTools.jar then runs the BuildTools to start building Spigot/CraftBukkit/Bukkit.

    -u or -update
###### This removed the files that BuildTools.jar has Downloaded and deletes BuildTool.jar itself, then downloads the newest version of the BuildTools.jar from Spigots Jenkin's Servers.

     -ub or -updateBuildTools
###### This only updates BuildTools.jar.

    -h or -help
###### This brings up the options for The Nexus.
