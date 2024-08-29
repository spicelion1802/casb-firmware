#### My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04`
- Vivado: `2023.2`

# Installing Vivado
- Download the binary executable `.bin` 2023.2 Linux Self Extraxting Web Installer file from https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html and make it an executable
```bash
chmod +x filename.bin
```
- Verify it is now an exectuable by checking for `-rwxr-xr-x` in the permissions
```bash
ls -l filename.bin
```
- Install these dependencies
```bash
sudo apt install libncurses5
sudo apt install libtinfo5
sudo apt install libncurses5-dev
sudo apt install libncursesw5-dev
sudo apt-get install libtinfo-dev
sudo apt-get install libncurses-dev
sudo apt-get install gitk
sudo apt-get install libdpkg-perl
sudo apt-get install git-gui
sudo apt-get install libstdc++6
sudo apt-get install libusb-dev
sudo apt-get install libgtk2.0-0
sudo apt-get install libc6-dev-i386
sudo apt-get install dpkg-dev
sudo apt-get install libegl-mesa0
sudo apt-get install libegl1-mesa
sudo apt-get install libgbm1
sudo apt-get install python3-apport
sudo apt-get install fxload
sudo apt-get install build-essential
sudo apt update
```
- Run the executable
```bash
./filename.bin
```
- Istall the Vivado ML Enterprise edition in `/opt/Xilinx`. To grant read and write permissions of `/opt` to everyone run
```bash
sudo chmod 777 /opt
```

# If the Installer Fails
- Try installing the following libraries and run the executable again
```bash
sudo apt install libtinfo6 libtinfo5 libtinfo-dev
```
- If the installer still fails, verify that the display is exporting correctly by running xclock
```bash
xclock
```
- If xclock works, maybe the OS is not compatable because it was upgraded with
```bash
sudo apt update
```
- If the OS has not been accidentaly upgraded, try downloading the `tar.gz` 2023.2 all OS single-file download
- AMD recommends the use of 7-zip to decompress the downloaded tar.gz file
```bash
sudo apt install p7zip-full
```
- Use 7-zip to extract the .tar file from the .tar.gz file
```bash
7z x filename.tar.gz
```
- Use tar to extract the contents of the .tar file
```bash
tar -xvf filename.tar
```
- Install any missing dependent libraries required by Vivado
```bash
 sudo /FPGAs_AdaptiveSoCs_Unified_2023.2_*/installLibs.sh
```
- Run xsetup to launch the installation
```bash
sudo ./FPGAs_AdaptiveSoCs_Unified_2023.2*/xsetup
```
