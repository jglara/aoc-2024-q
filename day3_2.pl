open (FH, $ARGV[0]);

# remove everything between don't() and do()
undef $/;
my $total=0;
while (<FH>) {
    s/don\'t\(\).*?do\(\)//gs;
    s/don\'t\(\).*?$//gs;
    print "$_\n";   
}
