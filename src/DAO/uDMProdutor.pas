unit uDMProdutor;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Vcl.Grids,uProdutorModel,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Async;

type
  TdtmProdutor = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    sqlPesquisar: TFDQuery;
    sqlPesquisarPRODUTOR_ID: TIntegerField;
    sqlPesquisarNOME: TStringField;
    sqlPesquisarCPFCNPJ: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID:Integer;
    procedure Pesquisar(sNome: string; var aStringGrid : TStringGrid);
    procedure CarregarProdutor(oProdutor : TProdutor; iCodigo : Integer);
    function Inserir(oProdutor : TProdutor; out sErro : String):Integer;
    function Alterar(oProdutor : TProdutor; out sErro : String):Boolean;
    function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;

var
  dtmProdutor: TdtmProdutor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao, Rotinas;

{$R *.dfm}

{ TDataModule1 }

function TdtmProdutor.Alterar(oProdutor: TProdutor; out sErro: String): Boolean;
var
  sqlAlterar : TFDQuery;
begin
  sqlAlterar := TFDQuery.Create(nil);
  try
    sqlAlterar.Connection := dtmConexao.SqlConexao;
    sqlAlterar.SQL.Text := ' UPDATE PRODUTOR '+
                              ' SET NOME = :NOME, '+
                              ' CPFCNPJ = :CPFCNPJ '+
                              ' WHERE PRODUTOR_ID = :PRODUTOR_ID ';

    sqlAlterar.Params[0].AsString := oProdutor.Nome;
    sqlAlterar.Params[1].AsString := oProdutor.Cpf;
    sqlAlterar.Params[2].AsInteger := oProdutor.id;

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

procedure TdtmProdutor.CarregarProdutor(oProdutor: TProdutor; iCodigo: Integer);
var
  sqlProdutor : TFDQuery;
begin
  sqlProdutor := TFDQuery.Create(nil);
  try
    sqlProdutor.Connection := dtmConexao.SqlConexao;
    sqlProdutor.SQL.Text := 'Select * from PRODUTOR WHERE PRODUTOR_ID = '+iCodigo.ToString;
    sqlProdutor.Open;

    oProdutor.Nome := sqlProdutor.FieldByName('Nome').AsString;
    oProdutor.Cpf  := sqlProdutor.FieldByName('CPFCNPJ').AsString;
    oProdutor.ID  := sqlProdutor.FieldByName('PRODUTOR_ID').AsInteger;
  finally
    FreeAndNil(sqlProdutor);
  end;

end;

function TdtmProdutor.Excluir(iCodigo: Integer; out sErro: String): Boolean;
var
  sqlDeletar : TFDQuery;
begin
  sqlDeletar := TFDQuery.Create(nil);
  try
    sqlDeletar.Connection := dtmConexao.SqlConexao;
    sqlDeletar.SQL.Text := ' DELETE FROM PRODUTOR WHERE PRODUTOR_ID = :PRODUTOR_ID ';

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

function TdtmProdutor.GerarID: Integer;
var
  sqlSeq : TFDQuery;
begin
  sqlSeq := TFDQuery.Create(nil);
  try
    sqlSeq.Connection := dtmConexao.SqlConexao;
    sqlSeq.SQL.Text := 'SELECT GEN_ID(gen_produtor, 1) FROM RDB$DATABASE;';
    sqlSeq.Open;
    Result := sqlSeq.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(sqlSeq);
  end;
end;

function TdtmProdutor.Inserir(oProdutor: TProdutor; out sErro: String): Integer;
var
  sqlInsert : TFDQuery;
  sID: Integer;
begin
  sqlInsert := TFDQuery.Create(nil);
  try
    sID := GerarID;
    sqlInsert.Connection := dtmConexao.SqlConexao;
    sqlInsert.SQL.Text := ' Insert into produtor( '+
                             '                      produtor_id, '+
                             '                      Nome, '+
                             '                      CPFCNPJ)values( '+
                             '                      :PRODUTOR_ID, '+
                             '                      :NOME,  '+
                             '                      :CPFCNPJ) ';

    sqlInsert.Params[0].AsInteger := sID;
    sqlInsert.Params[1].AsString := oProdutor.Nome;
    sqlInsert.Params[2].AsString := oProdutor.Cpf;

    try
      sqlInsert.ExecSQL();
      Result := sID;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao inserir produtor: '+e.Message;
        Result := 0;
      end;
    end;
  finally
    FreeAndNil(sqlInsert);
  end;
end;

procedure TdtmProdutor.Pesquisar(sNome: string; var aStringGrid: TStringGrid);
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

    //Configurar StringGrid
    ConfigurargrdProdutor(aStringGrid,3,cdsPesquisar.RecordCount+1);

    //Popular linhas StringGrid
    cdsPesquisar.First;
    while not cdsPesquisar.Eof do
    begin
      aStringGrid.Cells[0,iTotal] := cdsPesquisar.FieldByName('PRODUTOR_ID').AsString;
      aStringGrid.Cells[1,iTotal] := cdsPesquisar.FieldByName('NOME').AsString;
      aStringGrid.Cells[2,iTotal] := cdsPesquisar.FieldByName('CPFCNPJ').AsString;
      Inc(iTotal);
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;
end;

end.

