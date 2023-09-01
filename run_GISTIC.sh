source software/bashrc

cut -f 2-4 segmentationfile.txt | grep -w -v Chr | perl -lane 'print "p$F[0]_$F[1]\t$F[0]\t$F[1]";print "p$F[0]_$F[2]\t$F[0]\t$F[2]"'  |sort -k 2,2 -k 3n,3 | uniq >markersfile1

cut -f1,2 software/GISTIC2/GermlineHetPon.hg19.vcf|grep -v '#'|sed s/chr//g|awk '{print "p"$1"_"$2"\t"$1"\t"$2}'|sort -k 2,2 -k 3n,3 | uniq >markersfile2
cat markersfile1 markersfile2|sort -k 2,2 -k 3n,3 | uniq >markersfile.txt

mkdir `pwd`/result

software/GISTIC2/gistic2 -b `pwd`/result -seg  segmentationfile.txt -refgene software/GISTIC2/refgenefiles/hg19.mat -conf 0.95 -mk markersfile.txt -smallmem 1 -broad 1 -armpeel 1 -savegene 1 -gcm extreme
