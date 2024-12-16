unit uDMItensNegociacao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Datasnap.Provider, uCadItensNegociacaoModel,
  Vcl.ComCtrls, Vcl.ExtCtrls,Vcl.Grids,Vcl.StdCtrls, System.StrUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmItensNegociacao = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    sqlPesquisar: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID:Integer;
    function Pesquisar(sNegociacao_ID: Integer; var aStringGrid : TStringGrid) :Double;
    function Inserir(oItensNegociacao : TCadItensNegociacao; out sErro : String):Boolean;
    function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;

var
  dtmItensNegociacao: TdtmItensNegociacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao, Rotinas;

{$R *.dfm}

{ TdtmItensNegociacao }


function TdtmItensNegociacao.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
var
  sqlDeletar : TFDQuery;
begin
  sqlDeletar := TFDQuery.Create(nil);
  try
    sqlDeletar.Connection := dtmConexao.SqlConexao;
    sqlDeletar.SQL.Text := ' DELETE FROM ITENS_NEGOCIACAO WHERE ITENS_NEGOCIACAO_ID = :ITENS_NEGOCIACAO_ID ';

    sqlDeletar.Params[0].AsInteger := iCodigo;

    try
      sqlDeletar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao excluir Item: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlDeletar);
  end;

end;

function TdtmItensNegociacao.GerarID: Integer;
var
  sqlSeq : TFDQuery;
begin
  sqlSeq := TFDQuery.Create(nil);
  try
    sqlSeq.Connection := dtmConexao.SqlConexao;
    sqlSeq.SQL.Text := 'SELECT GEN_ID(GEN_ITENS_NEGOCI, 1) FROM RDB$DATABASE;';
    sqlSeq.Open;
    Result := sqlSeq.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(sqlSeq);
  end;
end;

function TdtmItensNegociacao.Inserir(oItensNegociacao: TCadItensNegociacao;
  out sErro: String): Boolean;
var
  sqlInsert : TFDQuery;
begin
  sqlInsert := TFDQuery.Create(nil);
  try
    sqlInsert.Connection := dtmConexao.SqlConexao;
    sqlInsert.SQL.Text := ' INSERT INTO ITENS_NEGOCIACAO( '+
                             '                      ITENS_NEGOCIACAO_ID, '+
                             '                      PRODUTO_ID, '+
                             '                      QUANTIDADE, '+
                             '                      NEGOCIACAO_ID)values( '+
                             '                      :ITENS_NEGOCIACAO_ID, '+
                             '                      :PRODUTO_ID,  '+
                             '                      :QUANTIDADE, '+
                             '                      :NEGOCIACAO_ID) ';

    sqlInsert.Params[0].AsInteger := GerarID;
    sqlInsert.Params[1].AsInteger := oItensNegociacao.Produto_id;
    sqlInsert.Params[2].AsInteger := oItensNegociacao.Quantidade;
    sqlInsert.Params[3].AsInteger := oItensNegociacao.Negociacao_id;

    try
      sqlInsert.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao inserir Item: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlInsert);
  end;

end;

function TdtmItensNegociacao.Pesquisar(sNegociacao_ID: Integer;
  var aStringGrid: TStringGrid):Double;
var
 iTotal : Integer;
 vSum :Double;
begin
  try
    iTotal := 1;
    vSum := 0;

    cdsPesquisar.Active := False;

    cdsPesquisar.Params[0].AsInteger := sNegociacao_ID;

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;
    cdsPesquisar.Last;

    //Configurar colunas StringGrid
    ConfigurargrdItensNegociacao(aStringGrid,4,cdsPesquisar.RecordCount+1);

    //Popular linhas StringGrid
    cdsPesquisar.First;
    while not cdsPesquisar.Eof do
    begin
      aStringGrid.Cells[0,iTotal] := cdsPesquisar.FieldByName('ITENS_NEGOCIACAO_ID').AsString;
      aStringGrid.Cells[1,iTotal] := cdsPesquisar.FieldByName('DESCRICAO').AsString;
      aStringGrid.Cells[2,iTotal] := cdsPesquisar.FieldByName('QUANTIDADE').AsString;
      aStringGrid.Cells[3,iTotal] := FormatFloat('.,00',cdsPesquisar.FieldByName('PRECO').AsFloat);
      Inc(iTotal);
      vSum := vSum+(cdsPesquisar.FieldByName('PRECO').AsFloat);
      cdsPesquisar.Next;
    end;
    Result := vSum;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;

end;

end.
