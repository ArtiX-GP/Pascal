Program graph;
Var a:array[1..20,1..20] of integer;
    b:array[1..20] of boolean;
i,j,l,h,n,k,x,y,p:integer;
f:text;
Procedure search(z:integer);
Var h:integer;
begin
b[z]:= true;
For h:=1 to n do 
if (b[h] = false) and (a[z,h] = 1)
then search(h);
end;
Begin
Assign (f, 'graf.txt');
Reset(f);
Readln(f,n);
Readln(f,p);
For i:=1 to n do
For j:=1 to n do a[i,j]:=0;
For i:=1 to p do begin
Read(f,x);
Read(f,y);
a[x,y]:=1;
a[y,x]:=1;
end;
Close(f);
write('K = '); Read(K);
write('L = '); Read(L);
For i:=1 to n do b[i]:=false;
Search(K);
if b[i]=true then writeln('Путь есть')
else writeln('безысходность');
end.

