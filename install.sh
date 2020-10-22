#/bin/bash

NAME=xkb-backup-$(date +%Y-%m-%d-%H.%M.%S).tar.gz
CONF=/usr/share/X11/xkb


# Check if script has superuser permissions
if [ "$(id -u)" -ne 0 ];
then
   echo "Script requires superuser permissions"
   exit 1
fi

echo "Backing up current configuration in $PWD/$NAME"
tar zcf $NAME $CONF --absolute-names
DIRECTORY_OWNER=$(namei -o $PWD | tail -n 1 | awk '{if ($2) print $2}')
chown $DIRECTORY_OWNER -R $NAME

echo "Applying patch containing Dvorak-Qwerty configuration"
diff -Nar -C50 xkb-data-orig xkb-data-mod > file.patch
patch -p1 -d $CONF < file.patch

exit 0
