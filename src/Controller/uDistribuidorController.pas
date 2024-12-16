unit uDistribuidorController;

interface

uses uDMDistribuidor, uDistribuidorModel, Data.SqlExpr, vcl.Grids;

type
  TDistribuidorController = class
    public
     constructor Create;
     destructor Destroy; override;
     procedure Pesquisar(sNome: string; var aStringGrid : TStringGrid);
     procedure CarregarDistribuidor(oDistribuidor : TDistribuidor; iCodigo : Integer);
     function Inserir(oDistribuidor : TDistribuidor; out sErro : String):Boolean;
     function Alterar(oDistribuidor : TDistribuidor; out sErro : String):Boolean;
     function Excluir(idDistribuidor : Integer; out sErro : String):Boolean;
  end;

implementation

uses
  System.SysUtils;

{ TProdutorController }

function TDistribuidorController.Alterar(oDistribuidor: TDistribuidor;
  out sErro: String): Boolean;
begin
  Result := dtmDistribuidor.Alterar(oDistribuidor,sErro);
end;

procedure TDistribuidorController.CarregarDistribuidor(oDistribuidor: TDistribuidor;
  iCodigo: Integer);
begin
  dtmDistribuidor.CarregarDistribuidor(oDistribuidor,iCodigo);
end;

constructor TDistribuidorController.Create;
begin
  dtmDistribuidor := TdtmDistribuidor.Create(nil);
end;

destructor TDistribuidorController.Destroy;
begin
  FreeAndNil(dtmDistribuidor);
  inherited;
end;

function TDistribuidorController.Excluir(idDistribuidor: Integer;
  out sErro: String): Boolean;
begin
  Result := dtmDistribuidor.Excluir(idDistribuidor,sErro);
end;

function TDistribuidorController.Inserir(oDistribuidor: TDistribuidor;
  out sErro: String): Boolean;
begin
  Result := dtmDistribuidor.Inserir(oDistribuidor,sErro);
end;

procedure TDistribuidorController.Pesquisar(sNome: string;
  var aStringGrid: TStringGrid);
begin
  dtmDistribuidor.Pesquisar(sNome,aStringGrid);
end;

end.
