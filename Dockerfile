#author: Kristen N. Finch (finchnsnps)
#date: 20221012

#Dockerfile to create an R environment for mitochondrial haplotype processing following 
#a published workflow (Toparslan et al. 2020). 

#see published work: https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0243927#sec026

#The packages versions are listed in the manuscript; however, sessionInfo() was not shared 
#and many other package dependencies are needed for the full workflow to run, so I am 
#using the publishing date to select package versions.

#run with ubuntu
FROM ubuntu:18.04

RUN apt-get update

RUN apt install gdebi-core -y

RUN apt install curl -y

RUN apt install sudo -y

RUN yes | apt-get install git

RUN apt-get update

#install R

RUN curl -O https://cdn.rstudio.com/r/ubuntu-1804/pkgs/r-4.0.3_1_amd64.deb

RUN yes| DEBIAN_FRONTEND=noninteractive apt install /r-4.0.3_1_amd64.deb

#make symbolic links for R functions. 

RUN sudo ln -s /opt/R/4.0.3/bin/R /usr/local/bin/R

RUN sudo ln -s /opt/R/4.0.3/bin/Rscript /usr/local/bin/Rscript

#some of these are needed for certain R packages. 

RUN apt-get install libcairo2-dev -y

RUN apt-get install libx11-dev -y

RUN apt-get install xorg -y

RUN apt-get install libfreetype6-dev -y

RUN apt-get install mesa-common-dev -y

RUN apt-get install libglu1-mesa-dev -y

RUN apt-get install libudunits2-dev -y

RUN apt-get install libgdal-dev -y

#download R packages

