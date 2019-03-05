# build new SlitForks in PackageMaker by chris1111
# Credit:packagesdev, chris1111
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
defaults write com.apple.terminal "Default Window Settings" "Pro"
defaults write com.apple.terminal "Startup Window Settings" "Pro"
FILE="./xcode44auxtools6938114a.dmg"
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
echo "            `tput setaf 7``tput sgr0``tput bold``tput setaf 10`**********  Checks disk image if exist  ***********`tput sgr0` `tput setaf 7``tput sgr0` "
echo " "
Sleep 2
if [ -f "$FILE" ];
then
   Sleep 3
   echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`File $FILE exist! ➣  Execute the script.`tput sgr0` `tput setaf 7``tput sgr0`"
else
   Sleep 3
   echo "`tput setaf 7``tput sgr0``tput bold``tput setaf 10`File $FILE does not exist! ➣  Exit the script!`tput sgr0` `tput setaf 7``tput sgr0` " >&2
   Sleep 3
   exit 123456
fi

hdiutil attach ./xcode44auxtools6938114a.dmg -noverify -nobrowse -mountpoint /Volumes/PackageMaker
open ~/Fix-PackageMaker-APFS
cp -r /Volumes/PackageMaker/PackageMaker.app ./
Sleep 1
hdiutil detach -Force /Volumes/PackageMaker
xcodebuild -project ./SplitForks/SplitForks.xcodeproj -alltargets -configuration Release
rm -rf ./PackageMaker.app/Contents/Resources/SplitForks
Sleep 1
cp -r ./SplitForks/build/release/SplitForks ./PackageMaker.app/Contents/Resources
cp -r ./Credits.html ./PackageMaker.app/Contents/Resources
echo " "
echo "Done "
