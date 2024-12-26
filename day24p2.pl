open (FH, $ARGV[0]);

print "digraph g {\n rankdir = \"LR\"\n";
while (my $w = <FH>) {
    #print "<$w>\n";

    if ($w =~ /(.*) (AND|XOR|OR) (.*) -> (.*)/) {
	#	print "$1 $2 $3 $4\n";
	print "$4 [ label = \"$2 : $4\"]\n";
	print "$1 -> $4\n";
	print "$3 -> $4\n";
	
    }
    
}
print "}\n";
