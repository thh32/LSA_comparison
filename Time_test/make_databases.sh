#!/bin/sh

./bin/prerapsearch -d Database_fasta.fa -n RAPsearch2_db
./bin/diamond makedb --in Database_fasta.fa -d DIAMOND_db
./bin/makeblastdb -in Database_fasta.fa -parse_seqids -dbtype prot -out BLAST_db
