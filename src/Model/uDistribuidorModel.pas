unit uDistribuidorModel;

interface

uses
  System.SysUtils;
type
  TDistribuidor = class
  private
    FCNPJ: String;
    Fid: integer;
    FNome: String;

  public
  constructor Create;
  destructor Destroy; override;
  property id: integer read Fid Write Fid;
  property Nome: String read FNome Write FNome;
  property CNPJ: String read FCNPJ Write FCNPJ;
end;

implementation

{ TDistribuidor }

constructor TDistribuidor.Create;
begin
  inherited Create;
end;

destructor TDistribuidor.Destroy;
begin
  inherited Destroy;
end;

end.
