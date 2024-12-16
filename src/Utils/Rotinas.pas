unit Rotinas;

interface
  uses SysUtils, System.Classes, Windows, Vcl.Forms, Vcl.Grids;

  function ValidaCPF_CNPJ(vpCpfCnpj:String;sErro:String):Boolean;
  function ValidaValorMonetario(sValor:String;sErro:String):Boolean;
  function RetornaNumerico(Valor : String) : String;
  Function TestaCnpj(xCNPJ: String): Boolean;
  Function TestaCpf(num: String): boolean;
  Function VerificaValorPreenchido(sValor:String): Boolean;
  procedure ExibirFormulario(ClasseForm : TComponentClass; var Reference;
                           FormModal : Boolean = false; vpTop : Boolean = False);

  Procedure ConfigurargrdPesquisaNegociacao(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);

  Procedure ConfigurargrdDistribuidor(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);

  Procedure ConfigurargrdItensNegociacao(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);

  Procedure ConfigurargrdLimiteCredito(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);

  Procedure ConfigurargrdProdutor(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);

  Procedure ConfigurargrdProduto(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);


implementation

function ValidaValorMonetario(sValor:String;sErro:String):Boolean;
begin
  try
    FormatFloat('.00',strtofloat(sValor));
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      sErro := e.Message;
    end;
  end;
end;

function VerificaValorPreenchido(sValor:String): Boolean;
begin
  Result := Trim(sValor) <> EmptyStr;
end;

function ValidaCPF_CNPJ(vpCpfCnpj:String;sErro:String):Boolean;
var
  viCPFvalido:Boolean;
  vIContador:Integer;
  viCPFInvalidos: array[0..9] of String;
begin
  vpCpfCnpj := retornanumerico(vpCpfCnpj);
  Result := false;
  try
    viCPFvalido := True;
    for vIContador := 0 to Length(viCPFInvalidos) -1 do begin
      if vpCpfCnpj = viCPFInvalidos[vIContador] then begin
        viCPFvalido := False;
        Break;
      end;
    end;
    case (Length(vpCpfCnpj)) of
      11: Result := Rotinas.TestaCpf(vpCpfCnpj);
      14: Result := Rotinas.TestaCnpj(vpCpfCnpj);
    end;

  except
    on E:Exception do
    begin
      sErro := E.message;
    end;
  end;
end;

function TestaCnpj(xCNPJ: String):Boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;
begin
   d1 := 0;
   d4 := 0;
   xx := 1;
   for nCount := 1 to Length( xCNPJ )-2 do
   begin
      if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
      begin
         if xx < 5 then
         begin
            fator := 6 - xx;
         end
         else begin
            fator := 14 - xx;
         end;
         d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         if xx < 6 then
         begin
            fator := 7 - xx;
         end
         else begin
            fator := 15 - xx;
         end;
         d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         xx := xx+1;
      end;
   end;
   resto := (d1 mod 11);
   if resto < 2 then
      begin
        digito1 := 0;
      end
      else
        begin
          digito1 := 11 - resto;
        end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
        digito2 := 0;
      end
      else
        begin
          digito2 := 11 - resto;
        end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCNPJ,succ(length(xCNPJ)-2),2) then
      begin
        Result := False;
      end
      else
        begin
          Result := True;
        end;
end;

function TestaCpf(num: string): boolean;
var n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
    d1,d2: integer;
    digitado, calculado: string;
begin
   if Length(Trim(num)) < 11 then
   begin
      result := false;
      exit;
   end;
   n1:=StrToInt(num[1]);
   n2:=StrToInt(num[2]);
   n3:=StrToInt(num[3]);
   n4:=StrToInt(num[4]);
   n5:=StrToInt(num[5]);
   n6:=StrToInt(num[6]);
   n7:=StrToInt(num[7]);
   n8:=StrToInt(num[8]);
   n9:=StrToInt(num[9]);
   d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
   d1:=11-(d1 mod 11);
   if d1>=10 then
      d1:=0;
      d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
      d2:=11-(d2 mod 11);
      if d2>=10 then
         d2:=0;
         calculado:=inttostr(d1)+inttostr(d2);
         digitado:=num[10]+num[11];
         if calculado=digitado
            then TestaCpf:=true
            else TestaCpf:=false;
end;

function RetornaNumerico(Valor : String) : String;
var i : Integer;
begin
  Result := '';
  for i := 1 to Length(Valor) do
    if Valor[i] in ['0'..'9'] then
       Result := Result + Valor[i];
end;

procedure ExibirFormulario(ClasseForm : TComponentClass; var Reference;
                           FormModal : Boolean = false; vpTop : Boolean = False);
