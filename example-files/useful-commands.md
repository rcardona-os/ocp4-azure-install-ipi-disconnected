
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

- create partition
```bash
sudo fdisk /dev/sda
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

- turning off firewall
```bash
sudo systemctl stop firewalld
```
```bash
sudo systemctl disable firewalld
```

### Azure commands
- list resources
```bash
az resource list --resource-group existing_infra_rg --output table
```

### OCP installation

```bash
mkdir inst
```

```bash
cp ori.install-config.yaml inst/install-config.yaml
```

```bash
./openshift-install create cluster --dir inst --log-level debug > /tmp/install.log 2>&1 &
```

