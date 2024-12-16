unit uDMCadNegociacao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Datasnap.Provider,Vcl.Grids,
  Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBGrids, Vcl.DBCtrls, uCadNegociacaoModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmCadNegociacao = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    dspProdutor: TDataSetProvider;
    cdsProdutor: TClientDataSet;
    dspLimiteCredito: TDataSetProvider;
    cdsLimiteCredito: TClientDataSet;
    sqlPesquisar: TFDQuery;
    sqlProdutor: TFDQuery;
    sqlLimteCredito: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID:Integer;
    function PesquisarSaldoDiponivel(sLimiteCredito_ID: Integer):Double;
    procedure CarregarComboboxProdutor(cbbProdutor: TCombobox);
    procedure CarregarComboboxLimiteCredito(cbbLimiteCredito: TCombobox; sProdutor_ID : Integer);
    function Inserir(oCadNegociacao : TCadNegociacao; out sErro : String):Integer;
    function Alterar(oCadNegociacao : TCadNegociacao; out sErro : String):Boolean;
    function Excluir(iCodigo : Integer;sTabela :String; out sErro : String):Boolean;
  end;

var
  dtmCadNegociacao: TdtmCadNegociacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao;


{$R *.dfm}

{ TdtmCadNegociacao }

function TdtmCadNegociacao.Alterar(oCadNegociacao: TCadNegociacao;
  out sErro: String): Boolean;
var
  sqlAlterar : TFDQuery;
begin
  sqlAlterar := TFDQuery.Create(nil);
  try
    sqlAlterar.Connection := dtmConexao.SqlConexao;
    sqlAlterar.SQL.Text := ' UPDATE NEGOCIACAO '+
                              ' SET DATA_INICIO = :DATA_INICIO, '+
                              ' SITUACAO = :SITUACAO, '+
                              ' PRODUTOR_ID = :PRODUTOR_ID, '+
                              ' LIMITECREDITO_ID = :LIMITECREDITO_ID, '+
                              ' VALOR_TOTAL_CONTRATO = :VALOR_TOTAL_CONTRATO '+
                              ' WHERE NEGOCIACAO_ID = :NEGOCIACAO_ID ';

    sqlAlterar.Params[0].AsDateTime := oCadNegociacao.Data_Inicio;
    sqlAlterar.Params[1].AsString := oCadNegociacao.Situacao;

    sqlAlterar.Params[2].AsInteger := oCadNegociacao.Produtor_id;
    sqlAlterar.Params[3].AsInteger := oCadNegociacao.LimiteCredito_ID;

    sqlAlterar.Params[4].AsFloat := oCadNegociacao.ValorTotalContrato;
    sqlAlterar.Params[5].AsInteger := oCadNegociacao.ID;

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

procedure TdtmCadNegociacao.CarregarComboboxLimiteCredito(
  cbbLimiteCredito: TCombobox; sProdutor_ID : Integer);
begin
    try
    cdsPesquisar.Active := False;

    cdsPesquisar.Params[0].AsInteger := sProdutor_ID;

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;

    //
    cdsPesquisar.First;

    cbbLimiteCredito.Clear;

    while not cdsPesquisar.Eof do
    begin
      cbbLimiteCredito.Items.AddObject( Trim(cdsPesquisar.FieldByName('DISTRIBUIDOR').AsString),
       tObject(cdsPesquisar.FieldByName('LIMITECREDITO_ID').asInteger) );
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;
end;

procedure TdtmCadNegociacao.CarregarComboboxProdutor(cbbProdutor: TCombobox);
begin
    try
    cdsProdutor.Active := False;

    cdsProdutor.Params[0].AsString := '%';

    cdsProdutor.Open;
    cdsProdutor.DisableConstraints;

    //
    cdsProdutor.First;

    cbbProdutor.Clear;

    while not cdsProdutor.Eof do
    begin
      cbbProdutor.Items.AddObject( Trim(cdsProdutor.FieldByName('NOME').AsString),
       tObject(cdsProdutor.FieldByName('PRODUTOR_ID').asInteger) );
      cdsProdutor.Next;
    end;
  finally
    cdsProdutor.EnableConstraints;
    cdsProdutor.Close;
  end;

end;

function TdtmCadNegociacao.Excluir(iCodigo: Integer;sTabela :String;
  out sErro: String): Boolean;
var
  sqlDeletar : TFDQuery;
begin
  sqlDeletar := TFDQuery.Create(nil);
  try
    sqlDeletar.Connection := dtmConexao.SqlConexao;
    sqlDeletar.SQL.Text := ' DELETE FROM '+sTabela+' WHERE NEGOCIACAO_ID = :NEGOCIACAO_ID ';

    sqlDeletar.Params[0].AsInteger := iCodigo;

    try
      sqlDeletar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao excluir '+sTabela+': '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlDeletar);
  end;
end;

function TdtmCadNegociacao.GerarID: Integer;
var
  sqlSeq : TFDQuery;
begin
  sqlSeq := TFDQuery.Create(nil);
  try
    sqlSeq.Connection := dtmConexao.SqlConexao;
    sqlSeq.SQL.Text := 'SELECT GEN_ID(GEN_NEGOCI, 1) FROM RDB$DATABASE;';
    sqlSeq.Open;
    Result := sqlSeq.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(sqlSeq);
  end;

end;

function TdtmCadNegociacao.Inserir(oCadNegociacao: TCadNegociacao;
  out sErro: String): Integer;
var
  sqlInsert : TFDQuery;
  vID: Integer;
begin
  sqlInsert := TFDQuery.Create(nil);
  try
    vID := GerarID;
    sqlInsert.Connection := dtmConexao.SqlConexao;
    sqlInsert.SQL.Text := ' INSERT INTO NEGOCIACAO( '+
                             '                      NEGOCIACAO_ID, '+
                             '                      SITUACAO, '+
                             '                      PRODUTOR_ID, '+
                             '                      LIMITECREDITO_ID)values( '+
                             '                      :NEGOCIACAO_ID, '+
                             '                      :SITUACAO,  '+
                             '                      :PRODUTOR_ID, '+
                             '                      :LIMITECREDITO_ID) ';

    sqlInsert.Params[0].AsInteger := vID ;
    sqlInsert.Params[1].AsString := oCadNegociacao.Situacao;
    sqlInsert.Params[2].AsInteger := oCadNegociacao.Produtor_id;
    sqlInsert.Params[3].AsInteger := oCadNegociacao.LimiteCredito_ID;

    try
      sqlInsert.ExecSQL();
      Result := vID;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao inserir Negociação: '+e.Message;
        Result := 0;
      end;
    end;
  finally
    FreeAndNil(sqlInsert);
  end;

end;

function TdtmCadNegociacao.PesquisarSaldoDiponivel(sLimiteCredito_ID: Integer):Double;
begin
  try
    cdsLimiteCredito.Active := False;
    cdsLimiteCredito.Params[0].AsInteger := sLimiteCredito_ID;

    cdsLimiteCredito.Open;
    Result := cdsLimiteCredito.FieldByName('LIMITEDISPONIVEL').AsFloat;
  finally
    cdsPesquisar.Close;
  end;

end;

end.
