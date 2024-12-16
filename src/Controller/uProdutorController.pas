unit uProdutorController;



interface

uses uDMProdutor, uProdutorModel, Data.SqlExpr, vcl.Grids;

type
  TProdutorController = class
    public
     constructor Create;
     destructor Destroy; override;
     procedure Pesquisar(sNome: string; var aStringGrid : TStringGrid);
     procedure CarregarProdutor(oProdutor : TProdutor; iCodigo : Integer);
     function Inserir(oProdutor : TProdutor; out sErro : String):Integer;
     function Alterar(oProdutor : TProdutor; out sErro : String):Boolean;
     function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;

implementation

uses
  System.SysUtils;

{ TProdutorController }

function TProdutorController.Alterar(oProdutor: TProdutor;
  out sErro: String): Boolean;
begin
  Result := dtmProdutor.Alterar(oProdutor,sErro);
end;

procedure TProdutorController.CarregarProdutor(oProdutor: TProdutor;
  iCodigo: Integer);
begin
  dtmProdutor.CarregarProdutor(oProdutor,iCodigo);
end;

constructor TProdutorController.Create;
begin
  dtmProdutor := TdtmProdutor.Create(nil);
end;

destructor TProdutorController.Destroy;
begin
  FreeAndNil(dtmProdutor);
  inherited;
end;

function TProdutorController.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := dtmProdutor.Excluir(iCodigo,sErro);
end;

function TProdutorController.Inserir(oProdutor: TProdutor;
  out sErro: String): Integer;
begin
  Result := dtmProdutor.Inserir(oProdutor,sErro);
end;

procedure TProdutorController.Pesquisar(sNome: string;
  var aStringGrid: TStringGrid);
begin
  dtmProdutor.Pesquisar(sNome,aStringGrid);
end;

end.
