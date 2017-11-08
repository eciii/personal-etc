# personal-etc
Personal configuration files

#### Some notes about usage workflow
To properly merge your local changes with the upstream changes follow these steps:
```
(0) $ git checkout -b local
(1) $ git --scope=<scope> update
(2) $ git add <files> && git commit
(3) $ git checkout master && git pull
(4) $ git checkout local && git rebase master
(5) $ git checkout master && git merge local
(6) $ git --scope=<scope> install
```
- (0) Create a local branch which will remain untracked. This step needs to be made ONLY ONCE.
- (1) Update the working tree with the current status of you configuration files.
- (2) Make as many commits as necessary in the local branch.
- (3) Pull the new upstream commits from the Git repository.
- (4) In the local branch rebase the new upstream commits with the local commits made in step 2.
- (5) Merge everything in the master branch.
- (6) Install the configuration files in your computer.
