
#### system overview
- list attached drives
```bash
lsblk
```

#### extend current lvm
- finding available space in the rootvg volume group to expand 
```bash
sudo vgdisplay rootvg
```

- create a pv
```bash
sudo pvcreate /dev/sda5 
```

- extend vg
```bash
sudo vgextend rootvg /dev/sda5
```

- use the lvextend command to increase the size of the rootvg-homelv logical volume
```bash
sudo lvextend -l +100%FREE /dev/rootvg/homelv
```

- Assuming it is using an ext4 filesystem
```bash
sudo resize2fs /dev/rootvg/homelv
```

- If the filesystem type is xfs, use the following command to resize it
```bash
sudo xfs_growfs /home