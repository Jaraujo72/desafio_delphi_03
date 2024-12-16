unit uDMLimiteCredito;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Datasnap.Provider,Vcl.Grids, uLimiteCreditoModel,
  Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBGrids, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmLimiteCredito = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    dspDistribuidor: TDataSetProvider;
    cdsDistribuidor: TClientDataSet;
    sqlPesquisar: TFDQuery;
    sqlDistribuidor: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID:Integer;
    procedure Pesquisar(sProdutor_ID: Integer; var aStringGrid : TStringGrid);
    procedure CarregarComboboxDistribuidor(cbbDistribuidor: TCombobox);
    function Inserir(oLimiteCredito : TLimiteCredito; out sErro : String):Boolean;
    function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;

var
  dtmLimiteCredito: TdtmLimiteCredito;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao, Rotinas;

{$R *.dfm}

{ TdtmLimiteCredito }

procedure TdtmLimiteCredito.CarregarComboboxDistribuidor(
  cbbDistribuidor: TCombobox);
begin
  try
    cdsDistribuidor.Active := False;

    cdsDistribuidor.Params[0].AsString := '%';

    cdsDistribuidor.Open;
    cdsDistribuidor.DisableConstraints;

    //
    cdsDistribuidor.First;

    cbbDistribuidor.Clear;

    while not cdsDistribuidor.Eof do
    begin
      cbbDistribuidor.Items.AddObject( Trim(cdsDistribuidor.FieldByName('NOME').AsString),
       tObject(cdsDistribuidor.FieldByName('DISTRIBUIDOR_ID').asInteger) );
      cdsDistribuidor.Next;
    end;
  finally
    cdsDistribuidor.EnableConstraints;
    cdsDistribuidor.Close;
  end;

end;

function TdtmLimiteCredito.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
var
  sqlDeletar : TFDQuery;
begin
  sqlDeletar := TFDQuery.Create(nil);
  try
    sqlDeletar.Connection := dtmConexao.SqlConexao;
    sqlDeletar.SQL.Text := ' DELETE FROM LIMITECREDITO WHERE LIMITECREDITO_ID = :LIMITECREDITO_ID ';

    sqlDeletar.Params[0].AsInteger := iCodigo;

    try
      sqlDeletar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao excluir limite: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlDeletar);
  end;

end;

function TdtmLimiteCredito.GerarID: Integer;
var
  sqlSeq : TFDQuery;
begin
  sqlSeq := TFDQuery.Create(nil);
  try
    sqlSeq.Connection := dtmConexao.SqlConexao;
    sqlSeq.SQL.Text := 'SELECT GEN_ID(GEN_LIMCRED, 1) FROM RDB$DATABASE;';
    sqlSeq.Open;
    Result := sqlSeq.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(sqlSeq);
  end;

end;

function TdtmLimiteCredito.Inserir(oLimiteCredito: TLimiteCredito;
  out sErro: String): Boolean;
var
  sqlInsert : TFDQuery;
begin
  sqlInsert := TFDQuery.Create(nil);
  try
    sqlInsert.Connection := dtmConexao.SqlConexao;
    sqlInsert.SQL.Text := ' INSERT INTO LIMITECREDITO( '+
                             '                      LIMITECREDITO_ID, '+
                             '                      LIMITECREDITO, '+
                             '                      PRODUTOR_ID, '+
                             '                      DISTRIBUIDOR_ID)values( '+
                             '                      :LIMITECREDITO_ID, '+
                             '                      :LIMITECREDITO,  '+
                             '                      :PRODUTOR_ID, '+
                             '                      :DISTRIBUIDOR_ID) ';

    sqlInsert.Params[0].AsInteger := GerarID;
    sqlInsert.Params[1].AsFloat := oLimiteCredito.LimiteCredito;
    sqlInsert.Params[2].AsInteger := oLimiteCredito.Produtor_id;
    sqlInsert.Params[3].AsInteger := oLimiteCredito.Distribuidor_id;

    try
      sqlInsert.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao inserir limite: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlInsert);
  end;

end;

procedure TdtmLimiteCredito.Pesquisar(sProdutor_ID: Integer;
  var aStringGrid: TStringGrid);
var
 iTotal : Integer;
begin
  try
    iTotal := 1;

    cdsPesquisar.Active := False;

    cdsPesquisar.Params[0].AsInteger := sProdutor_ID;

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;
    cdsPesquisar.Last;

    //Configurar colunas StringGrid
    ConfigurargrdLimiteCredito(aStringGrid,3,cdsPesquisar.RecordCount+1);

    //Popular linhas StringGrid
    cdsPesquisar.First;
    while not cdsPesquisar.Eof do
    begin
      aStringGrid.Cells[0,iTotal] := cdsPesquisar.FieldByName('LIMITECREDITO_ID').AsString;
      aStringGrid.Cells[1,iTotal] := cdsPesquisar.FieldByName('DISTRIBUIDOR').AsString;
      aStringGrid.Cells[2,iTotal] := cdsPesquisar.FieldByName('LIMITECREDITO').AsString;
      Inc(iTotal);
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;

end;

end.
