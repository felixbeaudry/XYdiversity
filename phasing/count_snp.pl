#! /bin/env perl

use strict;
use Bio::SeqIO;

foreach my $file (@ARGV) {
    my $fastaobj = Bio::SeqIO->new( -file => "$file");
    my %allseq;
    while (my $seqobj = $fastaobj->next_seq) {
        if ($seqobj->id =~ /_ref$/) {
            @{$allseq{"ref"}} = split(//, $seqobj->seq);
        }
        else {
            @{$allseq{$seqobj->id}} = split(//, $seqobj->seq);
        }
    }
    for ( 0 .. $#{$allseq{"ref"}} ) {
         my %fi_count;
         foreach my $seqid (keys %allseq) {
             if ($seqid =~ /_X$/) {
                 $fi_count{"X"}{$allseq{$seqid}->[$_]}++;
                 $fi_count{"A"}{$allseq{$seqid}->[$_]}++;
             }
             elsif ($seqid =~ /_Y$/) {
                 $fi_count{"Y"}{$allseq{$seqid}->[$_]}++;
                 $fi_count{"A"}{$allseq{$seqid}->[$_]}++;
             }
             elsif ($seqid ne "ref") {
                 die $seqid, " error on ", $file,"\n";
             }
         }
         if ( scalar(keys %{$fi_count{"A"}}) > 1) {
             my $pos = $_ + 1;
             print $file,"\t",$pos,"\t1";
             if (scalar(keys %{$fi_count{"X"}}) > 1) {
                 print "\t1";
             }
             elsif (scalar(keys %{$fi_count{"X"}}) == 1) {
                 print "\t0";
             }
             else {
                 die "no X found?\n";
             }

             if (scalar(keys %{$fi_count{"Y"}}) > 1) {
                 print "\t1";
             }
             elsif (scalar(keys %{$fi_count{"Y"}}) == 1) {
                 print "\t0";
             }
             else {
                 die "no Y found?\n";
             }
             print "\n";
         }
    }
}
