open (FH, $ARGV[0]);

# remove everything between don't() and do()
undef $/;
my $total=0;
while (<FH>) {
    s/don\'t\(\).*?do\(\)//gs;
    s/don\'t\(\).*?$//gs;
#    print "$_\n";
    foreach ($_ =~ /mul\((\d{1,3},\d{1,3})\)/g) {
	#print "$_\n";
	if ($_  =~ /(\d{1,3}),(\d{1,3})/) {
	    print "$1 $2\n";
	    $total += $1 * $2;
	}
    }

}

print "total = $total\n";
