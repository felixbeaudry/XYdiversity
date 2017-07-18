#! /bin/env perl

use strict;
my %final_seq;
my @strains;

foreach (@ARGV) {
    open (SEQ, "$_") or die $!;
    my $strain = $_;
    $strain =~ s/_phasedXY.fasta//;
    push @strains, $strain;
    while (my $line = <SEQ>) {
        chomp($line);
        my $seqid = $line;
        $seqid =~ s/>//;
        $seqid =~ s/_ref//;
        my ($strt, $stop) = (split(/__/, $seqid))[2,3];
        $strt--;
        $stop = $stop - $strt;
        $line = <SEQ>;
        chomp($line);
        $final_seq{$seqid}{'_ref'} = substr($line, $strt, $stop);
        $line = <SEQ>; $line = <SEQ>;
        $final_seq{$seqid}{"$strain\_X"} = substr($line, $strt, $stop);
        $line = <SEQ>; $line = <SEQ>;
        $final_seq{$seqid}{"$strain\_Y"} = substr($line, $strt, $stop);
        $line = <SEQ>; $line = <SEQ>; $line = <SEQ>;
    }
}

foreach my $seqid (keys %final_seq) {
    open (FASTA, ">./genes/$seqid\.fasta") or die $!;
    print FASTA ">$seqid\_ref\n";
    print FASTA $final_seq{$seqid}{'_ref'},"\n";
    foreach my $strain (@strains) {
        print FASTA ">$strain\_X\n";
        print FASTA $final_seq{$seqid}{"$strain\_X"},"\n";
        print FASTA ">$strain\_Y\n";
        print FASTA $final_seq{$seqid}{"$strain\_Y"},"\n";
    }
}
