This is an (early) work in progress docker of NBMiner from https://github.com/NebuTech/NBMiner.

I am currently running this on UnRaid (on 6.9RC1) with --runtime=nvidia and the usage and CMD options the same as the standalone version of the miner.

To do:

 - amend the Dockerfile to allow for rolling updates
 - provide for environmental variables rather than manual input of algo and pool options
 - compile an UnRaid template
 
 Docker Hub link: https://hub.docker.com/r/akkipro27/docker_nbminer_cuda11
