#!/usr/bin/env perl
use strict;
$^W=1;

my $prj = 'dosepsbin';
my $infile = "$prj.pl";
my $acfile = 'configure.ac';
my $ltxfile = "$prj.ltx";
my $readmefile = 'README';
my $datefile = 'date-version.txt';
my $tmpfile = "version.tmp";

my $date = '';
my $version = '';
my $copyright_years = '';
my $pl_date_version = '';

open(IN, '<', $infile) or die "!!! Error: Cannot open `$infile'!\n";
while (<IN>) {
    if (/my \$date\s*=\s*'([0-9\/]+)'/) {
        $date = $1;
        next;
    }
    if (/my \$version\s*=\s*'([0-9\.]+)'/) {
        $version = $1;
        next;
    }
    if (/my \$copyright\s*=\s*"Copyright (.*) \$author"/) {
        $copyright_years = $1;
        next;
    }
    if (/^(\d{4}-\d{2}-\d{2} v\d+\.\d+)\s*$/) {
        $pl_date_version = $1;
        next;
    }
}

$date or die "!!! Error: Date not found!\n";
$version or die "!!! Error: Version not found!\n";
$copyright_years or die "!!! Error: Copyright years not found!\n";
my $isodate = $date;
$isodate =~ s|/|-|g;
my $date_version = "$isodate v$version";
$pl_date_version or die "!!! Error: VERSION/POD not found!\n";
$pl_date_version eq $date_version or die "!!! Error: Fix VERSION in pod section!\n";

open(OUT, '>', $tmpfile) or die "!!! Error: Cannot open `$tmpfile'!\n";
open(IN, '<', $acfile) or die "!!! Error: Cannot open `$acfile'!\n";
my $found = 0;
my $update = 0;
while (<IN>) {
    if (/^(dnl Copyright )(.*)( by .*)$/) {
        $found |= 1;
        $_ = "$1$copyright_years$3\n";
        $update = 1 unless $2 eq $copyright_years;
    }
    if (/^(AC_INIT\(dosepsbin, )([^,]*)(,.*|\).*)$/) {
        $found |= 2;
        $_ = "$1$version$3\n";
        $update = 1 unless $2 eq $version;
    }
    print OUT;
}
die "!!! Error: COPYRIGHT or AC_INIT line not found!\n" unless $found = 3;
unlink $acfile or die "!!! Error: Cannot delete `$acfile'!\n";
rename $tmpfile, $acfile
        or die "!!! Error: Cannot rename `$tmpfile' to `$acfile'!\n";
print "--> `$acfile' updated\n" if $update;

open(OUT, '>', $tmpfile) or die "!!! Error: Cannot open `$tmpfile'!\n";
open(IN, '<', $ltxfile) or die "!!! Error: Cannot open `$ltxfile'!\n";
$found = 0;
$update = 0;
while (<IN>) {
    if (/^(% Copyright )(.*)( by .*)$/) {
        $found |= 1;
        $_ = "$1$copyright_years$3\n";
        $update = 1 unless $2 eq $copyright_years;
    }
    if (/^(\\providecommand\*{\\DATE}{)(.*)(})$/) {
        $found |= 2;
        $_ = "$1$date$3\n";
        $update = 1 unless $2 eq $date;
    }
    if (/^(\\providecommand\*{\\VERSION}{)(.*)(})$/) {
        $found |= 4;
        $_ = "$1$version$3\n";
        $update = 1 unless $2 eq $version;
    }
    print OUT;
}
close(IN);
close(OUT);
die "!!! Error: COPYRIGHT or DATE or VERSION line not found!\n"
        unless $found == 7;
unlink $ltxfile or die "!!! Error: Cannot delete `$ltxfile'!\n";
rename $tmpfile, $ltxfile
        or die "!!! Error: Cannot rename `$tmpfile' to `$ltxfile'!\n";
print "--> `$ltxfile' updated\n" if $update;

open(OUT, '>', $tmpfile) or die "!!! Error: Cannot open `$tmpfile'!\n";
open(IN, '<', $readmefile) or die "!!! Error: Cannot open `$readmefile'!\n";
$found = 0;
$update = 0;
while (<IN>) {
    if (/^(Copyright )(.*)( by .*)$/) {
        $found |= 1;
        $_ = "$1$copyright_years$3\n";
        $update = 1 unless $2 eq $copyright_years;
    }
    if (/^(README for dosepsbin )([0-9\/]+) v([0-9\.]+)$/) {
        $found |= 2;
        $_ = "$1$date v$version\n";
        $update = 1 unless $2 eq $date and $3 eq $version;
    }
    print OUT;
}
close(IN);
close(OUT);
die "!!! Error: COPYRIGHT or DATE/VERSION line not found!\n"
        unless $found == 3;
unlink $readmefile or die "!!! Error: Cannot delete `$readmefile'!\n";
rename $tmpfile, $readmefile
        or die "!!! Error: Cannot rename `$tmpfile' to `$readmefile'!\n";
print "--> `$readmefile' updated.\n" if $update;

my $old_date_version = '';
if (-f $datefile) {
    open(IN, '<', $datefile) or die "!!! Error: Cannot open `$datefile'!\n";
    my @lines = <IN>;
    $old_date_version = "@lines";
    close(IN);
}
if ($old_date_version eq $date_version) {
    # print "--> `$datefile' is already uptodate.\n";
}
else {
    open(OUT, '>', $datefile) or die "!!! Error: Cannot open `$datefile'!\n";
    print OUT $date_version;
    close(OUT);
    print "--> `$datefile' updated.\n";
}

1;
__END__
