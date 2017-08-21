%imprimir rCUTE

function[]=writePerl(work)


fid=fopen('rCUTE','w');

fprintf(fid,'#!/usr/bin/perl -w \n');
fprintf(fid,'use FileHandle; use IPC::Open2; \n');
fprintf(fid,'$path = "%s"; \n',work);
fprintf(fid,'$filename = "LIST_large2"; open LIST, $filename or die "Couldnt open file $filename\n"; \n');
fprintf(fid,'while( <LIST> ){ chomp; if ( $_ eq "" ) { print "\n   *** End of the list *** \n"; last; } \n');
fprintf(fid,'@names = split; $name = shift @names;\n');
fprintf(fid,'open AMPL, "|/bin/AMPL/ampl > /dev/null";print AMPL &q(<<"    ENDAMPL"); \n');
fprintf(fid,'    : reset; \n');
fprintf(fid,'    : model  %s/$name.mod; \n',work);
fprintf(fid,'    : write g$name; \n');
fprintf(fid,'    ENDAMPL\n');
fprintf(fid,'    close(AMPL);} \n');
fprintf(fid,'close LIST or die $!; chdir($path) or die "Cant chdir to $path $!"; \n');
fprintf(fid,'sub q{my $string  = $_[0]; $string =~ s/^\\s*://gm; return $string;} \n');

fclose(fid);

end