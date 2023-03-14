# build new SlitForks in PackageMaker by chris1111
# Credit:packagesdev, chris1111
# Vars
apptitle="Fix-PackageMaker-APFS"
version="1.0"
# Set Icon directory and file 
iconfile="/System/Library/CoreServices/Finder.app/Contents/Resources/Finder.icns"
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
DiskImage="./xcode44auxtools6938114a.dmg"
# Start Script
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


Sleep 2

if [ -f "$DiskImage" ];
then
   Sleep 3
else
   Sleep 3
   echo "Disk Image $DiskImage does not exist! ➣  Exit the script!"
   Sleep 3
   exit 123456
fi

echo "-------------------------------------------------------------------"
echo "By using this script you accept to install the new SlitForks and the 
Credits.html file in PackageMaker.app 

To continue you must enter your password 

Enter your password followed by Enter:"
echo "-------------------------------------------------------------------"
echo " "
sudo hdiutil attach ./$DiskImage -noverify -nobrowse -mountpoint /Volumes/PackageMaker
open ~/Fix-PackageMaker-APFS
cp -r /Volumes/PackageMaker/PackageMaker.app ./
rm -rf ./PackageMaker.app/Contents/Resources/SplitForks
Sleep 1
hdiutil detach -Force /Volumes/PackageMaker
Sleep 1
xcodebuild -project ./SplitForks/SplitForks.xcodeproj -alltargets -configuration Release
cp -r ./SplitForks/build/release/SplitForks ./PackageMaker.app/Contents/Resources
cp -r ./Credits.html ./PackageMaker.app/Contents/Resources
Sleep 1

echo "**********  Setup the new BundleVersion  ***********"
echo " "
Sleep 3

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString 3.0.7" ./PackageMaker.app/Contents/Info.plist

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion 203" ./PackageMaker.app/Contents/Info.plist

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString 3.0.7" ./PackageMaker.app/Contents/version.plist

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion 203" ./PackageMaker.app/Contents/version.plist

/usr/libexec/PlistBuddy -c "Set :SourceVersion 203000000000000" ./PackageMaker.app/Contents/version.plist
echo "
----------------
Done!
----------------"
