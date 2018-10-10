Singularity
===========

This file here will be the most comprehensive of Mike's docs on singularity.
/home/mlake/singularities/README_singularity.md

The following docs will be smaller versions for specific use cases:  
<https://hpc.research.uts.edu.au/software_general/singularity/> for HPCC users,  
/home/mlake/git/singularity_tutorial/ for an eResearch Tutorial.

See also on Mike's laptop under /home/mlake/: 

  - `singularities/gromacs_2018/README_gromacs_example.md` 
  - `git/hpc_users/content/software_general/singularity.md` - documentation for HPC users (link above)
  - `git/Singularity-Tutorial` - tutorial from <https://github.com/NIH-HPC/Singularity-Tutorial.git>
  - `git/singularity` - source code from <https://github.com/singularityware/singularity.git>
  

TODO
----

/etc/localtime
/usr/share/zoneinfo/Australia/Sydney

Files
-----

centos6.def
centos7_full.def
centos7.img
centos7_small.def
debian.def
lowfat.def

alfpark-linpack-master-latest.simg
vsoch-hello-world-master-latest.simg


Building
--------
    
    singularity help build

 - download and assemble existing containers from external resources like Singularity Hub and Docker Hub
 - create a container from scratch and customized it to fit your needs.

    Bootstrap: shub | docker | yum | debootstrap | localimage


Running
-------

## An interesting installer

Packages up 

    $ singularity inspect GodloveD-lolcow-installer-master-latest.simg
    $ singularity inspect --deffile GodloveD-lolcow-installer-master-latest.simg

GodloveD-lolcow-installer-master.simg

This will install to /home/mlake/lolcow

    $ sudo singularity run shub://GodloveD/lolcow-installer

## Basic 


    $ singularity build lolcow.simg shub://GodloveD/lolcow
    Cache folder set to /home/mikel/.singularity/shub
    Progress |===================================| 100.0%
    Building from local image: /home/mikel/.singularity/shub/GodloveD-lolcow-master.simg
    WARNING: Building container as an unprivileged user. If you run this container as root
    WARNING: it may be missing some functionality.
    Building Singularity image...
    Singularity container built: lolcow.simg
    Cleaning up...
    $

WHY ??

$ singularity build lolcow.simg lowfat.def
Building into existing container: lolcow.simg
Using container recipe deffile: lowfat.def
ERROR: You must be the root user to build from a definition file


$ sudo /usr/local/bin/singularity build lolcow.simg lowfat.def
lots ...
....


Install
-------

For example, here is how to download version 2.3.1 and install:

    VERSION=2.4
    wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
    tar xvf singularity-$VERSION.tar.gz
    cd singularity-$VERSION
    ./configure --prefix=/opt/singularity-$VERSION
    make
    sudo make install

The configuration file will be here:

    /opt/singularity-2.4/etc/singularity/singularity.conf

On Mikes laptop singularity is installed to `/opt/singularity-2.4/` and there is a
symlink `/usr/local/bin/singularity -> /opt/singularity/bin/singularity`

To build images you also need squashfs-tools to build singularity images amd 
debootstrap.noarch to build any Debian images.

shell

singularity works if you specify the home directory as an argument:

    $ singularity shell -H $PWD:/srv debian-stretch.simg


FAQ
---

FAQ <http://singularity.lbl.gov/faq>

Do you need administrator privileges to use Singularity?

> If you have a container (whether Singularity or Docker) ready to go, you can
> run/shell/import without root access.
>
> If you want to build a new Singularity container image from scratch it must be
> built and configured on a host where you have root access (this can be a
> physical system or on a VM). And of course once the container image has been
> configured it can be used on a system where you do not have root access as long
> as Singularity has been installed there.

Can Singularity support daemon processes?

> If you spin up a process daemon, it will exist on your host’s network. 
> This means you can run a web server, or any other daemon, from within 
> a container and access it directly from your host.


## Docker

Pulling Docker images reduces reproducibility.
https://www.sylabs.io/guides/3.0/user-guide/quick_start.html

Mikes Notes
-----------

 - Compressed immutable images: By default the build command now creates
   compressed read only containers using squashfs

 - Build Bases: Singularity now supports building additional base targets: 
   local images, Singularity Hub, or the host operating system itself.

 - SCI-F: A well documented solution for internal container modularity
   (<http://containers-ftw.org/SCI-F/>)

 - Instances: By popular demand and bribery, we are bringing back persistent
   instance support. You can now start up a container instance and using a
   given name, you can connect to that instance, and it keeps running even when
   you exit!

 - Persistent overlays: Using a persistent overlay, you can modify a container
   image and all changes are written to the overlay layer

Paths: /home, /tmp and /var/tmp are automatically shared into the container.
To create custom mounts at runtime, you should use the -B or --bind argument:

    $ singularity run --bind /home/vanessa/Desktop:/data container.img

On the cluster: `/opt/singularity-2.4/etc/singularity/singularity.conf`

    bind path = /opt
    bind path = /scratch
    bind path = /shared



References
----------

Singularity Home Page at <http://singularity.lbl.gov>

Singularity User Guide at <http://singularity.lbl.gov/user-guide> and 
FAQ <http://singularity.lbl.gov/faq>

Pulling Docker images reduces reproducibility.
<http://singularity.lbl.gov/quickstart>

There are also some good articles on other sites with help on using singularity
which are listed below. **Note** that some of these cover the older singularity version 2.2 or 
are written for Debian based distributions. Read the current Singularity User Guide.

High-Performance Computing at the NIH: 
<https://hpc.nih.gov/apps/singularity.html>

Case Western Reserve University: 
<https://sites.google.com/a/case.edu/hpc-upgraded-cluster/home/Software-Guide/singularity>   
See the section "Installing Singularity & Managing Image in Your PC (Linux)"

A tutorial at Github, "Creating and running software containers with Singularity":  
<https://github.com/NIH-HPC/Singularity-Tutorial>

PDF presentation at the HPC Developer Conference:  
<https://wilsonweb.fnal.gov/slides/hpc-containers-singularity-introductory.pdf>

Singularity Container Registry
<https://singularity-hub.org>
<http://singularity.lbl.gov/singularity-registry>


