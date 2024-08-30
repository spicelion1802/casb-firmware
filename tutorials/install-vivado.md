# How to install Vivado
Installing Vivado is like assembling a 10,000-piece jigsaw puzzle... in the dark... while blindfolded.

### My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04 LTS`
- Vivado: `2023.2`

### Instructions
- Download the binary executable `.bin` 2023.2 Linux Self Extraxting Web Installer file from https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html and make it an executable
```bash
chmod +x filename.bin
```
- Verify it is now an exectuable by checking for `-rwxr-xr-x` in the permissions
```bash
ls -l filename.bin
```
- Install all these dependencies. This is definitely overkill, but you are probably missing at least one of them.
```bash
sudo apt install libncurses5
sudo apt install libtinfo5
sudo apt install libtinfo6
sudo apt install libncurses5-dev
sudo apt install libncursesw5-dev
sudo apt install libtinfo-dev
sudo apt install libncurses-dev
sudo apt install libdpkg-perl
sudo apt install libstdc++6
sudo apt install libusb-dev
sudo apt install libgtk2.0-0
sudo apt install libc6-dev-i386
sudo apt install libegl-mesa0
sudo apt install libegl1-mesa
sudo apt install libgbm1
sudo apt install dpkg-dev
sudo apt install gitk
sudo apt install git-gui
sudo apt install python3-apport
sudo apt install fxload
sudo apt  install build-essential
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
- Skip the license setup: Penn already has one.

# If the Installer Fails

### If the GUI never opens
- Verify the display is exporting correctly by running xclock
```bash
xclock
```
- If xclock works, maybe the OS is not compatable because it was upgraded with
```bash
sudo apt update
```
- Try reinstalling `Ubuntu 22.04 LTS`

### If it hangs during verification
- Some dependencies may still be missing. Try downloading the `tar.gz` 2023.2 all OS single-file download. The unzipped folder has a script which installs all missing dependencies.
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
- Install all dependencies required by Vivado
```bash
 sudo /FPGAs_AdaptiveSoCs_Unified_2023.2_*/installLibs.sh
```
- Run xsetup to launch the installation
```bash
sudo ./FPGAs_AdaptiveSoCs_Unified_2023.2*/xsetup
```
