# ssh-rsync-docker

A simple docker container which runs an sshd daemon for a single user with rsync enabled. 
For authentication, an ssh key is generated from environment variables.

Usage:

```
    docker run -p 22:2222 -e SSH_KEY=<ssh_public_key> kwarc/ssh-rsync 
```