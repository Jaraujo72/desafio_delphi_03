unit uCadNegociacaoController;

interface
uses uDMCadNegociacao, uCadNegociacaoModel, Data.SqlExpr, vcl.Grids,Vcl.StdCtrls;
 type
  TCadNegociacaoController = class
    public
     constructor Create;
     destructor Destroy; override;
     procedure CarregarComboboxProdutor(cbbProdutor: TCombobox);
     function PesquisarSaldoDiponivel(sLimiteCredito_ID: Integer):Double;
     procedure CarregarComboboxLimiteCredito(cbbLimiteCredito: TCombobox; sProdutor_ID : Integer);
     function Inserir(oCadNegociacao : TCadNegociacao; out sErro : String):Integer;
     function Alterar(oCadNegociacao : TCadNegociacao; out sErro : String):Boolean;
     function Excluir(iCodigo : Integer;sTabela :String; out sErro : String):Boolean;
  end;
implementation

uses
   System.SysUtils;
{ TCadNegociacaoController }

function TCadNegociacaoController.Alterar(oCadNegociacao: TCadNegociacao;
  out sErro: String): Boolean;
begin
  Result := dtmCadNegociacao.Alterar(oCadNegociacao,sErro);
end;

procedure TCadNegociacaoController.CarregarComboboxLimiteCredito(
  cbbLimiteCredito: TCombobox; sProdutor_ID: Integer);
begin
  dtmCadNegociacao.CarregarComboboxLimiteCredito(cbbLimiteCredito,sProdutor_ID)
end;

procedure TCadNegociacaoController.CarregarComboboxProdutor(
  cbbProdutor: TCombobox);
begin
  dtmCadNegociacao.CarregarComboboxProdutor(cbbProdutor);
end;

constructor TCadNegociacaoController.Create;
begin
  dtmCadNegociacao := TdtmCadNegociacao.Create(nil);
end;

destructor TCadNegociacaoController.Destroy;
begin
  FreeAndNil(dtmCadNegociacao);
  inherited;
end;

function TCadNegociacaoController.Excluir(iCodigo: Integer; sTabela: String;
  out sErro: String): Boolean;
begin
  Result := dtmCadNegociacao.Excluir(iCodigo,sTabela,sErro);
end;

function TCadNegociacaoController.Inserir(oCadNegociacao: TCadNegociacao;
  out sErro: String): Integer;
begin
  Result := dtmCadNegociacao.Inserir(oCadNegociacao,sErro);
end;

function TCadNegociacaoController.PesquisarSaldoDiponivel(
  sLimiteCredito_ID: Integer): Double;
begin
  Result := dtmCadNegociacao.PesquisarSaldoDiponivel(sLimiteCredito_ID);
end;

end.