RUN curl -O http://cran.nexr.com/src/contrib/Archive/phangorn/phangorn_2.3.1.tar.gz && curl -O http://cran.nexr.com/src/contrib/Archive/sp/sp_1.2-6.tar.gz && curl -O https://bioconductor.org/packages/3.15/bioc/src/contrib/Archive/Biostrings/Biostrings_2.64.0.tar.gz && curl -O https://bioconductor.org/packages/3.15/bioc/src/contrib/Archive/IRanges/IRanges_2.30.0.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/BiocGenerics_0.42.0.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/GenomeInfoDb_1.32.4.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/msa_1.28.0.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/S4Vectors_0.34.0.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/treeio_1.20.2.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/XVector_0.36.0.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/zlibbioc_1.42.0.tar.gz && curl -O https://bioconductor.org/packages/release/data/annotation/src/contrib/GenomeInfoDbData_1.2.8.tar.gz && curl -O https://bioconductor.org/packages/release/bioc/src/contrib/ggtree_3.4.4.tar.gz && curl -O https://cran.microsoft.com/snapshot/2016-08-05/src/contrib/Archive/e1071/e1071_1.6-6.tar.gz && curl -O https://cran.microsoft.com/snapshot/2017-04-21/src/contrib/Archive/segmented/segmented_0.5-1.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ade4/ade4_1.7-16.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/adegenet/adegenet_2.1.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/amap/amap_0.8-17.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ape/ape_5.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/aplot/aplot_0.0.6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/assertthat/assertthat_0.2.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/base64enc/base64enc_0.1-2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/BH/BH_1.72.0-3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/BiocManager/BiocManager_1.30.10.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/bitops/bitops_1.0-6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/brio/brio_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/callr/callr_3.5.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/classInt/classInt_0.4-3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/cli/cli_2.2.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/clusterGeneration/clusterGeneration_1.3.6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/coda/coda_0.19-3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/colorspace/colorspace_2.0-0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/commonmark/commonmark_1.7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/cpp11/cpp11_0.2.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/crayon/crayon_1.3.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/crosstalk/crosstalk_1.1.0.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/DBI/DBI_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/deldir/deldir_0.2-3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/desc/desc_1.2.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/diffobj/diffobj_0.3.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/digest/digest_0.6.27.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/dplyr/dplyr_1.0.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ellipsis/ellipsis_0.3.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ellipsis/ellipsis_0.3.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/evaluate/evaluate_0.14.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/expm/expm_0.999-5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/fansi/fansi_0.4.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/farver/farver_2.0.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/fastmap/fastmap_1.0.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/fastmatch/fastmatch_1.1-0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/gdata/gdata_2.18.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/generics/generics_0.1.0.tar.gz && curl -O https://cran.rstudio.com/src/contrib/ggfun_0.0.7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_3.3.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/glue/glue_1.4.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/gmodels/gmodels_2.18.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/gtable/gtable_0.3.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/gtools/gtools_3.8.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/highr/highr_0.8.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/hms/hms_0.5.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/htmltools/htmltools_0.5.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/htmlwidgets/htmlwidgets_1.5.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/httpuv/httpuv_1.5.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/igraph/igraph_1.2.6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ips/ips_0.0-7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/isoband/isoband_0.2.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/jsonlite/jsonlite_1.7.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/knitr/knitr_1.30.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/labeling/labeling_0.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/later/later_1.1.0.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/lazyeval/lazyeval_0.2.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/LearnBayes/LearnBayes_2.15.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/lifecycle/lifecycle_0.2.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/magrittr/magrittr_2.0.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/manipulateWidget/manipulateWidget_0.10.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/maps/maps_3.3.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/markdown/markdown_1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/mathjaxr/mathjaxr_1.0-1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/mime/mime_0.9.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/miniUI/miniUI_0.1.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/mnormt/mnormt_2.0.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/network/network_1.16.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/numDeriv/numDeriv_2016.8-1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/patchwork/patchwork_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/pegas/pegas_0.13.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/permute/permute_0.9-5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/phytools/phytools_0.7-70.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/pillar/pillar_1.4.7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/pixmap/pixmap_0.4-11.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/pkgbuild/pkgbuild_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/pkgconfig/pkgconfig_2.0.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/pkgload/pkgload_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/plotrix/plotrix_3.7-8.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/plyr/plyr_1.8.6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/prettyunits/prettyunits_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/processx/processx_3.4.5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/progress/progress_1.2.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/promises/promises_1.1.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/ps/ps_1.4.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/purrr/purrr_0.3.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/quadprog/quadprog_1.5-7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/R6/R6_2.5.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/raster/raster_3.4-5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/RColorBrewer/RColorBrewer_1.1-2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_1.0.5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/RCurl/RCurl_1.98-1.8.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rematch2/rematch2_2.1.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/reshape2/reshape2_1.4.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rgl/rgl_0.103.5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rgl/rgl_0.104.16.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rlang/rlang_0.4.9.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rprojroot/rprojroot_2.0.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rstudioapi/rstudioapi_0.13.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/rvcheck/rvcheck_0.1.8.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/scales/scales_1.1.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/scatterplot3d/scatterplot3d_0.3-41.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/seqinr/seqinr_4.2-4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/sf/sf_0.9-6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/shiny/shiny_1.5.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/sna/sna_2.6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/sourcetools/sourcetools_0.1.6.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/sp/sp_1.4-1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/spData/spData_0.3.8.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/spdep/spdep_1.1-5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/statnet.common/statnet.common_4.4.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/stringi/stringi_1.5.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/stringr/stringr_1.4.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/testthat/testthat_3.0.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/tibble/tibble_3.0.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/tibble/tibble_3.0.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/tidyr/tidyr_1.1.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/tidyselect/tidyselect_1.1.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/tidytree/tidytree_0.3.9.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/units/units_0.6-7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/utf8/utf8_1.1.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/vctrs/vctrs_0.3.5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/vegan/vegan_2.5-7.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/viridisLite/viridisLite_0.3.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/waldo/waldo_0.2.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/webshot/webshot_0.5.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/withr/withr_2.3.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/xfun/xfun_0.19.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/XML/XML_3.99-0.5.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/xtable/xtable_1.8-3.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/yaml/yaml_2.2.1.tar.gz && curl -O https://cran.r-project.org/src/contrib/Archive/yulab.utils/yulab.utils_0.0.4.tar.gz && curl -O https://cran.r-project.org/src/contrib/bios2mds_1.2.3.tar.gz && curl -O https://cran.r-project.org/src/contrib/combinat_0.0-8.tar.gz && curl -O https://cran.r-project.org/src/contrib/haplotypes_1.1.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/munsell_0.5.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/praise_1.0.0.tar.gz && curl -O https://cran.r-project.org/src/contrib/rle_0.9.2.tar.gz && curl -O https://cran.r-project.org/src/contrib/tmvnsim_1.0-2.tar.gz

