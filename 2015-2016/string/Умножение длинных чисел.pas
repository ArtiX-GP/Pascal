{Nikita Gromik vk.vom/nikkorejz}

program Lone;
Var one,two,ss:string;
j,i,help,n1,n2:integer;
a:array[1..128]of string;
Function checkNumber(s:string):boolean;
  var h:integer;
    begin
      checkNumber:=true;
      if length(s) = 0 then checkNumber:=false
      else 
        begin
          if (s[1]='0') and (length(s)>1) then checkNumber:=false;
          for h:=1 to length(s) do
            if (ord(s[h])<48) or (ord(s[h])>57) then checkNumber:=false;
        end;
    end;
    
Function slo(s1,s2:string):string;
var s3,d:string;
i,j,a,b,c,r:integer;
Begin
  if (length(s1) > length(s2)) then
    for i:=1 to length(s1)-length(s2) do
      s2 := '0' + s2;
    
  if (length(s2) > length(s1)) then
    for i:=1 to length(s2)-length(s1) do
      s1 := '0' + s1;
      
    s3:='';
    r:=0;
    for i:=length(s1) downto 1 do begin
      val(s1[i], a, j); val(s2[i], b, j); 
      c:= (a+b+r) mod 10;
      r:= (a+b+r) div 10;
      str(c,d);
      s3:= d + s3;
      end;
    if (r = 1) then s3:= '1' + s3;
    slo:=s3;
end;


Function umn(s1:string; k:integer):string;
Var r,a,b,i:integer;
  ss,s2:string;
Begin
  if k <> 0 then
    begin
      r:=0;
        for i:=length(s1) downto 1 do 
          begin
            val(s1[i], a, help);
            b:=(a*k+r) mod 10;
            r:=(a*k+r) div 10;
            str(b,ss);
            s2:=ss+s2;
          end;
          if r>0 then 
            begin
              str(r,ss);
              s2:=ss+s2;
            end;
          umn:=s2;
    end else begin
      umn:='0'
      end;
end;
    
Begin
  repeat
    write('Введите первое число: ');
    readln(one);
  until checkNumber(one)=true;
  repeat
    write('Введите второе число: ');
    readln(two);
  until checkNumber(two)=true;
  j:=0;
  for j:=1 to 128 do
    a[j]:='-1';
  j:=0;
  if (two = '0') or (one = '0') then writeln('Произведение = 0')
  else
      for j:=1 to length(two)-1  do
        begin
          val(two[(length(two))-j+1], n1, help);
          val(two[(length(two))-j], n2, help); 
          
          a[j]:=umn(one, n1);
          a[j+1]:=umn(one,n2);
          
        end;
        for j:=1 to 128 do
          if j<>1 then
            for i:=2 to j do
            a[j]:=a[j]+'0';
            
//            for j:=1 to 10 do
//            writeln(a[j]);
            ss:='';
            for j:=1 to 127 do
            if a[j][1]<>'-' then
              ss:=slo(ss,a[j]);
              
              writeln('ИТОГ: ',ss);
        
    
End.

