# Sudo Experiment

Experiment with sudoers to read/write files as different users using a delegate reposerver user
who is non-root but has sudo privileges to other users.

1. build reposerver image

```
docker build . -t jessesuen/reposerver-sudo:latest
docker push jessesuen/reposerver-sudo:latest
```

2. shell into reposerver-sudo container

```
kubectl run reposerver-sudo --image jessesuen/reposerver-sudo:latest -t -i --rm=true -- bash
```

3. clone repo as user1 and user2

```
sudo -u user1 git clone https://github.com/kelseyhightower/nocode.git /tmp/user1-nocode
sudo -u user2 git clone https://github.com/kelseyhightower/nocode.git /tmp/user2-nocode
```

4. Observe permissions

```
reposerver@reposerver-sudo:/$ ls -l /tmp/
total 8
drwx------ 3 user1 git 4096 Feb  4 09:13 user1-nocode
drwx------ 3 user2 git 4096 Feb  4 09:13 user2-nocode
```
