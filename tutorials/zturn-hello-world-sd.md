# How to boot the zturn with an SD card


### Instructions
- Use the partition editor `parted` to create two partitions on an SDHC micro-SD card
  - A 256 MB FAT32 partition named BOOT
  - The remainder should be an EXT4 partition called ROOT
