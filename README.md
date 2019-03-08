# LSA_comparison
Files and scripts required to re-run the analysis described in the paper 'The BLAST and the spurious: Biases in genomic data propagate from heurstic local sequence alignment algorithms'.

Examples of the command for running each LSA are below;

swipe -d [DATABASE] -i [INPUT] -b 10000 -m 9 -p 2 -o [OUTPUT]

blastx -db [DATABASE] -query [QUERY] -num_alignments 10000 -outfmt 6 -out [OUTPUT]

usearch -ublast [INPUT] -db [DATABASE]  -fulldp -evalue 1 -blast6out [OUTPUT]

diamond blastx -q [INPUT] -d [DATABASE] --max-target-seqs 10000 -o [OUTPUT]

rapsearch -q [INPUT] -d [DATABASE] -o [OUTPUT]



Sotware versions;
diamond v0.7.0.49
blast-2.2.28
usearch v8.0.1517_i86linux32
SWIPE 2.0.5
RAPSearch/2.22
