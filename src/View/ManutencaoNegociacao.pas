unit ManutencaoNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids,uStatusNegociacaoController, uStatusNegociacaoModel;

type
  TfrmManutencaoNegociacao = class(TForm)
    Panel1: TPanel;
    edtCodigoContrato: TEdit;
    btnPesquisar: TBitBtn;
    Label1: TLabel;
    grdPesquisaNegociacao: TStringGrid;
    cbbStatus: TComboBox;
    Label2: TLabel;
    btnAtualizarStatus: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAtualizarStatusClick(Sender: TObject);
  private
    procedure Pesquisar;
    procedure AtualizarStatus;
    function RetornaStatus(iIndex:Integer):TStatusNegociacao;
    procedure Validar;
    procedure ValidarStatus;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencaoNegociacao: TfrmManutencaoNegociacao;

implementation

{$R *.dfm}

uses Rotinas;

procedure TfrmManutencaoNegociacao.btnAtualizarStatusClick(Sender: TObject);
begin
  ValidarStatus;
  AtualizarStatus;
  Pesquisar;
end;

procedure TfrmManutencaoNegociacao.ValidarStatus;
begin
  if not VerificaValorPreenchido(cbbStatus.Text) then
    raise Exception.Create('Favor escolha o status.');
end;

function TfrmManutencaoNegociacao.RetornaStatus(iIndex:Integer):TStatusNegociacao;
begin
  case iIndex of
    0  : result := sAprovada;
    1 : result := sConcluida;
    2 : result := sCancelada;
  end;
end;

procedure TfrmManutencaoNegociacao.AtualizarStatus;
var
  oStatusNegociacaoController : TStatusNegociacaoController;
  sErro: string;
begin
  oStatusNegociacaoController := TStatusNegociacaoController.Create;
  try
    if not oStatusNegociacaoController.AtualizarStatus(RetornaStatus(cbbStatus.ItemIndex),StrToInt(edtCodigoContrato.Text),sErro) then
      raise Exception.Create(sErro);
  finally
    FreeANdNil(oStatusNegociacaoController);
  end;
end;

procedure TfrmManutencaoNegociacao.btnPesquisarClick(Sender: TObject);
begin
  Validar;
  Pesquisar;
end;

procedure TfrmManutencaoNegociacao.Validar;
begin
  if not VerificaValorPreenchido(edtCodigoContrato.Text) then
    raise Exception.Create('Favor preencher o código contrato');
end;

procedure TfrmManutencaoNegociacao.Pesquisar;
var
  oStatusNegociacaoController : TStatusNegociacaoController;
begin
  oStatusNegociacaoController := TStatusNegociacaoController.Create;
  try
    oStatusNegociacaoController.Pesquisar(StrToInt(edtCodigoContrato.Text),grdPesquisaNegociacao)
  finally
    FreeANdNil(oStatusNegociacaoController);
  end;
end;

procedure TfrmManutencaoNegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmManutencaoNegociacao := nil;
  Action := CaFree;
end;

procedure TfrmManutencaoNegociacao.FormShow(Sender: TObject);
begin
  ConfigurargrdPesquisaNegociacao(grdPesquisaNegociacao,8,1);
end;

end.
