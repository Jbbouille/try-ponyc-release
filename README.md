# Pony Release Process
## Goal
* Be able to release a version of Pony compiler quickly and easily.
* Release ponyc more often.

## Release process
- There is a dedicated branch in ponyc repo for each major version of the compiler.
- Each time a commit is push on these branch it triggers a Travis job that try to build a version of ponyc for each *latest* linux OS families (archlinux, fedora, debian).
- Build are done in a docker in a container for Linux.
- If a commit with name `Pony Release X.X.X` is push on these branch it will build and release ponyc and push the packages on github release page.

## Next
* Do the same for windows and OS X but without the docker container.
* Push ponyc builded on OS repository (brew, chocolatey, nuget, apt, pacman, dnf).
* Try to build a ponyc version package for other platform I386, ARM ?