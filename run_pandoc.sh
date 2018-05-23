#!/bin/bash

pandoc -o README.html README.md
pandoc -s -H singularity_mikes.css -o singularity_mikes.html --smart --toc singularity_mikes.md