#install R packages

RUN R CMD INSTALL BiocManager_1.30.10.tar.gz

#dependencies 'amap', 'e1071', 'scales', 'rgl' are not available for package bios2mds

RUN R CMD INSTALL amap_0.8-17.tar.gz && R CMD INSTALL e1071_1.6-6.tar.gz

#dependencies 'farver', 'labeling', 'lifecycle', 'munsell', 'R6', 'RColorBrewer', 'viridisLite' are not available for package 'scales'

#dependencies 'glue', 'rlang' are not available for package 'lifecycle'

RUN R CMD INSTALL farver_2.0.3.tar.gz && R CMD INSTALL labeling_0.3.tar.gz && R CMD INSTALL glue_1.4.2.tar.gz && R CMD INSTALL rlang_0.4.9.tar.gz && R CMD INSTALL lifecycle_0.2.0.tar.gz

#dependency 'colorspace' is not available for package 'munsell'

RUN R CMD INSTALL R6_2.5.0.tar.gz && R CMD INSTALL colorspace_2.0-0.tar.gz && R CMD INSTALL munsell_0.5.0.tar.gz && R CMD INSTALL RColorBrewer_1.1-2.tar.gz && R CMD INSTALL viridisLite_0.3.0.tar.gz && R CMD INSTALL scales_1.1.1.tar.gz

#dependencies 'htmlwidgets', 'htmltools', 'knitr', 'jsonlite', 'shiny', 'magrittr', 'crosstalk', 'manipulateWidget', 'mathjaxr' are not available for package 'rgl'

#dependencies 'htmltools', 'jsonlite', 'yaml' are not available for package 'htmlwidgets'

RUN R CMD INSTALL jsonlite_1.7.2.tar.gz && R CMD INSTALL yaml_2.2.1.tar.gz

#dependencies 'digest', 'base64enc', 'rlang' are not available for package 'htmltools'

RUN R CMD INSTALL digest_0.6.27.tar.gz && R CMD INSTALL base64enc_0.1-2.tar.gz && R CMD INSTALL htmltools_0.5.0.tar.gz && R CMD INSTALL htmlwidgets_1.5.2.tar.gz

#dependencies 'evaluate', 'highr', 'markdown', 'stringr', 'xfun' are not available for package 'knitr'

RUN R CMD INSTALL evaluate_0.14.tar.gz && R CMD INSTALL highr_0.8.tar.gz

#dependency 'mime' is not available for package 'markdown'

RUN R CMD INSTALL mime_0.9.tar.gz && R CMD INSTALL markdown_1.0.tar.gz && R CMD INSTALL xfun_0.19.tar.gz

#dependencies 'glue', 'magrittr', 'stringi' are not available for package 'stringr'

RUN R CMD INSTALL magrittr_2.0.1.tar.gz && R CMD INSTALL stringi_1.5.3.tar.gz && R CMD INSTALL stringr_1.4.0.tar.gz && R CMD INSTALL knitr_1.30.tar.gz

#dependencies 'httpuv', 'xtable', 'R6', 'sourcetools', 'later', 'promises', 'crayon', 'fastmap', 'withr', 'commonmark' are not available for package 'shiny'
RUN R CMD INSTALL Rcpp_1.0.5.tar.gz && R CMD INSTALL BH_1.72.0-3.tar.gz && R CMD INSTALL later_1.1.0.1.tar.gz && R CMD INSTALL promises_1.1.1.tar.gz

#dependencies 'Rcpp', 'promises', 'later', 'BH' are not available for package 'httpuv'
RUN R CMD INSTALL httpuv_1.5.4.tar.gz && R CMD INSTALL xtable_1.8-3.tar.gz && R CMD INSTALL sourcetools_0.1.6.tar.gz && R CMD INSTALL crayon_1.3.4.tar.gz && R CMD INSTALL fastmap_1.0.1.tar.gz && R CMD INSTALL withr_2.3.0.tar.gz && R CMD INSTALL commonmark_1.7.tar.gz && R CMD INSTALL shiny_1.5.0.tar.gz

