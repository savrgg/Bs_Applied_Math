#!/usr/bin/perl -w
#
#------------------------------------------------------------------
#   
#     running a list of problems with exAMPL a naive
#     implementation of Newton's method
#     j-l morales  june, 2013
#
#------------------------------------------------------------------
#
#
use FileHandle;
use IPC::Open2;
$path = "/Users/SavrGG/Dropbox/Computadoras/001_MATLAB/001_AnalisisAplicado/006_Proyecto2/";
use lib "/bin/AMPL";

$filename = "LIST_large2";


 
  open LIST, $filename or die "Couldn't open file $filename\n";

#     Now read and process one line at a time
#------------------
#  $pid = open2(*RESPONSE, *MATLAB,"matlab -nojvm");
#  $pid or die;
#------------------
while( <LIST> )
{
    chomp;
    if ( $_ eq "" ) { print "\n   *** End of the list *** \n"; last; }
#
    @names = split;
    $name = shift @names;
    #print "  Processing $name  \n";

#----
    open AMPL, "|/bin/AMPL/ampl > /dev/null";

    print AMPL &q(<<"    ENDAMPL");
    : reset;
    : model  /Users/SavrGG/Dropbox/Computadoras/001_MATLAB/001_AnalisisAplicado/006_Proyecto2/$name.mod;
    : write g$name;
    ENDAMPL
    close(AMPL);

}
    


#close RESPONSE or die $!;
close LIST or die $!;


chdir($path) or die "Cant chdir to $path $!";
#system("grep -h sum *.sum > Reporte");

#                            

sub q{
    my $string  = $_[0];
    $string =~ s/^\s*://gm;
    #$string =~ s{ (.*)\*/\s*$ }{ sprintf "%-73s*/\n", $1 }gmex;
    
    return $string;
}
