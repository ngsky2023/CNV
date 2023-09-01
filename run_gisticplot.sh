source /share/Onc_KYproject/hanwj4457/analysis/project/bashrc
#input prepare
perl software/GISTIC2/gisticplot/pre-FigureFile.pl
#chrom arms level
Rscript software/GISTIC2/Scripts/Arm_plot.R
#chrom level
Rscript software/GISTIC2/Scripts/Chr_plot.R

Rscript software/GISTIC2/gisticplot/gisticChromPlot.R