#dependency 'lazyeval' is not available for package 'crosstalk'

RUN R CMD INSTALL lazyeval_0.2.1.tar.gz && R CMD INSTALL crosstalk_1.1.0.1.tar.gz

#dependencies 'miniUI', 'webshot' are not available for package 'manipulateWidget'

RUN R CMD INSTALL miniUI_0.1.1.tar.gz

#dependency 'callr' is not available for package 'webshot'

#dependency 'processx' is not available for package 'callr'

#dependency 'ps' is not available for package 'processx'

RUN R CMD INSTALL ps_1.4.0.tar.gz && R CMD INSTALL processx_3.4.5.tar.gz && R CMD INSTALL callr_3.5.1.tar.gz && R CMD INSTALL webshot_0.5.2.tar.gz && R CMD INSTALL manipulateWidget_0.10.1.tar.gz && R CMD INSTALL mathjaxr_1.0-1.tar.gz

#configure: error: X11 not found but required, configure aborted.
#ERROR: configuration failed for package 'rgl'

#configure: error: missing required header GL/gl.h
#ERROR: configuration failed for package 'rgl'

RUN R CMD INSTALL rgl_0.103.5.tar.gz && R CMD INSTALL rgl_0.104.16.tar.gz && R CMD INSTALL bios2mds_1.2.3.tar.gz

#dependencies 'ade4', 'igraph', 'ape', 'ggplot2', 'seqinr', 'spdep', 'reshape2', 'dplyr', 'vegan' are not available for package 'adegenet'

RUN R CMD INSTALL ape_5.3.tar.gz

#dependencies 'pixmap', 'sp', 'progress' are not available for package 'ade4'
#dependency 'pkgconfig' is not available for package 'igraph'
#dependencies 'gtable', 'isoband', 'tibble' are not available for package 'ggplot2'
#dependencies 'ade4', 'segmented' are not available for package 'seqinr'
#dependencies 'sp', 'spData', 'sf', 'deldir', 'LearnBayes', 'coda', 'expm', 'gmodels' are not available for package 'spdep'
#dependency 'plyr' is not available for package 'reshape2'
#dependencies 'ellipsis', 'generics', 'tibble', 'tidyselect', 'vctrs' are not available for package 'dplyr'
#dependency 'permute' is not available for package 'vegan'
#dependencies 'hms', 'prettyunits' are not available for package 'progress'
#dependency 'testthat' is not available for package 'isoband'
#dependencies 'cli', 'ellipsis', 'fansi', 'pillar', 'vctrs' are not available for package 'tibble'
#dependency 'raster' is not available for package 'spData'
#dependencies 'classInt', 'DBI', 'units' are not available for package 'sf
#dependency 'gdata' is not available for package 'gmodels'
#dependencies 'purrr', 'vctrs' are not available for package 'tidyselect'

RUN R CMD INSTALL pixmap_0.4-11.tar.gz && R CMD INSTALL sp_1.2-6.tar.gz && R CMD INSTALL pkgconfig_2.0.2.tar.gz && R CMD INSTALL gtable_0.3.0.tar.gz && R CMD INSTALL segmented_0.5-1.2.tar.gz && R CMD INSTALL deldir_0.2-3.tar.gz && R CMD INSTALL LearnBayes_2.15.tar.gz && R CMD INSTALL coda_0.19-3.tar.gz && R CMD INSTALL expm_0.999-5.tar.gz && R CMD INSTALL plyr_1.8.6.tar.gz && R CMD INSTALL ellipsis_0.3.1.tar.gz && R CMD INSTALL generics_0.1.0.tar.gz && R CMD INSTALL vctrs_0.3.5.tar.gz && R CMD INSTALL permute_0.9-5.tar.gz && R CMD INSTALL hms_0.5.3.tar.gz && R CMD INSTALL prettyunits_1.1.0.tar.gz && R CMD INSTALL ellipsis_0.3.1.tar.gz && R CMD INSTALL fansi_0.4.1.tar.gz

#package 'sp' 1.2.6 was found, but >= 1.4.1 is required by 'raster'

