{
Вывести массив так:
 1  2  3  4  5
. . . . . . . .
46 47 48 49 50
}

Program one;
Uses crt;
Var a:array[1..10,1..5] of integer;
    i,j,f,k:integer;


begin 

for i:=1 to 10 do 
  for j:=1 to 5 do begin
    f:=1 + f;
    a[i,j]:=f ;
  end;


for i:=1 to 10 do begin
  for j:=1 to 5 do begin
    write(a[i,j]:3);
  end;
writeln;
end;
end.
