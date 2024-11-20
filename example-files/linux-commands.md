
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
sudo lvextend -L 100G /dev/rootvg/homelv
```
```bash
sudo lvextend -L 100G /dev/rootvg/varlv
```

- If the filesystem type is xfs, use the following command to resize it
```bash
sudo xfs_growfs /home
```
```bash
sudo xfs_growfs /var
```