open (FH, $ARGV[0]);

my $total=0;
while (my $w = <FH>) {
   foreach ($w =~ /mul\((\d{1,3},\d{1,3})\)/g) {
       #print "$_\n";
       if ($_  =~ /(\d{1,3}),(\d{1,3})/) {
	   print "$1 $2\n";
	   $total += $1 * $2;
       }
   }
}

print "total = $total\n";