RUN R CMD INSTALL sp_1.4-1.tar.gz && R CMD INSTALL raster_3.4-5.tar.gz && R CMD INSTALL classInt_0.4-3.tar.gz && R CMD INSTALL DBI_1.1.0.tar.gz && R CMD INSTALL units_0.6-7.tar.gz

#--------------------------------------------------------------------------------
#  Configuration failed because libudunits2.so was not found. Try installing:
#    * deb: libudunits2-dev (Debian, Ubuntu, ...)
#    * rpm: udunits2-devel (Fedora, EPEL, ...)
#    * brew: udunits (OSX)
#  If udunits2 is already installed in a non-standard location, use:
#    --configure-args='--with-udunits2-lib=/usr/local/lib'
#  if the library was not found, and/or:
#    --configure-args='--with-udunits2-include=/usr/include/udunits2'
#  if the header was not found, replacing paths with appropriate values.
#  You can alternatively set UDUNITS2_INCLUDE and UDUNITS2_LIBS manually.
#--------------------------------------------------------------------------------
 
RUN R CMD INSTALL purrr_0.3.4.tar.gz && R CMD INSTALL tidyselect_1.1.0.tar.gz && R CMD INSTALL spData_0.3.8.tar.gz

#configure: error: gdal-config not found or not executable.
RUN R CMD INSTALL sf_0.9-6.tar.gz

#dependencies 'brio', 'cli', 'desc', 'pkgload', 'praise', 'waldo' are not available for package 'testthat'
#dependencies 'assertthat', 'fansi' are not available for package 'cli'
#dependencies 'cli', 'utf8' are not available for package 'pillar'

RUN R CMD INSTALL assertthat_0.2.0.tar.gz && R CMD INSTALL cli_2.2.0.tar.gz && R CMD INSTALL utf8_1.1.4.tar.gz && R CMD INSTALL pillar_1.4.7.tar.gz && R CMD INSTALL tibble_3.0.4.tar.gz && R CMD INSTALL progress_1.2.1.tar.gz && R CMD INSTALL ade4_1.7-16.tar.gz && R CMD INSTALL brio_1.1.0.tar.gz && R CMD INSTALL praise_1.0.0.tar.gz

#dependency 'rprojroot' is not available for package 'desc'
#dependencies 'desc', 'pkgbuild', 'rprojroot', 'rstudioapi' are not available for package 'pkgload'
#dependencies 'diffobj', 'rematch2' are not available for package 'waldo'

RUN R CMD INSTALL rprojroot_2.0.2.tar.gz && R CMD INSTALL desc_1.2.0.tar.gz && R CMD INSTALL pkgbuild_1.1.0.tar.gz && R CMD INSTALL rstudioapi_0.13.tar.gz && R CMD INSTALL diffobj_0.3.2.tar.gz && R CMD INSTALL rematch2_2.1.1.tar.gz && R CMD INSTALL pkgload_1.1.0.tar.gz && R CMD INSTALL waldo_0.2.3.tar.gz

RUN R CMD INSTALL testthat_3.0.0.tar.gz  && R CMD INSTALL pillar_1.4.7.tar.gz && R CMD INSTALL isoband_0.2.2.tar.gz

#dependency 'gtools' is not available for package 'gdata'
RUN R CMD INSTALL gtools_3.8.2.tar.gz && R CMD INSTALL gdata_2.18.0.tar.gz && R CMD INSTALL gmodels_2.18.1.tar.gz && R CMD INSTALL ggplot2_3.3.1.tar.gz && R CMD INSTALL igraph_1.2.6.tar.gz && R CMD INSTALL seqinr_4.2-4.tar.gz && R CMD INSTALL spdep_1.1-5.tar.gz && R CMD INSTALL reshape2_1.4.3.tar.gz && R CMD INSTALL dplyr_1.0.2.tar.gz && R CMD INSTALL vegan_2.5-7.tar.gz && R CMD INSTALL adegenet_2.1.3.tar.gz

#dependencies 'aplot', 'rvcheck', 'tidyr', 'tidytree', 'treeio' are not available for package 'ggtree'
#dependency 'patchwork' is not available for package 'aplot'
#dependency 'cpp11' is not available for package 'tidyr'
#dependency 'yulab.utils' is not available for package 'tidytree'

