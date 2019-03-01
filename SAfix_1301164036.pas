program SA;
var
    i :integer;
    x1,x2,X1fix,X2fix,Tmax,Tawal,Tmin,Tfix: real;
    current,newState,a,expo,DeltaE: real;

    function fn(x1,x2:real):real;
        begin
                expo:= exp(abs(1-(sqrt((x1*x1)+(x2*x2))/3.14)));
                fn := -1*abs(sin(x1)*cos(x2)*expo);
        end;
    function proba(current,NewState,T:real):real;
        begin
                DeltaE := NewState-Current;
                proba := exp(-DeltaE/T);
        end;
    
begin
    randomize;
    Tawal:=100;
    Tmax:=Tawal;
    Tmin:=0.0001;
    a :=0.999; 
    x1 := (random() - random())*10;
    x2 := (random() - random())*10;
    current := fn(x1,x2);
    while (Tmax>Tmin) do
        begin
            for i:= 1 to 1000 do
                begin
                    x1 := (random() - random())*10;
                    x2 := (random() - random())*10;
                    newState := fn(x1,x2); 
                    if(Current > newState) then
                        begin
                            current := newState;   
                            X1fix := x1;
                            X2fix := x2; 
                        end
                    else
                        begin
                            if (proba(current,newState,Tmax)>random()) then
                                begin
                                    current := newState;   
                                    X1fix := x1;
                                    X2fix := x2;
                                    Tfix := Tmax;
                                end; 
                       end;                   
                end;
            Tmax := Tmax*a; 
        end;
        Writeln('Nilai T Awal : ', Tawal:0:10);
        writeln('Nilai X1 : ',X1fix:0:10);
        writeln('Nilai X2 : ',X2fix:0:10);
        Writeln('Nilai T yang menyebabkan optimum : ', Tfix:0:10);
        writeln('Nilai Titik Optimum : ', current:0:10);
    
    readln;
end.
