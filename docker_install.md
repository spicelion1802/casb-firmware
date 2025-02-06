OS: Windows 11 Pro
System: Device name	DESKTOP-TQ684VH
Processor	13th Gen Intel(R) Core(TM) i7-1370P   1.90 GHz
Installed RAM	64.0 GB 
System type	64-bit operating system, x64-based processor

Tutorial : https://medium.com/@animagun/how-to-use-docker-to-create-a-linux-environment-36f246d7cad9
Visit 


'in case docker says sudo command not found': https://stackoverflow.com/questions/39985480/unable-to-use-sudo-commands-within-docker-bash-sudo-command-not-found-is-di

-To download the ubuntu image you want use the command : "docker pull ubuntu"
-Make sure the image of the OS you want to create is all small characters. "docker pull Ubuntu" does not work.
-Make sure to login to your docker account using "docker login" 

-Once you login to the docker and create your ubuntu image. the next step would be to run it and get access to ubuntu CLI (command line interface). F 

apt-get -y install apt-utils
apt-get -y install curl

When trying to insstall dependencies for getting petalinux installer you will have to follow:

~$ sudo dpkg-reconfigure dash
~$ sudo dpkg --add-architecture i386

At that time if you get the following error:

![image](https://github.com/user-attachments/assets/674a40f9-9e88-44bd-9c86-2dacabaae150)

The fix is to run:"apt-get install dialog apt-utils" https://github.com/moby/moby/issues/27988#issuecomment-288147284
