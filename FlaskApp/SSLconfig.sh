 ➜  ~ ssh ubuntu@107.21.5.255 -i .ssh/x-labs-decent.pem       [20/09/28| 1:30PM]
Welcome to Ubuntu 18.04.1 LTS (GNU/Linux 4.15.0-1021-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon Sep 28 09:30:17 UTC 2020

  System load:  0.0                Processes:           88
  Usage of /:   13.8% of 19.32GB   Users logged in:     0
  Memory usage: 43%                IP address for eth0: 172.26.13.218
  Swap usage:   0%

 * Kubernetes 1.19 is out! Get it in one command with:

     sudo snap install microk8s --channel=1.19 --classic

   https://microk8s.io/ has docs and details.

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

117 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Mon Sep 28 07:08:23 2020 from 91.230.41.202
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-26-13-218:~$ sudo apt-get update
Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Get:4 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main Sources [331 kB]
Get:6 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [1089 kB]
Get:7 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1113 kB]
Get:8 http://security.ubuntu.com/ubuntu bionic-security/main Sources [168 kB]
Get:9 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [868 kB]
Get:10 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [708 kB]
Fetched 4530 kB in 1s (3144 kB/s)
Reading package lists... Done
ubuntu@ip-172-26-13-218:~$ sudo apt-get install software-properties-common
Reading package lists... Done
Building dependency tree
Reading state information... Done
software-properties-common is already the newest version (0.96.24.32.14).
The following packages were automatically installed and are no longer required:
  linux-aws-5.3-headers-5.3.0-1028 linux-aws-5.3-headers-5.3.0-1030 linux-aws-5.3-headers-5.3.0-1032
  linux-aws-5.3-headers-5.3.0-1033 linux-aws-5.3-headers-5.3.0-1034
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 114 not upgraded.
ubuntu@ip-172-26-13-218:~$ sudo add-apt-repository ppa:certbot/certbot
 This is the PPA for packages prepared by Debian Let's Encrypt Team and backported for Ubuntu.

Note: Packages are only provided for currently supported Ubuntu releases.
 More info: https://launchpad.net/~certbot/+archive/ubuntu/certbot
Press [ENTER] to continue or Ctrl-c to cancel adding it.

Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu bionic-security InRelease
Get:5 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic InRelease [21.3 kB]
Get:6 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 Packages [8032 B]
Get:7 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main Translation-en [4176 B]
Fetched 33.5 kB in 1s (47.2 kB/s)
Reading package lists... Done
ubuntu@ip-172-26-13-218:~$ sudo apt-get update
Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:5 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic InRelease
Reading package lists... Done
ubuntu@ip-172-26-13-218:~$ sudo apt-get install certbot python-certbot-apache
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-aws-5.3-headers-5.3.0-1028 linux-aws-5.3-headers-5.3.0-1030 linux-aws-5.3-headers-5.3.0-1032
  linux-aws-5.3-headers-5.3.0-1033 linux-aws-5.3-headers-5.3.0-1034
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils augeas-lenses libapr1 libaprutil1 libaprutil1-dbd-sqlite3
  libaprutil1-ldap libaugeas0 liblua5.2-0 python3-acme python3-augeas python3-certbot python3-certbot-apache
  python3-configargparse python3-future python3-icu python3-josepy python3-mock python3-ndg-httpsclient
  python3-parsedatetime python3-pbr python3-requests-toolbelt python3-rfc3339 python3-tz python3-zope.component
  python3-zope.event python3-zope.hookable ssl-cert
Suggested packages:
  www-browser apache2-doc apache2-suexec-pristine | apache2-suexec-custom augeas-doc python3-certbot-nginx
  python-certbot-doc augeas-tools python-acme-doc python-certbot-apache-doc python-future-doc python-mock-doc
  openssl-blacklist
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils augeas-lenses certbot libapr1 libaprutil1 libaprutil1-dbd-sqlite3
  libaprutil1-ldap libaugeas0 liblua5.2-0 python-certbot-apache python3-acme python3-augeas python3-certbot
  python3-certbot-apache python3-configargparse python3-future python3-icu python3-josepy python3-mock
  python3-ndg-httpsclient python3-parsedatetime python3-pbr python3-requests-toolbelt python3-rfc3339 python3-tz
  python3-zope.component python3-zope.event python3-zope.hookable ssl-cert
