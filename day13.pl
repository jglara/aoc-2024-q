open (FH, $ARGV[0]);

$/ = "\n\n";
while (my $w = <FH>) {
    #print "<$w>\n";

    if ($w =~ /Button A: X\+(\d+), Y\+(\d+)\nButton B: X\+(\d+), Y\+(\d+)\nPrize: X=(\d+), Y=(\d+).*/) {
	print "$1 $2 $3 $4 $5 $6\n";	
    }
    
}


