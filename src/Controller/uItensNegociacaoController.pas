unit uItensNegociacaoController;

interface
uses uDMItensNegociacao, uCAdItensNegociacaoModel, Data.SqlExpr, vcl.Grids,Vcl.StdCtrls;

type
  TCadItensNegociacaoController = class
    public
     constructor Create;
     destructor Destroy; override;
     function Pesquisar(sNegociacao_ID: Integer; var aStringGrid : TStringGrid):Double;
     function Inserir(oItensNegociacao : TCadItensNegociacao; out sErro : String):Boolean;
     function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;
implementation

uses
  system.SysUtils;

{ TLimiteCreditoController }

constructor TCadItensNegociacaoController.Create;
begin
  dtmItensNegociacao := TdtmItensNegociacao.Create(nil);
end;

destructor TCadItensNegociacaoController.Destroy;
begin
  FreeAndNil(dtmItensNegociacao);
  inherited;
end;

function TCadItensNegociacaoController.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  dtmItensNegociacao.Excluir(iCodigo,sErro);
end;

function TCadItensNegociacaoController.Inserir(oItensNegociacao: TCadItensNegociacao;
  out sErro: String): Boolean;
begin
  Result := dtmItensNegociacao.Inserir(oItensNegociacao,sErro);
end;

function TCadItensNegociacaoController.Pesquisar(sNegociacao_ID: Integer;
  var aStringGrid: TStringGrid):Double;
begin
  Result :=  dtmItensNegociacao.Pesquisar(sNegociacao_ID,aStringGrid);
end;

end.