0 upgraded, 32 newly installed, 0 to remove and 116 not upgraded.
Need to get 3384 kB of archives.
After this operation, 15.6 MB of additional disk space will be used.
Do you want to continue? [Y/n] Y
Get:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 libapr1 amd64 1.6.3-2 [90.9 kB]
Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 libaprutil1 amd64 1.6.1-2 [84.4 kB]
Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 libaprutil1-dbd-sqlite3 amd64 1.6.1-2 [10.6 kB]
Get:4 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 libaprutil1-ldap amd64 1.6.1-2 [8764 B]
Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 liblua5.2-0 amd64 5.2.4-1.1build1 [108 kB]
Get:6 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2-bin amd64 2.4.29-1ubuntu4.14 [1070 kB]
Get:7 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2-utils amd64 2.4.29-1ubuntu4.14 [83.9 kB]
Get:8 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2-data all 2.4.29-1ubuntu4.14 [160 kB]
Get:9 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2 amd64 2.4.29-1ubuntu4.14 [95.1 kB]
Get:10 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 augeas-lenses all 1.10.1-2 [300 kB]
Get:11 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 python3-pbr all 3.1.1-3ubuntu3 [53.8 kB]
Get:12 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/universe amd64 python3-mock all 2.0.0-3 [47.5 kB]
Get:13 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 python3-tz all 2018.3-2 [25.1 kB]
Get:14 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 python3-rfc3339 all 1.0-4 [6356 B]
Get:15 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/universe amd64 python3-ndg-httpsclient all 0.4.4-1 [23.5 kB]
Get:16 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/universe amd64 python3-configargparse all 0.11.0-1 [22.4 kB]
Get:17 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/universe amd64 python3-zope.event all 4.2.0-1 [7402 B]
Get:18 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 libaugeas0 amd64 1.10.1-2 [159 kB]
Get:19 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 python3-icu amd64 1.9.8-0ubuntu1 [173 kB]
Get:20 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/main amd64 ssl-cert all 1.0.39 [17.0 kB]
Get:21 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-josepy all 1.1.0-2+ubuntu18.04.1+certbot+1 [27.8 kB]
Get:22 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-requests-toolbelt all 0.8.0-1+ubuntu18.04.1+certbot+1 [38.3 kB]
Get:23 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-acme all 0.31.0-2+ubuntu18.04.3+certbot+2 [50.7 kB]
Get:24 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-future all 0.15.2-4+ubuntu18.04.1+certbot+3 [333 kB]
Get:25 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-parsedatetime all 2.4-3+ubuntu18.04.1+certbot+3 [32.4 kB]
Get:26 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-zope.hookable amd64 4.0.4-4+ubuntu18.04.1+certbot+1 [9532 B]
Get:27 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-zope.component all 4.3.0-1+ubuntu18.04.1+certbot+3 [43.1 kB]
Get:28 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-certbot all 0.31.0-1+ubuntu18.04.1+certbot+1 [208 kB]
Get:29 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 certbot all 0.31.0-1+ubuntu18.04.1+certbot+1 [11.0 kB]
Get:30 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-augeas all 0.5.0-1+ubuntu18.04.1+certbot+1 [9288 B]
Get:31 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python3-certbot-apache all 0.31.0-1+ubuntu18.04.1+certbot+1 [69.7 kB]
Get:32 http://ppa.launchpad.net/certbot/certbot/ubuntu bionic/main amd64 python-certbot-apache all 0.31.0-1+ubuntu18.04.1+certbot+1 [3964 B]
Fetched 3384 kB in 3s (1062 kB/s)
Extracting templates from packages: 100%
Preconfiguring packages ...
Selecting previously unselected package libapr1:amd64.
(Reading database ... 201503 files and directories currently installed.)
Preparing to unpack .../00-libapr1_1.6.3-2_amd64.deb ...
Unpacking libapr1:amd64 (1.6.3-2) ...
Selecting previously unselected package libaprutil1:amd64.
Preparing to unpack .../01-libaprutil1_1.6.1-2_amd64.deb ...
Unpacking libaprutil1:amd64 (1.6.1-2) ...
Selecting previously unselected package libaprutil1-dbd-sqlite3:amd64.
Preparing to unpack .../02-libaprutil1-dbd-sqlite3_1.6.1-2_amd64.deb ...
Unpacking libaprutil1-dbd-sqlite3:amd64 (1.6.1-2) ...
Selecting previously unselected package libaprutil1-ldap:amd64.
Preparing to unpack .../03-libaprutil1-ldap_1.6.1-2_amd64.deb ...
Unpacking libaprutil1-ldap:amd64 (1.6.1-2) ...
Selecting previously unselected package liblua5.2-0:amd64.
Preparing to unpack .../04-liblua5.2-0_5.2.4-1.1build1_amd64.deb ...
Unpacking liblua5.2-0:amd64 (5.2.4-1.1build1) ...
Selecting previously unselected package apache2-bin.
Preparing to unpack .../05-apache2-bin_2.4.29-1ubuntu4.14_amd64.deb ...
Unpacking apache2-bin (2.4.29-1ubuntu4.14) ...
Selecting previously unselected package apache2-utils.
Preparing to unpack .../06-apache2-utils_2.4.29-1ubuntu4.14_amd64.deb ...
Unpacking apache2-utils (2.4.29-1ubuntu4.14) ...
Selecting previously unselected package apache2-data.
Preparing to unpack .../07-apache2-data_2.4.29-1ubuntu4.14_all.deb ...
Unpacking apache2-data (2.4.29-1ubuntu4.14) ...
Selecting previously unselected package apache2.
Preparing to unpack .../08-apache2_2.4.29-1ubuntu4.14_amd64.deb ...
Unpacking apache2 (2.4.29-1ubuntu4.14) ...
Selecting previously unselected package augeas-lenses.
Preparing to unpack .../09-augeas-lenses_1.10.1-2_all.deb ...
Unpacking augeas-lenses (1.10.1-2) ...
Selecting previously unselected package python3-josepy.
Preparing to unpack .../10-python3-josepy_1.1.0-2+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking python3-josepy (1.1.0-2+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package python3-pbr.
Preparing to unpack .../11-python3-pbr_3.1.1-3ubuntu3_all.deb ...
Unpacking python3-pbr (3.1.1-3ubuntu3) ...
Selecting previously unselected package python3-mock.
Preparing to unpack .../12-python3-mock_2.0.0-3_all.deb ...
Unpacking python3-mock (2.0.0-3) ...
Selecting previously unselected package python3-requests-toolbelt.
Preparing to unpack .../13-python3-requests-toolbelt_0.8.0-1+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking python3-requests-toolbelt (0.8.0-1+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package python3-tz.
Preparing to unpack .../14-python3-tz_2018.3-2_all.deb ...
Unpacking python3-tz (2018.3-2) ...
Selecting previously unselected package python3-rfc3339.
Preparing to unpack .../15-python3-rfc3339_1.0-4_all.deb ...
Unpacking python3-rfc3339 (1.0-4) ...
Selecting previously unselected package python3-acme.
Preparing to unpack .../16-python3-acme_0.31.0-2+ubuntu18.04.3+certbot+2_all.deb ...
Unpacking python3-acme (0.31.0-2+ubuntu18.04.3+certbot+2) ...
Selecting previously unselected package python3-ndg-httpsclient.
Preparing to unpack .../17-python3-ndg-httpsclient_0.4.4-1_all.deb ...
Unpacking python3-ndg-httpsclient (0.4.4-1) ...
Selecting previously unselected package python3-configargparse.
Preparing to unpack .../18-python3-configargparse_0.11.0-1_all.deb ...
Unpacking python3-configargparse (0.11.0-1) ...
Selecting previously unselected package python3-future.
Preparing to unpack .../19-python3-future_0.15.2-4+ubuntu18.04.1+certbot+3_all.deb ...
Unpacking python3-future (0.15.2-4+ubuntu18.04.1+certbot+3) ...
Selecting previously unselected package python3-parsedatetime.
Preparing to unpack .../20-python3-parsedatetime_2.4-3+ubuntu18.04.1+certbot+3_all.deb ...
Unpacking python3-parsedatetime (2.4-3+ubuntu18.04.1+certbot+3) ...
Selecting previously unselected package python3-zope.hookable.
Preparing to unpack .../21-python3-zope.hookable_4.0.4-4+ubuntu18.04.1+certbot+1_amd64.deb ...
Unpacking python3-zope.hookable (4.0.4-4+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package python3-zope.event.
Preparing to unpack .../22-python3-zope.event_4.2.0-1_all.deb ...
Unpacking python3-zope.event (4.2.0-1) ...
Selecting previously unselected package python3-zope.component.
Preparing to unpack .../23-python3-zope.component_4.3.0-1+ubuntu18.04.1+certbot+3_all.deb ...
Unpacking python3-zope.component (4.3.0-1+ubuntu18.04.1+certbot+3) ...
Selecting previously unselected package python3-certbot.
Preparing to unpack .../24-python3-certbot_0.31.0-1+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking python3-certbot (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package certbot.
Preparing to unpack .../25-certbot_0.31.0-1+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking certbot (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package libaugeas0:amd64.
Preparing to unpack .../26-libaugeas0_1.10.1-2_amd64.deb ...
Unpacking libaugeas0:amd64 (1.10.1-2) ...
Selecting previously unselected package python3-augeas.
Preparing to unpack .../27-python3-augeas_0.5.0-1+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking python3-augeas (0.5.0-1+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package python3-certbot-apache.
Preparing to unpack .../28-python3-certbot-apache_0.31.0-1+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking python3-certbot-apache (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package python-certbot-apache.
Preparing to unpack .../29-python-certbot-apache_0.31.0-1+ubuntu18.04.1+certbot+1_all.deb ...
Unpacking python-certbot-apache (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Selecting previously unselected package python3-icu.
Preparing to unpack .../30-python3-icu_1.9.8-0ubuntu1_amd64.deb ...
Unpacking python3-icu (1.9.8-0ubuntu1) ...
Selecting previously unselected package ssl-cert.
Preparing to unpack .../31-ssl-cert_1.0.39_all.deb ...
Unpacking ssl-cert (1.0.39) ...
Setting up python3-requests-toolbelt (0.8.0-1+ubuntu18.04.1+certbot+1) ...
Setting up libapr1:amd64 (1.6.3-2) ...
Setting up python3-pbr (3.1.1-3ubuntu3) ...
update-alternatives: using /usr/bin/python3-pbr to provide /usr/bin/pbr (pbr) in auto mode
Processing triggers for ufw (0.35-5) ...
Processing triggers for ureadahead (0.100.0-20) ...
Setting up python3-mock (2.0.0-3) ...
Setting up python3-zope.event (4.2.0-1) ...
Setting up python3-icu (1.9.8-0ubuntu1) ...
Setting up apache2-data (2.4.29-1ubuntu4.14) ...
Setting up ssl-cert (1.0.39) ...
Setting up python3-configargparse (0.11.0-1) ...
Setting up python3-zope.hookable (4.0.4-4+ubuntu18.04.1+certbot+1) ...
Setting up python3-future (0.15.2-4+ubuntu18.04.1+certbot+3) ...
update-alternatives: using /usr/bin/python3-futurize to provide /usr/bin/futurize (futurize) in auto mode
update-alternatives: using /usr/bin/python3-pasteurize to provide /usr/bin/pasteurize (pasteurize) in auto mode
Processing triggers for libc-bin (2.27-3ubuntu1.2) ...
Setting up libaprutil1:amd64 (1.6.1-2) ...
Processing triggers for systemd (237-3ubuntu10.38) ...
Setting up augeas-lenses (1.10.1-2) ...
Processing triggers for man-db (2.8.3-2) ...
Setting up python3-ndg-httpsclient (0.4.4-1) ...
Setting up python3-josepy (1.1.0-2+ubuntu18.04.1+certbot+1) ...
Setting up liblua5.2-0:amd64 (5.2.4-1.1build1) ...
Setting up python3-tz (2018.3-2) ...
Setting up python3-parsedatetime (2.4-3+ubuntu18.04.1+certbot+3) ...
Setting up libaprutil1-ldap:amd64 (1.6.1-2) ...
Setting up python3-rfc3339 (1.0-4) ...
Setting up libaprutil1-dbd-sqlite3:amd64 (1.6.1-2) ...
Setting up apache2-utils (2.4.29-1ubuntu4.14) ...
Setting up python3-zope.component (4.3.0-1+ubuntu18.04.1+certbot+3) ...
Setting up libaugeas0:amd64 (1.10.1-2) ...
Setting up apache2-bin (2.4.29-1ubuntu4.14) ...
Setting up python3-augeas (0.5.0-1+ubuntu18.04.1+certbot+1) ...
Setting up python3-acme (0.31.0-2+ubuntu18.04.3+certbot+2) ...
Setting up python3-certbot (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Setting up apache2 (2.4.29-1ubuntu4.14) ...
Enabling module mpm_event.
Enabling module authz_core.
Enabling module authz_host.
Enabling module authn_core.
Enabling module auth_basic.
Enabling module access_compat.
Enabling module authn_file.
Enabling module authz_user.
Enabling module alias.
Enabling module dir.
Enabling module autoindex.
Enabling module env.
Enabling module mime.
Enabling module negotiation.
Enabling module setenvif.
Enabling module filter.
Enabling module deflate.
Enabling module status.
Enabling module reqtimeout.
Enabling conf charset.
Enabling conf localized-error-pages.
Enabling conf other-vhosts-access-log.
Enabling conf security.
Enabling conf serve-cgi-bin.
Enabling site 000-default.
Created symlink /etc/systemd/system/multi-user.target.wants/apache2.service → /lib/systemd/system/apache2.service.
Created symlink /etc/systemd/system/multi-user.target.wants/apache-htcacheclean.service → /lib/systemd/system/apache-htcacheclean.service.
Setting up certbot (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Created symlink /etc/systemd/system/timers.target.wants/certbot.timer → /lib/systemd/system/certbot.timer.
certbot.service is a disabled or a static unit, not starting it.
Setting up python3-certbot-apache (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Setting up python-certbot-apache (0.31.0-1+ubuntu18.04.1+certbot+1) ...
Processing triggers for libc-bin (2.27-3ubuntu1.2) ...
Processing triggers for systemd (237-3ubuntu10.38) ...
Processing triggers for ureadahead (0.100.0-20) ...
Processing triggers for ufw (0.35-5) ...
ubuntu@ip-172-26-13-218:~$ sudo certbot --apache
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator apache, Installer apache
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): aal544@nyu.edu

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: A

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about our work
encrypting the web, EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: N
No names were found in your configuration files. Please enter in your domain
name(s) (comma and/or space separated)  (Enter 'c' to cancel): decent.x-labs.xyz
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for decent.x-labs.xyz
Enabled Apache rewrite module
Waiting for verification...
Cleaning up challenges
Created an SSL vhost at /etc/apache2/sites-available/000-default-le-ssl.conf
Enabled Apache socache_shmcb module
Enabled Apache ssl module
Deploying Certificate to VirtualHost /etc/apache2/sites-available/000-default-le-ssl.conf
Enabling available site: /etc/apache2/sites-available/000-default-le-ssl.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2
Enabled Apache rewrite module
Redirecting vhost in /etc/apache2/sites-enabled/000-default.conf to ssl vhost in /etc/apache2/sites-available/000-default-le-ssl.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://decent.x-labs.xyz

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=decent.x-labs.xyz
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/decent.x-labs.xyz/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/decent.x-labs.xyz/privkey.pem
   Your cert will expire on 2020-12-27. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le

ubuntu@ip-172-26-13-218:~$ sudo systemctl restart apache2.service
ubuntu@ip-172-26-13-218:~$ sudo apachectl -t -D DUMP_VHOSTS
VirtualHost configuration:
*:443                  decent.x-labs.xyz (/etc/apache2/sites-enabled/000-default-le-ssl.conf:2)
*:80                   ip-172-26-13-218.ec2.internal (/etc/apache2/sites-enabled/000-default.conf:1)
ubuntu@ip-172-26-13-218:~$ ps -ax
  PID TTY      STAT   TIME COMMAND
    1 ?        Ss     0:45 /lib/systemd/systemd --system --deserialize 40
    2 ?        S      0:00 [kthreadd]
    4 ?        I<     0:00 [kworker/0:0H]
    6 ?        I<     0:00 [mm_percpu_wq]
    7 ?        S      0:05 [ksoftirqd/0]
    8 ?        I      0:10 [rcu_sched]
    9 ?        I      0:00 [rcu_bh]
   10 ?        S      0:00 [migration/0]
   11 ?        S      0:17 [watchdog/0]
   12 ?        S      0:00 [cpuhp/0]
   13 ?        S      0:00 [kdevtmpfs]
   14 ?        I<     0:00 [netns]
   15 ?        S      0:00 [rcu_tasks_kthre]
   16 ?        S      0:00 [kauditd]
   17 ?        S      0:00 [xenbus]
   18 ?        S      0:00 [xenwatch]
   20 ?        S      0:01 [khungtaskd]
   21 ?        S      0:00 [oom_reaper]
   22 ?        I<     0:00 [writeback]
   23 ?        S      0:00 [kcompactd0]
   24 ?        SN     0:00 [ksmd]
   25 ?        I<     0:00 [crypto]
   26 ?        I<     0:00 [kintegrityd]
   27 ?        I<     0:00 [kblockd]
   28 ?        I<     0:00 [ata_sff]
   29 ?        I<     0:00 [md]
   30 ?        I<     0:00 [edac-poller]
   31 ?        I<     0:00 [devfreq_wq]
   32 ?        I<     0:00 [watchdogd]
   35 ?        S      0:31 [kswapd0]
   36 ?        S      0:00 [ecryptfs-kthrea]
   78 ?        I<     0:00 [kthrotld]
   79 ?        I<     0:00 [nvme-wq]
   80 ?        S      0:00 [scsi_eh_0]
   81 ?        I<     0:00 [scsi_tmf_0]
   82 ?        S      0:00 [scsi_eh_1]
   83 ?        I<     0:00 [scsi_tmf_1]
   88 ?        I<     0:00 [ipv6_addrconf]
   98 ?        I<     0:00 [kstrp]
   99 ?        I<     0:12 [kworker/0:1H]
  292 ?        I<     0:00 [raid5wq]
  343 ?        S      0:08 [jbd2/xvda1-8]
  344 ?        I<     0:00 [ext4-rsv-conver]
  410 ?        I<     0:00 [iscsi_eh]
  419 ?        I<     0:00 [ib-comp-wq]
  421 ?        I<     0:00 [ib_mcast]
  423 ?        I<     0:00 [ib_nl_sa_wq]
  424 ?        I<     0:00 [rdma_cm]
  429 ?        Ss     0:00 /sbin/lvmetad -f
  739 ?        Ss     0:08 /usr/sbin/cron -f
  740 ?        Ss     0:00 /usr/sbin/atd -f
  741 ?        Ssl    0:07 /usr/sbin/rsyslogd -n
  743 ?        Ssl    1:38 /usr/lib/accountsservice/accounts-daemon
  747 ?        Ssl    0:25 /usr/bin/lxcfs /var/lib/lxcfs/
  749 ?        Ss     0:06 /lib/systemd/systemd-logind
  757 ?        Ss     0:08 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
  772 ?        Ssl    0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
  781 ?        Ss     2:17 /sbin/iscsid
  782 ?        S<Ls   0:00 /sbin/iscsid
  812 ttyS0    Ss+    0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,38400,9600 ttyS0 vt220
  821 tty1     Ss+    0:00 /sbin/agetty -o -p -- \u --noclear tty1 linux
 1152 ?        S<     0:00 [loop1]
 1878 ?        S<     0:00 [loop3]
 1959 ?        Ssl    2:02 /snap/amazon-ssm-agent/2012/amazon-ssm-agent
 2558 ?        I<     0:00 [xfsalloc]
 2562 ?        I<     0:00 [xfs_mru_cache]
 3220 ?        Ss     0:00 /usr/sbin/uuidd --socket-activation
10207 ?        I      0:00 [kworker/0:1]
11742 ?        Ss     0:00 sshd: ubuntu [priv]
11744 ?        Ss     0:00 /lib/systemd/systemd --user
11745 ?        S      0:00 (sd-pam)
11857 ?        S      0:00 sshd: ubuntu@pts/0
11858 pts/0    Ss     0:00 -bash
12089 ?        I      0:00 [kworker/0:2]
13261 ?        I      0:00 [kworker/u30:3]
14567 ?        Ss     0:00 /usr/sbin/apache2 -k start
14570 ?        Sl     0:00 /usr/sbin/apache2 -k start
14571 ?        Sl     0:00 /usr/sbin/apache2 -k start
14637 ?        I      0:00 [kworker/u30:0]
14644 ?        I      0:00 [kworker/u30:1]
14655 pts/0    R+     0:00 ps -ax
16246 ?        Ss     0:10 /lib/systemd/systemd-udevd
23046 ?        S<     0:00 [loop0]
27060 ?        Ss     0:24 /usr/sbin/sshd -D
27305 ?        Ss     0:08 /lib/systemd/systemd-networkd
27320 ?        Ss     0:09 /lib/systemd/systemd-resolved
27326 ?        Ssl    0:06 /lib/systemd/systemd-timesyncd
27349 ?        S<s    0:37 /lib/systemd/systemd-journald
28413 ?        S<     0:00 [loop2]
28442 ?        Ssl    0:30 /usr/lib/snapd/snapd
28593 ?        Ssl    0:03 /usr/lib/policykit-1/polkitd --no-debug
ubuntu@ip-172-26-13-218