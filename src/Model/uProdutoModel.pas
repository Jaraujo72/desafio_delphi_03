unit uProdutoModel;

interface
uses
  System.SysUtils;

type
  Tproduto = class
private
    Fid: integer;
    FDescricao: String;
    FPreco: Double;

public
  constructor Create;
  destructor Destroy; override;
  property id: integer read Fid Write Fid;
  property Descricao: String read FDescricao Write FDescricao;
  property Preco: Double read FPreco Write FPreco;
end;
implementation

{ Tproduto }

constructor Tproduto.Create;
begin
  inherited Create;
end;

destructor Tproduto.Destroy;
begin

  inherited Destroy;
end;

end.
