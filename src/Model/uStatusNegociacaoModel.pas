unit uStatusNegociacaoModel;

interface
  type TStatusNegociacao = (sAprovada, sConcluida, sCancelada);

  type TNegociacaoStatus = class

  private
    FID: Integer;
    FStatus: TStatusNegociacao;
    FDataCancelamento: TDateTime;
    FDataAprovacao: TDateTime;
    FDataConclusao: TDateTime;
  public
    constructor Create;
    destructor  Destroy; override;
    property ID: Integer read FID write FID;
    property Status: TStatusNegociacao read FStatus write FStatus;
    property DataAprovacao : TDateTime read FDataAprovacao write FDataAprovacao;
    property DataCancelamento : TDateTime read FDataCancelamento write FDataCancelamento;
    property DataConclusao : TDateTime read FDataConclusao write FDataConclusao;
  end;
implementation

{ TNegociacaoStatus }


constructor TNegociacaoStatus.Create;
begin
  inherited create;
end;

destructor TNegociacaoStatus.Destroy;
begin

  inherited;
end;

end.
