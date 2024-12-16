unit uLimiteCreditoController;

interface

uses uDMLimiteCredito, uLimiteCreditoModel, Data.SqlExpr, vcl.Grids,Vcl.StdCtrls;

type
  TLimiteCreditoController = class
    public
     constructor Create;
     destructor Destroy; override;
     procedure Pesquisar(sProdutor_ID: integer; var aStringGrid : TStringGrid);
     procedure CarregarComboboxDistribuidor(cbbDistribuidor: TCombobox);
     function Inserir(oLimiteCredito : TLimiteCredito; out sErro : String):Boolean;
     function Excluir(iCodigo : Integer; out sErro : String):Boolean;
  end;
implementation

uses
  System.SysUtils;

{ TLimiteCreditoController }

procedure TLimiteCreditoController.CarregarComboboxDistribuidor(
  cbbDistribuidor: TCombobox);
begin
  dtmLimiteCredito.CarregarComboboxDistribuidor(cbbDistribuidor)
end;

constructor TLimiteCreditoController.Create;
begin
  dtmLimiteCredito := TdtmLimiteCredito.Create(nil)
end;

destructor TLimiteCreditoController.Destroy;
begin
  FreeAndNil(dtmLimiteCredito);
  inherited;
end;

function TLimiteCreditoController.Excluir(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := dtmLimiteCredito.Excluir(iCodigo,sErro)
end;

function TLimiteCreditoController.Inserir(oLimiteCredito: TLimiteCredito;
  out sErro: String): Boolean;
begin
  Result := dtmLimiteCredito.Inserir(oLimiteCredito,sErro)
end;

procedure TLimiteCreditoController.Pesquisar(sProdutor_ID: integer;
  var aStringGrid: TStringGrid);
begin
  dtmLimiteCredito.Pesquisar(sProdutor_ID,aStringGrid)
end;

end.
