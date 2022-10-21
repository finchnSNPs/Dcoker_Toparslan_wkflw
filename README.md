# Docker_Toparslan_wkflw

Docker container constructed to run the R workflow for processing mitochondrial haplotypes following Toparslan et al. 2020. 

See the published work: https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0243927#sec026

The base operating system for this container is Ubuntu 18.04. As recommended by the publication, R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out" is available. 

Some R package versions are listed in the manuscript for the main tools used in the workflow; however, sessionInfo() was not shared in the R code and MANY other packages are needed for the full workflow to function. I recreated this to the best of my ability using the publication date to guide package versions that would have been available at the time the manuscript was released. Unfortunately, some packages that are not hosted under BiocManager/Bioconductor, the old source versions were not available. Luckily, new package versions (2022) and older package versions (2020 or older) do not seem to cause incompatibilities. The edited R code (Appendix S1 edited for use with the Docker container) works with provided test data. 

## Use with Docker

Download the Dockerfile

(you should also download Docker Desktop)

Create an image with the Dockerfile. Open terminal (or similar) and run the following:

`docker build -t toplarslan_wkflw .`

You must be inside of the directory containing the Dockerfile for this to work.

See image in you Docker Desktop app.

<img width="1263" alt="Screen Shot 2022-10-21 at 3 11 57 PM" src="https://user-images.githubusercontent.com/22206944/197296087-fa09fbf4-03f2-4d02-b4eb-3e9e9a008f45.png">

Click the RUN! button on the right side; name the container (optional).

<img width="1265" alt="Screen Shot 2022-10-21 at 3 13 32 PM" src="https://user-images.githubusercontent.com/22206944/197296231-eb5e8a77-4397-489b-9a0f-47158554d7d9.png">

Click the >_ button which will open the container in terminal.

Start R

`R`

Recommended:
Run the R code provided in this repository line by line to learn the workflow. 
Later, try the workflow with your own data. 

## Used with Singularity (Apptainer)

Download docker image to be run with singluarity.

`singularity pull toplarslan_wkflw.sif docker://finchnsnps/toparslan_wkflw:latest`

Open container as a shell with singularity.

`singularity shell --cleanenv toplarslan_wkflw.sif`

Start R

`R`
