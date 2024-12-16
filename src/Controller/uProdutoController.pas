unit uProdutoController;

interface

uses uDMProduto, uProdutoModel, Data.SqlExpr, vcl.Grids,Vcl.StdCtrls;

type
  TProdutoController = class
    public
     constructor Create;
     destructor Destroy; override;
     procedure Pesquisar(sNome: string; var aStringGrid : TStringGrid);
     procedure CarregarProduto(oProduto : TProduto; iCodigo : Integer);
     function Inserir(oProduto : TProduto; out sErro : String):Boolean;
     function Alterar(oProduto : TProduto; out sErro : String):Boolean;
     function Excluir(iCodigo : Integer; out sErro : String):Boolean;
     procedure CarregarComboboxProdutos(cbbProdutos: TCombobox);
  end;
implementation

uses
  System.SysUtils;

{ TProdutoController }

function TProdutoController.Alterar(oProduto: TProduto;
  out sErro: String): Boolean;
begin
  Result := dtmProduto.Alterar(oProduto,sErro);
end;

procedure TProdutoController.CarregarComboboxProdutos(cbbProdutos: TCombobox);
begin
  dtmProduto.CarregarComboboxProdutos(cbbProdutos);
end;

procedure TProdutoController.CarregarProduto(oProduto: TProduto;
  iCodigo: Integer);
begin
  dtmProduto.CarregarProduto(oProduto,iCodigo);
end;

constructor TProdutoController.Create;
begin
  dtmProduto := TdtmProduto.Create(nil)
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(dtmProduto);
  inherited;
end;

function TProdutoController.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := dtmProduto.Excluir(iCodigo,sErro);
end;

function TProdutoController.Inserir(oProduto: TProduto;
  out sErro: String): Boolean;
begin
  Result := dtmProduto.Inserir(oProduto,sErro);
end;

procedure TProdutoController.Pesquisar(sNome: string;
  var aStringGrid: TStringGrid);
begin
  dtmProduto.Pesquisar(sNome,aStringGrid);
end;

end.
