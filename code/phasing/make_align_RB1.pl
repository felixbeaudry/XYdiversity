#! /bin/env perl

use strict;

foreach my $file (@ARGV) {
    unless ( -e "/cap1/wei.wang/Josh/cds_alignment/orth_cds/aln/$file") {
         print "$file not found\n";
        next;
    }
    open (ALN, "/cap1/wei.wang/Josh/cds_alignment/orth_cds/aln/$file") or die "$file not found\n";
    my $line;
    my @gapseq;
    my $id;
    while ($line = <ALN>) {
        $line = <ALN>;
        chomp($line);
        @gapseq = split(//, $line);
        $id = <ALN>;
        $line = <ALN>;
        last;
    }
    open (OUF, ">../genes_align_rb1/$file") or die $!;
    print OUF $id;
    print OUF $line;
    open (INF, "$file") or die $!;
    while ($line = <INF>) {
        print OUF $line;
        $line = <INF>;
        chomp($line);
        my @nogapseq = split(//, $line);
        for (0 .. $#gapseq) {
            if ($gapseq[$_] eq '-') {
                splice(@nogapseq, $_, 0 , '-'); 
            }
        }
        print OUF join('', @nogapseq);
        print OUF "\n";
    }
}
