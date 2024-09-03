# How to build PetaLinux (and software) from a Vivado project

### Instructions
- Open Vivado
```bash
vivado_2023
vivado
```
- Open project
- `Program and Debug` --> `Generate Bitstream`
- `File` --> `Export` --> `Export Bitstream File` and name it `casb_tester.bit`
- `File` --> `Export` --> `Export Hardware` --> `Include Bitstream`
- From the `firmware/` directory create the PetaLinux project
```bash
petalinux-create -t project -n qpix.linux --template zynq
```
- From Adrian's project copy `/petalinux/configs/config` and `/petalinux/configs/rootfs_config` to `casb.linux/project-spec/configs/`
- Grab the exported `.xsa` and `.bit` files
```bash
petalinux-config -p casb.linux/ --get-hw-description casb_tester/
```
- In the graphical menu that pops up, confirm **Image Packaging Configuration - Root filesystem type - EXT4** has been properly selected from the configuration files (this ensures the image will boot from an ext4 partition on the SD card).
```bash
petalinux-config -p casb.linux/ -c rootfs
```
- In the graphical menu that pops up, confirm that the choices in the `rootfs_config` file are reflected here (there are several filesystem ulitiies that will be marked for install based on the file).
- Check that `project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi` is empty. If custom device drivers are desired, or if a property of an existing hardwaer device (e.g the SD card controller) needs to be modified, this file can be modified.
- From Adrian's project copy `petalinux/recipes/regtest/` to `casb.linux/project-spec/meta-user/recipes-apps/` to add a simple user application to the build. This is donw by creating an app template as in the https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842475/PetaLinux+Yocto+Tips#PetaLinuxYoctoTips-CreatingApps(whichuseslibraries)inPetaLinuxProject. 
- From Adrian's project copy `/petalinux/confix/user-rootfsconfig` to `project-spec/meta-user/conf/` to ensure that user application are included in the root file system.
- Build the project. This will take an hour the first time.
```bash
petalinux-build -p casb.linux
```


