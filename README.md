# pywal-wled
Adjust wled from pywal.

Add the following section to you pywal update script:
```bash
echo "changing WLED"
/path/to/pywal-wled/wled_colorchanger.sh <IP of wled device> 
```
You can put the script into you $PATH or reference the checkout location.

