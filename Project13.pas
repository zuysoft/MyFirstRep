Program Project13;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils;

Const
    N = 10;

var
    Matrix: Array [1 .. N, 1 .. N] of Real;
    Roots: Array [1 .. N] of Real;
    CountVar, I, J, M, tempI: Integer;
    K, sum: Real;
    f: Text;
 //   c: Integer;
 procedure movestrings(k,l:integer);
 {Процедура перестановки k-ой и l-ой строк в матрице а порядка n}
 var j : integer;
 r : real;
 begin
 if (k<=CountVar) and (l<=CountVar)then
 begin
 for j := 1 to CountVar+1 do
 begin
 r := Matrix[l,j];
 Matrix[l,j] :=Matrix[k,j];
 Matrix[k,j] := r;
 end;
 end
 end; {movestrings}

begin

    assign(f, 'C:\temp\test3.txt');
    reset(f);
    read(f, CountVar);
    for I := 1 to CountVar do
    begin
        for J := 1 to CountVar + 1 do
        begin
            read(f, Matrix[I, J]);
        end;
    end;
    close(f);
    writeln(CountVar);
    for I := 1 to CountVar do
    begin
        for J := 1 to CountVar + 1 do
            write(Matrix[I, J]:5:2, ' ');
        writeln;
    end;
    for J := 1 to CountVar do
    begin
    if Matrix[J, J] =0 then   {коэффициент Matrix[J, J] = 0, значит надо менять строку местами}
    begin
      {Надо поменять местами строки}
      tempI := J+1  ;
      repeat
      if Matrix[tempI,J]<>0 then
      movestrings(J, tempI)
      until (tempI <countVar+1) or (Matrix[J, J] <> 0) ;
    end;

        for I := J + 1 to CountVar do
        begin

            K := Matrix[I, J] / Matrix[J, J];
            for M := J to CountVar + 1 do
                Matrix[I, M] := Matrix[I, M] - K * Matrix[J, M];

        end;
    end;
    for I := 1 to CountVar do
    begin
        for J := 1 to CountVar + 1 do
            write(Matrix[I, J]:5:2, ' ');
        writeln;
    end;
    for I := CountVar downto 1 do
    begin
        sum := 0;
        for J := I + 1 to CountVar do
            sum := sum + Roots[J] * Matrix[I, J];
        If Matrix[I, I] = 0 then
            Roots[I] := 0
        else
            Roots[I] := (Matrix[I, CountVar + 1] - sum) / Matrix[I, I];
    end;
  //  assign(f, 'C:\DRIVERS\Vivod.txt');
   // rewrite(f);

    begin
        for I := 1 to CountVar do
            write(Roots[I]:5:2,'  ');
    end;

    readln;

end.
