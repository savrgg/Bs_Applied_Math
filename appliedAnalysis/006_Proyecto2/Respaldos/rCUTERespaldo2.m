#!/usr/bin/perl -w

use FileHandle; use IPC::Open2;

$path = "/Users/SavrGG/Dropbox/Computadoras/001_MATLAB/001_AnalisisAplicado/006_Proyecto2/";

$filename = "LIST_large2"; open LIST, $filename or die "Couldn't open file $filename\n";

while( <LIST> ){ chomp; if ( $_ eq "" ) { print "\n   *** End of the list *** \n"; last; }
@names = split; $name = shift @names;

open AMPL, "|/bin/AMPL/ampl > /dev/null";print AMPL &q(<<"    ENDAMPL"); 
    : reset;
    : model  /Users/SavrGG/Dropbox/Computadoras/001_MATLAB/001_AnalisisAplicado/006_Proyecto2/$name.mod;
    : write g$name;
    ENDAMPL
    close(AMPL);}
    
close LIST or die $!; chdir($path) or die "Cant chdir to $path $!";
                       
sub q{my $string  = $_[0]; $string =~ s/^\s*://gm; return $string;}
