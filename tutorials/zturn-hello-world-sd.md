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
- Click the green check mark to apply the changes
- There may be a red exclamation mark next to the BOOT partition. That should be fixed from mounting it

### Create temporary mounting points on local machine for SD card partitions
- Assuming that:
  - `/dev/sda1` is `BOOT` partition
  - `/dev/sda2` is `ROOT` partition
```bash
sudo umount /dev/sda1
sudo fsck.vfat -a /dev/sda1
sudo mkdir /mnt/sd_boot
sudo mount /dev/sda1 /mnt/sd_boot
```
```bash
sudo umount /dev/sda2
sudo fsck.vfat -a /dev/sda2
sudo mkdir /mnt/sd_root
sudo mount /dev/sda2 /mnt/sd_root
```
- Reopen gparted and check that the flag disapeared.

### Filling the partition
- Copy `BOOT.bin`, `image.ub`, and `boot.scr` from `casb.linux/images/linux/` to the `BOOT` partition
