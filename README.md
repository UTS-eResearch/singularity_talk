# Singularity Talk

This contains slides for a short talk on singularity. 
See also the tutorial for HPC users at 
<https://hpc.research.uts.edu.au/software_general/singularity/> 

## Files

  - singularity_slides.html - The HTML tutorial as "Reveal" slides. I'm using Markdown within the slides.
  - singularity_slides.css  - CSS to overide `reveal.js/css/` styles.
  - centos7.def             - An example Singularity recipe 

## Reveal.js Framework 

I am using the reveal.js HTML presentation framework, a demo of which can be seen at 
its homepage <https://revealjs.com>.
To use this you need to clone its GIT repo into a local directory as its not
included in this repo. Be in the same directory as this README.md and do:

    $ git clone https://github.com/hakimel/reveal.js.git
    
This will have created the directory `reveal.js`. The links in the `singularity_slides.html` 
file reference files in this directory.  

## Creating a PDF of these Slides

The Javascript library `decktape` needs to be installed first. See below. 
After that just make sure your in the `singularity_talk` directory and do this:

    $ `npm bin`/decktape reveal http://localhost/~mlake/singularity_talk/singularity_slides.html test.pdf

## Install Required Javascript Libs

Install node.js

    $ cd reveal.js
    reveal.js/$ npm install
    Downloading binary from https://github.com/sass/node-sass/releases/download/v4.7.2/linux-x64-48_binding.node
    Caching binary to /home/mlake/.npm/node-sass/4.7.2/linux-x64-48_binding.node
    ....

Install decktape for Creating PDFs:

    singularity_talk/$ npm install decktape
    singularity_talk/$ `npm bin`/decktape

Install highlight.js for syntax highlighting:

    singularity_talk/$ npm install highlight.js


Mike Lake  
October 2018

