# How to boot the zturn with an SD card


### Creating partitions on the SD card
- Use the partition editor `parted` to create two partitions on an SDHC micro-SD card
  - A 256 MB FAT32 partition named BOOT
  - The remainder should be an EXT4 partition called ROOT
```bash
sudo apt install gparted
sudo gparted
```
- Select the SD card from the drop down menu in the top right corner. **Make sure you select the SD card**, maybe `/dev/sda` and not something like `/dev/nvme0n1`, which is your computer's internal storage
- Unmount and delete all the partitions on the SD card
- Right click on the unallocated space and select new
  - Partition name: `BOOT`
  - File System: `fat32`
  - Size: 256MB=245MiB
- Add and repeat
  - Patition name: `ROOT`
  - File System: `ext4`
  - Size: Remainder of the disk
- If you did this correclty, there will be no unallocated space remaining
- If there is a red exlamaton mark next to one of the partitions, right click then choose check
- If error is `repair file system (fat32) on /dev/sda1`, fix the error through terminal
```bash
sudo umount /dev/sda1
sudo fsck.vfat -a /dev/sda1
sudo mount /dev/sda1 /mnt
```
- Reopen gparted and check that the flag disapeared

### Filling the partition
- Copy `BOOT.bin`, `image.ub`, and `boot.scr` from `casb.linux/images/linux/` to the `BOOT` partition
