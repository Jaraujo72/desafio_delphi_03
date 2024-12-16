unit uLimiteCreditoModel;

interface

uses
  System.SysUtils;
type
  TLimiteCredito = class
private
    FDistribuidor_id: Integer;
    Fid: integer;
    FLimiteCredito: Double;
    FProdutor_id: Integer;

public
  constructor Create;
  destructor Destroy; override;
  property id: integer read Fid Write Fid;
  property LimiteCredito: Double read FLimiteCredito Write FLimiteCredito;
  property Distribuidor_id: Integer read FDistribuidor_id Write FDistribuidor_id;
  property Produtor_id: Integer read FProdutor_id write FProdutor_ID;
end;
implementation

{ TLimiteCredito }

constructor TLimiteCredito.Create;
begin
  Inherited Create;
end;

destructor TLimiteCredito.Destroy;
begin

  inherited Destroy;
end;

end.
