#!/bin/sh

QUERY=split-contigs.fa-1.fa

for i in `seq 1 3`; do
	echo "Running iteration: "$i;

	free && sync && echo 3 > /proc/sys/vm/drop_caches && free

	/usr/bin/time --verbose ./bin/usearch -ublast $QUERY -db Database_fasta.fa -fulldp -evalue 1 -blast6out USEARCH.output

	free && sync && echo 3 > /proc/sys/vm/drop_caches && free

	/usr/bin/time --verbose ./bin/swipe -d BLAST_db -i $QUERY -b 10000 -m 9 -o SWIPE.output

	free && sync && echo 3 > /proc/sys/vm/drop_caches && free

	/usr/bin/time --verbose ./bin/blastx -db BLAST_db -query $QUERY -num_alignments 10000 -outfmt 6 -out BLAST.ouput

	free && sync && echo 3 > /proc/sys/vm/drop_caches && free

	/usr/bin/time --verbose ./bin/diamond blastx -q $QUERY -d DIAMOND_db --max-target-seqs 10000 -a DIAMOND.output
	/usr/bin/time --verbose ./bin/diamond view -a DIAMOND.output.daa -o DIAMOND.output

	free && sync && echo 3 > /proc/sys/vm/drop_caches && free

	/usr/bin/time --verbose ./bin/rapsearch -q $QUERY -d RAPsearch2_db -o RAPSEARCH.output
done
