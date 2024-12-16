unit uProdutorModel;

interface

uses
  System.SysUtils;

type
  Tprodutor = class
private
    Fid: integer;
    FCpf: String;
    FNome: String;

public
  constructor Create;
  destructor Destroy; override;
  property id: integer read Fid Write Fid;
  property Nome: String read FNome Write FNome;
  property Cpf: String read FCpf Write FCpf;
end;

implementation

{ Tprodutor }

constructor Tprodutor.Create;
begin
  inherited Create;
end;

destructor Tprodutor.Destroy;
begin

  inherited Destroy;
end;

end.
