unit uDMDistribuidor;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Datasnap.Provider, VCL.Grids, uDistribuidorModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmDistribuidor = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    sqlPesquisar: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID:Integer;
    procedure Pesquisar(sNome: string; var aStringGrid : TStringGrid);
    procedure CarregarDistribuidor(oDistribuidor : TDistribuidor; iCodigo : Integer);
    function Inserir(oDistribuidor : TDistribuidor; out sErro : String):Boolean;
    function Alterar(oDistribuidor : TDistribuidor; out sErro : String):Boolean;
    function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;

var
  dtmDistribuidor: TdtmDistribuidor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao, Rotinas;

{$R *.dfm}

{ TdtmDistribuidor }

function TdtmDistribuidor.Alterar(oDistribuidor: TDistribuidor;
  out sErro: String): Boolean;
var
  sqlAlterar : TFDQuery;
begin
  sqlAlterar := TFDQuery.Create(nil);
  try
    sqlAlterar.Connection := dtmConexao.SqlConexao;
    sqlAlterar.SQL.Text := ' UPDATE DISTRIBUIDOR '+
                              ' SET NOME = :NOME, '+
                              ' CNPJ = :CNPJ '+
                              ' WHERE DISTRIBUIDOR_ID = :DISTRIBUIDOR_ID ';

    sqlAlterar.Params[0].AsString := oDistribuidor.Nome;
    sqlAlterar.Params[1].AsString := oDistribuidor.CNPJ;
    sqlAlterar.Params[2].AsInteger := oDistribuidor.id;

    try
      sqlAlterar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao alterar produtor: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlAlterar);
  end;

end;

procedure TdtmDistribuidor.CarregarDistribuidor(oDistribuidor: TDistribuidor;
  iCodigo: Integer);
var
  sqlDistribuidor : TFDQuery;
begin
  sqlDistribuidor := TFDQuery.Create(nil);
  try
    sqlDistribuidor.Connection := dtmConexao.SqlConexao;
    sqlDistribuidor.SQL.Text := 'Select * from DISTRIBUIDOR WHERE DISTRIBUIDOR_ID = '+iCodigo.ToString;
    sqlDistribuidor.Open;

    oDistribuidor.Nome := sqlDistribuidor.FieldByName('Nome').AsString;
    oDistribuidor.CNPJ  := sqlDistribuidor.FieldByName('CNPJ').AsString;
    oDistribuidor.ID  := sqlDistribuidor.FieldByName('DISTRIBUIDOR_ID').AsInteger;
  finally
    FreeAndNil(sqlDistribuidor);
  end;
end;

function TdtmDistribuidor.Excluir(iCodigo: Integer; out sErro: String): Boolean;
var
  sqlDeletar : TFDQuery;
begin
  sqlDeletar := TFDQuery.Create(nil);
  try
    sqlDeletar.Connection := dtmConexao.SqlConexao;
    sqlDeletar.SQL.Text := ' DELETE FROM DISTRIBUIDOR WHERE DISTRIBUIDOR_ID = :DISTRIBUIDOR_ID ';

    sqlDeletar.Params[0].AsInteger := iCodigo;

    try
      sqlDeletar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao excluir produtor: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlDeletar);
  end;
end;

function TdtmDistribuidor.GerarID: Integer;
var
  sqlSeq : TFDQuery;
begin
  sqlSeq := TFDQuery.Create(nil);
  try
    sqlSeq.Connection := dtmConexao.SqlConexao;
    sqlSeq.SQL.Text := 'SELECT GEN_ID(GEN_DIST, 1) FROM RDB$DATABASE;';
    sqlSeq.Open;
    Result := sqlSeq.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(sqlSeq);
  end;
end;

function TdtmDistribuidor.Inserir(oDistribuidor: TDistribuidor;
  out sErro: String): Boolean;
var
  sqlInsert : TFDQuery;
begin
  sqlInsert := TFDQuery.Create(nil);
  try
    sqlInsert.Connection := dtmConexao.SqlConexao;
    sqlInsert.SQL.Text := ' Insert into DISTRIBUIDOR( '+
                             '                      DISTRIBUIDOR_ID, '+
                             '                      Nome, '+
                             '                      CNPJ)values( '+
                             '                      :DISTRIBUIDOR_ID, '+
                             '                      :NOME,  '+
                             '                      :CNPJ) ';

    sqlInsert.Params[0].AsInteger := GerarID;
    sqlInsert.Params[1].AsString := oDistribuidor.Nome;
    sqlInsert.Params[2].AsString := oDistribuidor.CNPJ;

    try
      sqlInsert.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao inserir produtor: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlInsert);
  end;

end;

procedure TdtmDistribuidor.Pesquisar(sNome: string;
  var aStringGrid: TStringGrid);
var
 iTotal : Integer;
begin
  try
    iTotal := 1;

    cdsPesquisar.Active := False;

    if sNome.Trim.IsEmpty then
      cdsPesquisar.Params[0].AsString := '%'
    else
      cdsPesquisar.Params[0].AsString := '%'+sNome+'%';

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;
    cdsPesquisar.Last;

    //Configurar colunas StringGrid
    ConfigurargrdDistribuidor(aStringGrid,3,cdsPesquisar.RecordCount+1);

    //Popular linhas StringGrid
    cdsPesquisar.First;
    while not cdsPesquisar.Eof do
    begin
      aStringGrid.Cells[0,iTotal] := cdsPesquisar.FieldByName('DISTRIBUIDOR_ID').AsString;
      aStringGrid.Cells[1,iTotal] := cdsPesquisar.FieldByName('NOME').AsString;
      aStringGrid.Cells[2,iTotal] := cdsPesquisar.FieldByName('CNPJ').AsString;
      Inc(iTotal);
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;

end;

end.
