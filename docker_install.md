# How to Install PetaLinux on Docker for Windows  

## My Setup  
- **Computer:** `Device name: DESKTOP-TQ684VH`  
- **OS:** `Windows 11 Pro`  
- **PetaLinux Version:** `2023.2`  
- **Installed RAM:** `64.0 GB`  
- **Processor:** `13th Gen Intel(R) Core(TM) i7-1370P @ 1.90 GHz`  
- **System Type:** `64-bit operating system, x64-based processor`  

---

## Tutorial & Dependencies  

- **Step-by-step tutorial:** [Medium Guide](https://medium.com/@animagun/how-to-use-docker-to-create-a-linux-environment-36f246d7cad9)  
- **Install dependencies:** [Hackster.io Guide](https://www.hackster.io/whitney-knitter/vivado-vitis-petalinux-2023-2-install-on-ubuntu-2f1b98)  
- **Fix "sudo command not found" in Docker:** [Stack Overflow Solution](https://stackoverflow.com/questions/39985480/unable-to-use-sudo-commands-within-docker-bash-sudo-command-not-found-is-di)  

---

## Setting Up Ubuntu in Docker  

### 1. Pull the Ubuntu Image  
```sh
docker pull ubuntu
```

- Tutorial : https://medium.com/@animagun/how-to-use-docker-to-create-a-linux-environment-36f246d7cad9

- Link to install dependencies: https://www.hackster.io/whitney-knitter/vivado-vitis-petalinux-2023-2-install-on-ubuntu-2f1b98

```
'in case docker says sudo command not found': https://stackoverflow.com/questions/39985480/unable-to-use-sudo-commands-within-docker-bash-sudo-command-not-found-is-di
```
-To download the ubuntu image you want use the command : "docker pull ubuntu"
-Make sure the image of the OS you want to create is all small characters. "docker pull Ubuntu" does not work.
-Make sure to login to your docker account using "docker login" 

-Once you login to the docker and create your ubuntu image. the next step would be to run it and get access to ubuntu CLI (command line interface). F 

```
apt-get -y install apt-utils
apt-get -y install curl
```

When trying to insstall dependencies for getting petalinux installer you will have to follow:
```
~$ sudo dpkg-reconfigure dash
~$ sudo dpkg --add-architecture i386
```
At that time if you get the following error:

![image](https://github.com/user-attachments/assets/674a40f9-9e88-44bd-9c86-2dacabaae150)

```
The fix is to run:"apt-get install dialog apt-utils" https://github.com/moby/moby/issues/27988#issuecomment-288147284
```
Possible Errors:

- E: Package 'tftpd' has no installation candidate
- E: Package 'python' has no installation candidate
- E: Package 'lsb' has no installation candidate

- For 2nd- try "sudo apt-get install python3"
- For 3rd- try "sudo apt-get install lsb-release"
- For 1st- try "sudo apt-get install tftp-hpa"

More errors:

- E: Unable to locate package libegl1-mesa
- E: Unable to locate package pylint3

- For 2nd-try
- ```sudo apt-get install pylint```
- For 1st: ```sudo apt-get install mesa-utils```
  ```
   root@e6e2215907ce:~# sudo gedit /etc/xinetd.d/tftp
    sudo: gedit: command not found
  ```
Fix:
```
  root@e6e2215907ce:~# gedit --version
  bash: gedit: command not found
  root@e6e2215907ce:~# sudo apt-get install gedit
```

Error:
```
root@e6e2215907ce:~# sudo gedit /etc/xinetd.d/tftp

(gedit:14317): Gtk-WARNING **: 19:11:34.372: cannot open display:
```

Fix: Dont use gedit. Use nano instead- 
```sudo apt-get install nano
 sudo nano /etc/xinetd.d/tftp
```

 This will leave you with a gui like this
 ![image](https://github.com/user-attachments/assets/72cc7a8d-2c2b-44be-93e1-07113ff7a637)

 I guess it is like Vim? I'm not really sure.
 