RUN R CMD INSTALL ggfun_0.0.7.tar.gz && R CMD INSTALL patchwork_1.1.0.tar.gz && R CMD INSTALL aplot_0.0.6.tar.gz && R CMD INSTALL rvcheck_0.1.8.tar.gz && R CMD INSTALL cpp11_0.2.4.tar.gz && R CMD INSTALL tidyr_1.1.2.tar.gz && R CMD INSTALL yulab.utils_0.0.4.tar.gz && R CMD INSTALL tidytree_0.3.9.tar.gz && R CMD INSTALL treeio_1.20.2.tar.gz && R CMD INSTALL ggtree_3.4.4.tar.gz

#dependencies 'network', 'sna', 'phangorn', 'plotrix' are not available for package 'haplotypes'
#dependency 'statnet.common' is not available for package 'sna'
#dependency 'rle' is not available for package 'statnet.common'
#dependencies 'quadprog', 'fastmatch' are not available for package 'phangorn'

RUN R CMD INSTALL network_1.16.1.tar.gz && R CMD INSTALL rle_0.9.2.tar.gz && R CMD INSTALL statnet.common_4.4.1.tar.gz && R CMD INSTALL sna_2.6.tar.gz && R CMD INSTALL quadprog_1.5-7.tar.gz && R CMD INSTALL fastmatch_1.1-0.tar.gz && R CMD INSTALL phangorn_2.3.1.tar.gz && R CMD INSTALL plotrix_3.7-8.tar.gz && R CMD INSTALL haplotypes_1.1.2.tar.gz && R CMD INSTALL pegas_0.13.tar.gz

#dependency 'XML' is not available for package 'ips'
#dependencies 'Biostrings', 'BiocGenerics', 'IRanges', 'S4Vectors' are not available for package 'msa'

RUN R CMD INSTALL XML_3.99-0.5.tar.gz && R CMD INSTALL ips_0.0-7.tar.gz

#dependencies 'BiocGenerics', 'S4Vectors', 'IRanges', 'XVector', 'GenomeInfoDb' are not available for package 'Biostrings'

#dependency 'S4Vectors' is not available for package 'IRanges'

RUN R CMD INSTALL BiocGenerics_0.42.0.tar.gz && R CMD INSTALL S4Vectors_0.34.0.tar.gz && R CMD INSTALL IRanges_2.30.0.tar.gz

#dependency 'zlibbioc' is not available for package 'XVector'
#dependencies 'RCurl', 'GenomeInfoDbData' are not available for package 'GenomeInfoDb'

RUN R CMD INSTALL zlibbioc_1.42.0.tar.gz && R CMD INSTALL XVector_0.36.0.tar.gz && R CMD INSTALL GenomeInfoDbData_1.2.8.tar.gz

#dependency 'bitops' is not available for package 'RCurl'

RUN R CMD INSTALL bitops_1.0-6.tar.gz && R CMD INSTALL RCurl_1.98-1.8.tar.gz && R CMD INSTALL GenomeInfoDb_1.32.4.tar.gz && R CMD INSTALL Biostrings_2.64.0.tar.gz && R CMD INSTALL msa_1.28.0.tar.gz

#dependencies 'maps', 'clusterGeneration', 'combinat', 'mnormt', 'numDeriv', 'scatterplot3d' are not available for package 'phytools'

RUN R CMD INSTALL maps_3.3.0.tar.gz && R CMD INSTALL clusterGeneration_1.3.6.tar.gz && R CMD INSTALL combinat_0.0-8.tar.gz && R CMD INSTALL numDeriv_2016.8-1.tar.gz && R CMD INSTALL scatterplot3d_0.3-41.tar.gz

#dependency 'tmvnsim' is not available for package 'mnormt'

RUN R CMD INSTALL tmvnsim_1.0-2.tar.gz && R CMD INSTALL mnormt_2.0.2.tar.gz && R CMD INSTALL phytools_0.7-70.tar.gz

RUN git clone https://github.com/finchnSNPs/Docker_Toparslan_wkflw.git

CMD ["/bin/bash"]
