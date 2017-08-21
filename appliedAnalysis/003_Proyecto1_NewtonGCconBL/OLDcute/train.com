reset;
option solver minlp;
solve;
display U, X;
