#! /bin/env perl

use strict;

my %perfect_block;
open (PERF, "$ARGV[0]") or die $!;
while (<PERF>) {
    if (/^BLOCK/) {
        my @block_id = split(/\s+/);
        my $block_id = $block_id[2] . "--" . $block_id[12]; 
        my $line = <PERF>;
        chomp($line);
        while (1) {
            last if ($line =~ /^perfect/ || $line =~ /^$/);
            my ($left, $right, $id, $pos, $left_b, $right_b) = (split(/\t/, $line))[1,2,3,4,5,6];
            die "wrong perfect block! on $id of $block_id !!\n" if (exists $perfect_block{$id}{$block_id} && $perfect_block{$id}{$block_id}{"type"} ne $left);
            $perfect_block{$id}{$block_id}{"type"} = $left;
            $perfect_block{$id}{$block_id}{$pos} = "M";
            $line = <PERF>;
        }
        last if ($line =~ /^perfect/);
    }
}
close(PERF);
print STDERR "file1 done.\n";

my %mark_bases;
open(BLOC, "$ARGV[1]") or die $!;
while(<BLOC>) {
    if (/^BLOCK/) {
        my @block_id = split(/\s+/);
        my $block_id = $block_id[2] . "--" . $block_id[12]; 
        my $line = <BLOC>;
        chomp($line);
        my $last_pos = 0;
        while (1) {
            last if ($line =~ /^\*\*\*/);
            last unless $line;
            my ($left, $right, $id, $pos, $left_b, $right_b) = (split(/\t/, $line))[1,2,3,4,5,6];
            last if (not exists $perfect_block{$id}{$block_id});
            if (not exists $perfect_block{$id}{$block_id}{$pos}) {
                if ($left != $perfect_block{$id}{$block_id}{"type"}) {
                    $perfect_block{$id}{$block_id}{$pos} = "s";
                    $mark_bases{$id}{$block_id}{$pos} = $left_b . $left_b;
                }
                else {
                     $perfect_block{$id}{$block_id}{$pos} = "m";
                     $mark_bases{$id}{$block_id}{$pos} = $left_b . $right_b;
                }
            }
            else {
                $mark_bases{$id}{$block_id}{$pos} = $left_b . $right_b;
            }
            if ($last_pos != 0) {
                for ($last_pos+1 .. $pos-1) {
                     $perfect_block{$id}{$block_id}{$_} = "+";
                }
            }
            $last_pos = $pos;
            $line = <BLOC>;
        }
        last unless $line;
    }
}
close(BLOC);
print STDERR "file2 done.\n";

my (@ref_seq, @x_ref, @y_ref, @marks);
my $former_id;
my $former_pos = 0;
my $now_block;

