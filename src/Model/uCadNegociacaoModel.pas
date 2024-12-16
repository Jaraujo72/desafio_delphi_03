unit uCadNegociacaoModel;

interface
 uses
  System.SysUtils;
type
  TCadNegociacao = class
private
    Fid: integer;
    FLimiteCredito: Double;
    FProdutor_id: Integer;
    FVAlorTotalContrato: Double;
    FData_Inicio: TDateTime;
    FSituacao: String;
    FLimiteCredito_ID: integer;

public
  constructor Create;
  destructor Destroy; override;
  property id: integer read Fid Write Fid;
  property Data_Inicio: TDateTime read FData_Inicio Write FData_Inicio;
  property Produtor_id: Integer read FProdutor_id write FProdutor_ID;
  property Situacao: String read FSituacao write FSituacao;
  property ValorTotalContrato : Double read FVAlorTotalContrato write FValorTotalContrato;
  property LimiteCredito_ID : integer read FLimiteCredito_ID write FLimiteCredito_Id;

end;
implementation

{ TCadNegociacao }

constructor TCadNegociacao.Create;
begin
  inherited Create;
end;

destructor TCadNegociacao.Destroy;
begin

  inherited Destroy;
end;

end.
