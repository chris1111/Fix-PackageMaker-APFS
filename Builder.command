# build new SlitForks in PackageMaker by chris1111
# Credit:packagesdev, chris1111
# Vars
apptitle="Fix-PackageMaker-APFS"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/Finder.app/Contents/Resources/Finder.icns"
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
defaults write com.apple.terminal "Default Window Settings" "Pro"
defaults write com.apple.terminal "Startup Window Settings" "Pro"
DiskImage="./xcode44auxtools6938114a.dmg"
#   Slick Progress Bar
# Functions
PUT(){ echo -en "\033[${1};${2}H";}  
DRAW(){ echo -en "\033%";echo -en "\033(0";}         
WRITE(){ echo -en "\033(B";}  
HIDECURSOR(){ echo -en "\033[?25l";} 
NORM(){ echo -en "\033[?12l\033[?25h";}
function showBar {
        percDone=$(echo 'scale=2;'$1/$2*100 | bc)
        halfDone=$(echo $percDone/2 | bc) #I prefer a half sized bar graph
        barLen=$(echo ${percDone%'.00'})
        halfDone=`expr $halfDone + 13`
        tput bold
        PUT 7 28; printf "%4.4s  "      #Print the percentage
        PUT 1 $halfDone;  echo -e "\033[4m \033[0m" #Draw the bar
         tput sgr0
        }
# Start Script
clear
HIDECURSOR
echo -e ""`tput setaf 7``tput sgr0``tput bold``tput setaf 10` \                                                                                    
DRAW    #magic starts here - must use caps in draw mode                                            
echo -e "                        "
echo -e "           ****************************************************" 
echo -e "                  ************ PACKAGEMAKER *************" 
echo -e "           ****************************************************"
echo -e "                                                       
`tput sgr0` `tput setaf 7``tput sgr0`"


WRITE                

for (( i=0; i<=50; i++ ))  
do
    showBar $i 50  #Call bar drawing function "showBar"
    sleep 0.0
done
# End of your script
# Clean up at end of script
PUT 10 12                                           
echo -e ""                                        
NORM


printf '\e[8;44;80t'
rm -rf ./PackageMaker.app
rm -rf ./SplitForks/build
Sleep 1

# Execute
response=$(osascript -e 'tell app "System Events" to display dialog "Select Run to run the script to install the new SlitForks and the Credits.html file in PackageMaker.app 

Cancel for Exit" buttons {"Cancel","Run"} default button 2 with title "'"$apptitle"' '"$version"'" with icon POSIX file "'"$iconfile"'"  ')

answer=$(echo $response | grep "Run")

# Exit if Canceled
if [ ! "$answer" ] ; then
  osascript -e 'display notification "Program closing" with title "'"$apptitle"'" subtitle "Exit the script by user '"$usbdisk"'"'
  exit 0
fi

echo "            `tput setaf 7``tput sgr0``tput bold``tput setaf 10`**********  Checks disk image if exist  ***********`tput sgr0` `tput setaf 7``tput sgr0` "
echo " "
Sleep 2

if [ -f "$DiskImage" ];
then
   Sleep 3
   echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`Disk Image $DiskImage exist! ➣  Execute the script ➣  (OK)`tput sgr0` `tput setaf 7``tput sgr0`"
else
   Sleep 3
   echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`Disk Image $DiskImage does not exist! ➣  Exit the script!`tput sgr0` `tput setaf 7``tput sgr0` " >&2
   Sleep 3
   exit 123456
fi

echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`-------------------------------------------------------------------`tput sgr0` `tput setaf 7``tput sgr0`"
echo "By using this script you accept to install the new SlitForks and the 
Credits.html file in PackageMaker.app 

To continue you must enter your password 

Enter your password followed by Enter"
echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`-------------------------------------------------------------------`tput sgr0` `tput setaf 7``tput sgr0`"
echo " "
sudo hdiutil attach ./$DiskImage -noverify -nobrowse -mountpoint /Volumes/PackageMaker
open ~/Fix-PackageMaker-APFS
cp -r /Volumes/PackageMaker/PackageMaker.app ./
sudo rm -rf ./PackageMaker.app/Contents/Resources/SplitForks
Sleep 1
hdiutil detach -Force /Volumes/PackageMaker
Sleep 1
xcodebuild -project ./SplitForks/SplitForks.xcodeproj -alltargets -configuration Release
sudo cp -r ./SplitForks/build/release/SplitForks ./PackageMaker.app/Contents/Resources
sudo cp -r ./Credits.html ./PackageMaker.app/Contents/Resources
Sleep 1
echo "
`tput setaf 7``tput sgr0``tput bold``tput setaf 10`----------------`tput sgr0` `tput setaf 7``tput sgr0`
Done
`tput setaf 7``tput sgr0``tput bold``tput setaf 10`----------------`tput sgr0` `tput setaf 7``tput sgr0` "
