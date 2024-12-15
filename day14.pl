open (FH, $ARGV[0]);

while (my $w = <FH>) {
    #print "<$w>\n";

    if ($w =~ /p=(\d+),(\d+) v=(-?\d+),(-?\d+)/) {
	print "$1 $2 $3 $4\n";	
    }
    
}

