# How to install PetaLinux 

### My Setup
- Computer: `Lenovo ThinkPad P14s Gen 2`
- OS: `Ubuntu 22.04.04 LTS`
- PetaLinux: `2023.2`

### Instructinos
- Choose the PetaLinux installer that is the same version as the Vivado used https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools/2023-2.html. In this cas it is `PetaLinux 2023.2`
- Give the installer execute permissions
```bash
chmod +x intaller.run
```
- Verify this by checking for something along the lines of `rwxr-xr-x` in the permissions
```bash
ls -l installer.run
```
- Install all these dependencies 
```bash
sudo apt install gawk
sudo apt install net-tools 
sudo apt install xterm
sudo apt install autoconf
sudo apt install libtool
sudo apt install texinfo
sudo apt install zlib1g-dev
sudo apt install tftpd-hpa
```
- Run the installer executable and specify the working directory
```bash 
./installer.run --dir /opt/PetaLinux/
```

