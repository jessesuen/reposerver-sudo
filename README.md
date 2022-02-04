# Sudo Experiment

Experiment with sudoers to read/write files as different users using a delegate reposerver user
who is non-root but has sudo privileges to other users.

1. build reposerver image

```
docker build . -t reposerver-sudo
```

2. shell into reposerver-sudo container

```
docker run -it -rm reposerver-sudo
```

3. clone repo as user1 and user2

```
sudo -u user1 git clone https://github.com/kelseyhightower/nocode.git /tmp/user1-nocode
sudo -u user2 git clone https://github.com/kelseyhightower/nocode.git /tmp/user2-nocode
```

4. Observe permissions

```
reposerver@d096d92775af:/$ ls -l /tmp/
total 8
drwx------ 3 user1 git 4096 Feb  4 08:58 user1-nocode
drwx------ 3 user2 git 4096 Feb  4 08:58 user2-nocode
```