begin
  with Application do
  begin
    if not FormModal then
    begin
      LockWindowUpdate(Handle);
      if TComponent(Reference) = nil then
      begin
        CreateForm(ClasseForm, Reference);
        TForm(Reference).FormStyle   := fsMDIChild;
        TForm(Reference).WindowState := wsMaximized;
      end;
      TForm(Reference).Show;
      LockWindowUpdate(0);
    end
    else
    begin
      if TComponent(Reference) = nil then
         CreateForm(ClasseForm, Reference);
      TForm(Reference).WindowState := wsNormal;
      if vpTop then
      begin
        TForm(Reference).FormStyle := fsStayOnTop;
        TForm(Reference).Show;
      end
      else
      begin
        TForm(Reference).FormStyle := fsNormal;
        TForm(Reference).ShowModal;
      end;
    end;
  end;
end;

Procedure ConfigurargrdPesquisaNegociacao(aStringGrid:
TStringGrid;iColCount,iRowCount :Integer);
begin
  aStringGrid.RowCount := iRowCount;
  aStringGrid.ColCount := iColCount;
  aStringGrid.cells[0,0] := 'Cód. Contrato';
  aStringGrid.Cells[1,0] := 'Produtor';
  aStringGrid.cells[2,0] := 'Distribuidor';
  aStringGrid.cells[3,0] := 'Status';


  aStringGrid.cells[4,0] := 'Dt. Cadastro';
  aStringGrid.cells[5,0] := 'Dt. Aprovação';
  aStringGrid.cells[6,0] := 'Dt. Conclusão';
  aStringGrid.cells[7,0] := 'Dt. Cancelamento';

  aStringGrid.ColWidths[0] := 90;
  aStringGrid.ColWidths[1] := 120;
  aStringGrid.ColWidths[2] := 120;
  aStringGrid.ColWidths[3] := 90;


  aStringGrid.ColWidths[4] := 90;
  aStringGrid.ColWidths[5] := 90;
  aStringGrid.ColWidths[6] := 90;
  aStringGrid.ColWidths[7] := 100;
end;

Procedure ConfigurargrdDistribuidor(aStringGrid:
TStringGrid;iColCount,iRowCount :Integer);
begin
  aStringGrid.RowCount := iRowCount;
  aStringGrid.ColCount := iColCount;
  aStringGrid.Cells[0,0] := 'ID';
  aStringGrid.Cells[1,0] := 'Nome';
  aStringGrid.cells[2,0] := 'CNPJ';
  aStringGrid.ColWidths[0] := 50;
  aStringGrid.ColWidths[1] := 260;
  aStringGrid.ColWidths[2] := 90;
end;

Procedure ConfigurargrdItensNegociacao(aStringGrid:
TStringGrid;iColCount,iRowCount :Integer);
begin
  aStringGrid.RowCount := iRowCount;
  aStringGrid.ColCount := iColCount;
  aStringGrid.Cells[0,0] := 'ID';
  aStringGrid.Cells[1,0] := 'Descricao';
  aStringGrid.cells[2,0] := 'Qtd.';
  aStringGrid.cells[3,0] := 'Total';
  aStringGrid.ColWidths[0] := 40;
  aStringGrid.ColWidths[1] := 200;
  aStringGrid.ColWidths[2] := 40;
  aStringGrid.ColWidths[3] := 60;
end;

Procedure ConfigurargrdLimiteCredito(aStringGrid:
TStringGrid;iColCount,iRowCount :Integer);
begin
  aStringGrid.RowCount := iRowCount;
  aStringGrid.ColCount := iColCount;
  aStringGrid.Cells[0,0] := 'ID';
  aStringGrid.Cells[1,0] := 'Distribuidor';
  aStringGrid.cells[2,0] := 'Limite';
  aStringGrid.ColWidths[0] := 50;
  aStringGrid.ColWidths[1] := 260;
  aStringGrid.ColWidths[2] := 90;
end;

Procedure ConfigurargrdProdutor(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);
begin
  aStringGrid.RowCount := iRowCount;
  aStringGrid.ColCount := iColCount;
  aStringGrid.Cells[0,0] := 'ID';
  aStringGrid.Cells[1,0] := 'Nome';
  aStringGrid.cells[2,0] := 'CPF';
  aStringGrid.ColWidths[0] := 50;
  aStringGrid.ColWidths[1] := 260;
  aStringGrid.ColWidths[2] := 90;
end;

Procedure ConfigurargrdProduto(aStringGrid:TStringGrid;iColCount,iRowCount :Integer);
begin
  aStringGrid.RowCount := iRowCount;
  aStringGrid.ColCount := iColCount;
  aStringGrid.Cells[0,0] := 'ID';
  aStringGrid.Cells[1,0] := 'Descrição';
  aStringGrid.cells[2,0] := 'Preço';
  aStringGrid.ColWidths[0] := 50;
  aStringGrid.ColWidths[1] := 260;
  aStringGrid.ColWidths[2] := 90;
end;

end.
