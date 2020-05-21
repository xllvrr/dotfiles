#!/usr/bin/env perl
use strict;
$^W=1;

@ARGV == 2 or die "!!! Syntax: <input file> <output file>\n";

my $infile = $ARGV[0];
my $outfile = $ARGV[1];

open(IN, '<', $infile) or die "!!! Error: Cannot open `$infile'!\n";
open(OUT, '>', $outfile) or die "!!! Error: Cannot write `$outfile'!\n";
while (<IN>) {
    s/^(=head[1] [A-Z])(.*)/$1\L$2\E/;
    s/(L<"[A-Z])([^"]+)">/$1\L$2\E">/g;
    print OUT;
}
close(IN);
close(OUT);

__END__
