#!/bin/bash

# LINUX TYPES: https://github.com/cloudera/cm_ext/wiki/Parcel%20distro%20suffixes
# el5: Redhat Enterprise Linux 5 and clones (CentOS, Scientific Linux, etc)
# el6: Redhat Enterprise Linux 6 and clones (CentOS, Scientific Linux, etc)
# sles11: SuSE Linux Enterprise Server 11.x
# lucid: Ubuntu Linux 10.04 LTS (No CDH 5.x parcel provided)
# precise: Ubuntu Linux 12.04 LTS
# squeeze: Debian 6.x (No CDH 5.x parcel provided))
# wheezy: Debian 7.x (Newly supported in CM 5. No CDH 4.x parcel provided)


# [name]-[version]-[distro suffix].parcel

filename=DIVOLTE-0.2-el6.parcel
tar zcvf $filename DIVOLTE-0.2/

# Seems like a hash is required for ClouderaManager to pickup the parcel.
if which sha1sum >/dev/null; then
    sha1sum $filename | cut -d" " -f1 > ${filename}.sha1
else
    shasum $filename | cut -d" " -f1 > ${filename}.sha1
fi
