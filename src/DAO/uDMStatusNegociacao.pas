unit uDMStatusNegociacao;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd,
  Datasnap.DBClient, Data.DB,
  Datasnap.Provider, vcl.Grids,uStatusNegociacaoModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmStatusNegociacao = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    sqlPesquisar: TFDQuery;
  private
    { Private declarations }
    function RetornaDataUpdate(aStatus : TStatusNegociacao):STring;
    function RetornaStatusString(aStatus : TStatusNegociacao):STring;
  public
    { Public declarations }
    procedure Pesquisar(iNegociacaoID: integer; var aStringGrid : TStringGrid);
    function AtualizarStatus(aStatus : TStatusNegociacao;iNegociacaoID:integer; sErro :STring):Boolean;
  end;

var
  dtmStatusNegociacao: TdtmStatusNegociacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao, Rotinas;


{$R *.dfm}

{ TdtmStatusNegociacao }

function TdtmStatusNegociacao.AtualizarStatus(aStatus: TStatusNegociacao;
  iNegociacaoID: integer; sErro :STring): Boolean;
var
  vDataUpdate,
  vStatusString : String;
  sqlAlterar : TFDQuery;
begin
  vDataUpdate := RetornaDataUpdate(aStatus);
  vStatusString := RetornaStatusString(aStatus);
  sqlAlterar := TFDQuery.Create(nil);
  try
    sqlAlterar.Connection := dtmConexao.SqlConexao;
    sqlAlterar.SQL.Text := ' UPDATE NEGOCIACAO '+
                              ' SET SITUACAO = :SITUACAO, '+
                               vDataUpdate+
                              ' WHERE NEGOCIACAO_ID = :NEGOCIACAO_ID ';

    sqlAlterar.Params[0].AsString := vStatusString;
    sqlAlterar.Params[1].AsDateTime := now;
    sqlAlterar.Params[2].AsInteger := iNegociacaoID;

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

procedure TdtmStatusNegociacao.Pesquisar(iNegociacaoID: integer;
  var aStringGrid: TStringGrid);
var
 iTotal : Integer;
begin
  try
    iTotal := 1;

    cdsPesquisar.Active := False;

    cdsPesquisar.Params[0].AsInteger :=iNegociacaoID;

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;
    cdsPesquisar.Last;

    //Configurar StringGrid
    ConfigurargrdPesquisaNegociacao(aStringGrid,8,cdsPesquisar.RecordCount+1);

    //Popular linhas StringGrid
    cdsPesquisar.First;
    while not cdsPesquisar.Eof do
    begin
      aStringGrid.Cells[0,iTotal] := cdsPesquisar.FieldByName('NEGOCIACAO_ID').AsString;
      aStringGrid.Cells[1,iTotal] := cdsPesquisar.FieldByName('PRODUTOR').AsString;
      aStringGrid.Cells[2,iTotal] := cdsPesquisar.FieldByName('DISTRIBUIDOR').AsString;
      aStringGrid.Cells[3,iTotal] := cdsPesquisar.FieldByName('SITUACAO').AsString;
      aStringGrid.Cells[4,iTotal] := cdsPesquisar.FieldByName('DATA_INICIO').AsString;
      aStringGrid.Cells[5,iTotal] := cdsPesquisar.FieldByName('DATA_APROVACAO').AsString;
      aStringGrid.Cells[6,iTotal] := cdsPesquisar.FieldByName('DATA_CONCLUSAO').AsString;
      aStringGrid.Cells[7,iTotal] := cdsPesquisar.FieldByName('DATA_CANCELAMENTO').AsString;
      Inc(iTotal);
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;

end;

function TdtmStatusNegociacao.RetornaDataUpdate(
  aStatus: TStatusNegociacao): STring;
begin
  case aStatus of
    sAprovada:
    begin
      Result := ' DATA_APROVACAO = :DATA_APROVACAO ';
    end;
    sConcluida:
    begin
      Result := ' DATA_CONCLUSAO = :DATA_CONCLUSAO ';
    end;
    sCancelada:
    begin
      Result := ' DATA_CANCELAMENTO = :DATA_CANCELAMENTO ';
    end;
  end;
end;

function TdtmStatusNegociacao.RetornaStatusString(
  aStatus: TStatusNegociacao): STring;
begin
  case aStatus of
    sAprovada:
    begin
      Result := 'Aprovada';
    end;
    sConcluida:
    begin
      Result := 'Concluída';
    end;
    sCancelada:
    begin
      Result := 'Cancelada';
    end;
  end;
end;

end.
