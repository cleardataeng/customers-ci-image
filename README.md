Customers-CI Image
=====
## Based on Ubuntu 20.04 (Focal)

Docker image specifically designed for quicker deploys:
* skips routine apt updates and installs
* preloaded with common tools
  * awscli
  * aws-sudo
  * python3.8.x
  * pip3
* python modules for sub-projects found in requirements.txt
* use of sub-tree for aws-sudo used to maintain sync with that project.
-----
