unit uStatusNegociacaoController;

interface
 uses Data.SqlExpr, vcl.Grids,Vcl.StdCtrls, uStatusNegociacaoModel,
  uDMStatusNegociacao, system.SysUtils;
 type
  TStatusNegociacaoController = class
    public
     constructor Create;
     destructor Destroy; override;
     procedure Pesquisar(iNegociacaoID: integer; var aStringGrid : TStringGrid);
     function AtualizarStatus(aStatus : TStatusNegociacao;iNegociacaoID:integer; sErro :STring):Boolean;
  end;
implementation


{ TStatusNegociacaoController }

function TStatusNegociacaoController.AtualizarStatus(aStatus: TStatusNegociacao;
  iNegociacaoID: integer; sErro: STring): Boolean;
begin
  Result := dtmStatusNegociacao.AtualizarStatus(aStatus,iNegociacaoID,sErro);
end;

constructor TStatusNegociacaoController.Create;
begin
  dtmStatusNegociacao := TdtmStatusNegociacao.Create(nil);
end;

destructor TStatusNegociacaoController.Destroy;
begin
  FreeAndNil(dtmStatusNegociacao);
  inherited;
end;

procedure TStatusNegociacaoController.Pesquisar(iNegociacaoID: integer;
  var aStringGrid: TStringGrid);
begin
  dtmStatusNegociacao.Pesquisar(iNegociacaoID,aStringGrid);
end;

end.
