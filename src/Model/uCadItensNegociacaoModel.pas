unit uCadItensNegociacaoModel;

interface
 uses
  System.SysUtils;
type
  TCadItensNegociacao = class
private
    Fid: integer;
    FProduto_id: Integer;
    FNegociacao_id :Integer;
    FQuantidade :Integer;
public
  constructor Create;
  destructor Destroy; override;
  property id: integer read Fid Write Fid;
  property Produto_id: Integer read FProduto_id write FProduto_ID;
  property Negociacao_id: Integer read FNegociacao_id write FNegociacao_id;
  property Quantidade: Integer read FQuantidade write FQuantidade;
end;
implementation

{ TCadItensNegociacao }

constructor TCadItensNegociacao.Create;
begin
  inherited Create;
end;

destructor TCadItensNegociacao.Destroy;
begin

  inherited Destroy;
end;

end.
