# Fix PackageMaker APFS
![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/packag10.png)

### A fix for making PackageMaker working in APFS file system

### Follow every steps in the Video
                       ⟱
                       
[![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/video-10.png)](https://youtu.be/0aRIIv6Qb1c)

## Credit:
- : Apple for PackageMaker.app (Version 3.0.6 (201))
- : [packagesdev for the Fix in goldin](https://github.com/packagesdev/goldin/blob/1b82322022abc4b43c4e10379614501e1c0d67b0/main.c#L661)
- : chris1111 fix PackageMaker

![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/captu533.png)

#### You need Xcode and the Command Line tools for the compilation of SlitForks

## Usage: 
- cd ~/
- git clone https://github.com/chris1111/Fix-PackageMaker-APFS.git

- Let’s go developer’s site You will need to have an account, it’s free to create one.
- Once logged in, Download ➣ [Auxilary Tools for Xcode - Late july 2012](https://developer.apple.com/download/more/?name=PackageMaker)

![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/captu536.png)

### Move the disk image inside Fix-PackageMaker-APFS folder
![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/captu538.png)


### Complet with
- ~/Fix-PackageMaker-APFS/Builder.command

### The script will compile SplitForks and copy it into PackageMaker
![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/captu537.png)

### Done!


- Do not forget to move the disk image in the Fix-PackageMaker-APFS folder otherwise the script will abort!
![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/captu539.png)

#### NOTE: You can recreate the process anytime by double-clicking the Builder.command file


##### NOTE: (SlitForks) goldin binarie: ➤ Copyright (c) 2008-2018, Stephane Sudre All rights reserved.
<details> 
  <summary>View License  </summary>
	
##### Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. Neither the name of the WhiteBox nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

		

</details>


##### Simple usage Basic: (Without script)
<details> 
  <summary>How to use PackageMaker for Mac </summary>
	
It’s a very neat tool for systems administrators to use and create packages for OS X.

PackageMaker let’s you create simple and easy to use application or script packages to be deployed on clients machines.
Personally, I use PackageMaker constantly to create deployment software for batch installs or even pass on customized softwares to my end users as a simple to use install.


Once you have it install, launch it

![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/packag11.png)


In the Organization Field, you need a unique Organization concept such as com.apple, com.google (Clearly you don’t want to use those but pick something according)
Click OK

![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/packag12.png)


At this stage, you will need to give the package a title
Select the Install Destination (User selected, System Drive i.e Macintosh HD or the user home folder)
You can add a certificate (I will not get into that, because apps tied to certs are actual in house apps and chances are you rather the software checked in rather than having the cert with it)
Description will just give a written explanation to the user


![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/packag13.png)


Drag and Drop the app or Files you want to include in your package over to the content section (Firefox in this case)
You will see the permissions options allowing you to set permissions for the files.
Unless you know what you are doing, just apply the recommendations.

![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/packag14.png)


The configuration tab will allow you to say where exactly the app should be stored, give it an identifier and a version to your package, you can also set if it needs admin authentication or a restart action

![Modular Image Creation](https://i25.servimg.com/u/f25/18/50/18/69/interf10.png)


The Blue Interface Logo above the packageMaker window will allow you to customize the interface for a better User Experience.
This would be where you would put the User Agreement, etc.
Once all is done.
Click the Build and you will be prompted for a Saved Location and File Name
That’s it, you have created your package and it’s ready to use.
I would also recommend you save the PackageMaker build File so if you needed to make a new version it would be easy.



[Simple usage Basic written by ➤ Quam Sodj ](https://jumpt.wordpress.com/2013/02/28/44/)


</details>