open (VCF, "$ARGV[2]") or die $!;
while (<VCF>) {
    next if (/^\#/);
    my ($id,$pos,$ref,$alt,$qual,$info,$str) = (split(/\t/))[0,1,3,4,5,7,9];
    next if (scalar(keys %{$perfect_block{$id}}) == 0);
    if ($id ne $former_id) {
        print ">$former_id\_ref\n";
        my $tmp_seq = join("", @ref_seq);
        print $tmp_seq,"\n>$former_id\_X\n";
        $tmp_seq = join("", @x_ref);
        print $tmp_seq,"\n>$former_id\_Y\n";
        $tmp_seq = join("", @y_ref);
        print $tmp_seq,"\n>$former_id\_Marks\n";
        $tmp_seq = join("", @marks);
        print $tmp_seq,"\n\n";
        @marks = ();
        @ref_seq = ();
        @x_ref = ();
        @y_ref = ();

        $former_id = $id;
        die "not from pos 1 in line $. : $pos\n" if ($pos != 1);
        $former_pos = $pos;
        if ($alt eq '.') {
            foreach (keys %{$perfect_block{$id}}) {
                die "$id, $_ on $pos error!" if (exists $perfect_block{$id}{$_}{$pos}  &&  ($perfect_block{$id}{$_}{$pos} eq "M" || $perfect_block{$id}{$_}{$pos} eq "m" || $perfect_block{$id}{$_}{$pos} eq "s"));
            }
            if ($qual < 60) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            my $dp = (split(/:/, $str))[1];
            if ($dp < 10) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            push @ref_seq, $ref;
            push @x_ref, $ref;
            push @y_ref, $ref;
            if (exists $perfect_block{$id}{$now_block}{$pos}) {
                push @marks,  $perfect_block{$id}{$now_block}{$pos};
            }
            else {
                push @marks, "-";
            }
        }
        else {
            foreach (keys %{$perfect_block{$id}}) {
                if (exists $perfect_block{$id}{$_}{$pos}) {
                    $now_block = $_;
                }
            }
            if ($qual < 60) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            my ($dp,$gq) = (split(/:/, $str))[2,3];
            if ($dp < 10 || $gq < 30) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            if (exists $mark_bases{$id}{$now_block}{$pos}) {
                my @markbases = split(//, $mark_bases{$id}{$now_block}{$pos});
                push @ref_seq, $ref;
                push @x_ref, $markbases[0];
                push @y_ref, $markbases[1];
                push @marks,  $perfect_block{$id}{$now_block}{$pos};
                next;
            }
            push @ref_seq, $ref;
            push @x_ref, $ref;
            push @y_ref, $ref;
            if (exists $perfect_block{$id}{$now_block}{$pos}) {
                push @marks,  $perfect_block{$id}{$now_block}{$pos};
            }
            else {
                push @marks, "-";
            }
        } 
    }
    else {
        if ($pos - $former_pos != 1) {
            print STDERR "not continusely in line $. : $pos of $id \n"; 
            for ($former_pos+1 .. $pos-1) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$_}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$_};
                }
                else {
                    push @marks, "-";
                }
            }
        }
        $former_pos = $pos;
        $former_id = $id;
        if ($alt eq '.') {
            foreach (keys %{$perfect_block{$id}}) {
                die "$id, $_ on $pos error!" if (exists $perfect_block{$id}{$_}{$pos}  &&  ($perfect_block{$id}{$_}{$pos} eq "M" || $perfect_block{$id}{$_}{$pos} eq "m" || $perfect_block{$id}{$_}{$pos} eq "s"));
            }
            if ($qual < 60) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            my $dp = (split(/:/, $str))[1];
            if ($dp < 10) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            push @ref_seq, $ref;
            push @x_ref, $ref;
            push @y_ref, $ref;
            if (exists $perfect_block{$id}{$now_block}{$pos}) {
                push @marks,  $perfect_block{$id}{$now_block}{$pos};
            }
            else {
                push @marks, "-";
            }
        }
        else {
            foreach (keys %{$perfect_block{$id}}) {
                if (exists $perfect_block{$id}{$_}{$pos}) {
                    $now_block = $_;
                }
            }
            if ($qual < 60) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            my ($dp,$gq) = (split(/:/, $str))[2,3];
            if ($dp < 10 || $gq < 30) {
                push @ref_seq, $ref;
                push @x_ref, "n";
                push @y_ref, "n";
                if (exists $perfect_block{$id}{$now_block}{$pos}) {
                    push @marks,  $perfect_block{$id}{$now_block}{$pos};
                }
                else {
                    push @marks, "-";
                }
                next;
            }
            if (exists $mark_bases{$id}{$now_block}{$pos}) {
                my @markbases = split(//, $mark_bases{$id}{$now_block}{$pos});
                push @ref_seq, $ref;
                push @x_ref, $markbases[0];
                push @y_ref, $markbases[1];
                push @marks,  $perfect_block{$id}{$now_block}{$pos};
                next;
            }
            push @ref_seq, $ref;
            push @x_ref, $ref;
            push @y_ref, $ref;
            if (exists $perfect_block{$id}{$now_block}{$pos}) {
                push @marks,  $perfect_block{$id}{$now_block}{$pos};
            }
            else {
                push @marks, "-";
            }
        } 
    }
}
