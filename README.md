# Singularity Tutorial

This contains slides for a tutorial for a short course on using singularity 
and Mike's extensive notes on aspects of singularity..

See also the tutorial for HPC users at 
<https://hpc.research.uts.edu.au/software_general/singularity/> 

(The material here is derived from MATERIAL_TO_USE.md - as you incorporate that
remove it from that file.)

## Files

  - singularity_slides.html - The HTML tutorial as "Reveal" slides.
  - singularity_slides.css  - CSS to overide `reveal.js/css/` styles.
  - singularity_mikes.md - Mikes own detailed notes source. 
  - singularity_mikes.html - Mikes notes created by running `run_pandoc.sh` 
  - singularity_mikes.css - CSS for Mikes notes.
  - centos7.def - An example Singularity recipe that you can use as a base 
    for your own build of a Singularity container.

## Reveal.js Framework 

I am using the reveal.js HTML presentation framework, a demo of which can be seen at 
its homepage <https://revealjs.com>.
To use this you need to clone its GIT repo into a local directory as its not
included in this repo. Be in the same directory as this README.md and do:

    $ git clone https://github.com/hakimel/reveal.js.git
    
This will have created the directory `reveal.js`. The links in the `singularity_slides.html` 
file reference files in this directory.  

## Install node.js

    reveal.js/$ npm install
Downloading binary from https://github.com/sass/node-sass/releases/download/v4.7.2/linux-x64-48_binding.node
Download complete .] - :
Binary saved to /home/mlake/git/singularity_tutorial/reveal.js/node_modules/node-sass/vendor/linux-x64-48/binding.node
Caching binary to /home/mlake/.npm/node-sass/4.7.2/linux-x64-48_binding.node
....

Mike Lake  
April 2018

