### My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04`

# Installing Vivado
- Download the binary executable `.bin` 2023.2 Linux Self Extraxting Web Installer file from https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive.html and make it an executable
```bash
chmod +x filename.bin
```
- Verify it is now an exectuable by checking for `-rwxr-xr-x` in the permissions
```bash
ls -l filename.bin
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
