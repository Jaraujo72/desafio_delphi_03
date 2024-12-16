unit Distribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls;

type
  TOperacao  = (opNovo,opAlterar,opNavegacao);

  TfrmDistribuidor = class(TForm)
    Panel1: TPanel;
    pgcDistribuidor: TPageControl;
    tabPesquisa: TTabSheet;
    Panel2: TPanel;
    tabCadastro: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtNomeCadDistribuidor: TEdit;
    edtCpfCadDistribuidorr: TEdit;
    btnGravarClick: TBitBtn;
    edtIDCad: TEdit;
    Label1: TLabel;
    edtDistribuidor: TEdit;
    btnPesquisar: TBitBtn;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    grdDistribuidor: TStringGrid;
    tnbCadastrar: TBitBtn;
    procedure btnGravarClickClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tnbCadastrarClick(Sender: TObject);
    procedure grdDistribuidorDblClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fOperacao : TOperacao;
    procedure Setup;
    procedure Pesquisar;
    procedure Novo;
    procedure Detalhar;
    procedure CarregarDistribuidor;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure HabilitarControles(aOperacao : TOperacao);
    procedure Gravar(aOperacao: TOperacao);
    procedure LimparCampos;
    procedure Editar;
    procedure ValidaCampos;
  public
    { Public declarations }

  end;

var
  frmDistribuidor: TfrmDistribuidor;

implementation

{$R *.dfm}

uses uDistribuidorController, uDistribuidorModel, Rotinas;

{ TfrmDistribuidor }

procedure TfrmDistribuidor.Alterar;
var
  oDistribuidor : TDistribuidor;
  oDistribuidorController : TDistribuidorController;
  sErro: string;
begin
  oDistribuidor := TDistribuidor.Create;
  oDistribuidorController := TDistribuidorController.Create;
  try

    oDistribuidor.Nome := edtNomeCadDistribuidor.Text;
    oDistribuidor.CNPJ := edtCpfCadDistribuidorr.Text;
    oDistribuidor.id := StrToInt(edtIDCad.Text);

    if not oDistribuidorController.Alterar(oDistribuidor,sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oDistribuidor);
    FreeAndNil(oDistribuidorController);
  end;
end;

procedure TfrmDistribuidor.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TfrmDistribuidor.Editar;
begin
  HabilitarControles(opAlterar);
  Detalhar;
end;

procedure TfrmDistribuidor.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmDistribuidor.btnGravarClickClick(Sender: TObject);
begin
  ValidaCampos;
  Gravar(opNovo);
end;

procedure TfrmDistribuidor.ValidaCampos;
var
  sErro : String;
begin
  if not VerificaValorPreenchido(edtNomeCadDistribuidor.Text) then
    raise Exception.Create('Preencha o nome do ditribuidor.');

  if not ValidaCPF_CNPJ(edtCpfCadDistribuidorr.Text,sErro) then
    raise Exception.Create('CPFCNPJ inválido. '+sErro);

end;

procedure TfrmDistribuidor.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmDistribuidor.CarregarDistribuidor;
var
  oDistribuidor : TDistribuidor;
  oDistribuidorController : TDistribuidorController;
begin
  oDistribuidor := TDistribuidor.Create;
  oDistribuidorController := TDistribuidorController.Create;
  try
    oDistribuidorController.CarregarDistribuidor(oDistribuidor,StrToInt(grdDistribuidor.Cells[0,grdDistribuidor.row]));
    edtNomeCadDistribuidor.Text := oDistribuidor.Nome;
    edtCpfCadDistribuidorr.Text := oDistribuidor.CNPJ;
    edtIDCad.Text := oDistribuidor.id.ToString;
  finally
    FreeAndNil(oDistribuidor);
    FreeAndNil(oDistribuidorController);
  end;
end;

procedure TfrmDistribuidor.Detalhar;
begin
 if grdDistribuidor.Cells[0,1] = '' then
  begin
    HabilitarControles(opNavegacao);
    raise Exception.Create('Não há Registro para ser detalhado.');
  end;
  CarregarDistribuidor;
  HabilitarControles(opAlterar);
end;

procedure TfrmDistribuidor.Excluir;
var
  oDistribuidorController : TDistribuidorController;
  sErro: string;
begin
  oDistribuidorController := TDistribuidorController.Create;
  try
    if grdDistribuidor.Cells[0,1] = '' then
      raise Exception.Create('Não há Registro para ser excluído.');

    if not oDistribuidorController.Excluir(StrToIntDef(grdDistribuidor.Cells[0,grdDistribuidor.row],0),sErro) then
      raise Exception.Create(sErro);

    oDistribuidorController.Pesquisar(EmptyStr,grdDistribuidor);
  finally
    FreeAndNil(oDistribuidorController);
  end;
end;

procedure TfrmDistribuidor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmDistribuidor := nil;
  Action := CaFree;
end;

procedure TfrmDistribuidor.FormShow(Sender: TObject);
begin
  ConfigurargrdDistribuidor(grdDistribuidor,3,1);
end;

procedure TfrmDistribuidor.Gravar(aOperacao: TOperacao);
var
  oDistribuidorController : TDistribuidorController;
begin
  case aOperacao of
    opNovo: Inserir;
    opAlterar: Alterar;
  end;
  oDistribuidorController := TDistribuidorController.Create;
  try
    oDistribuidorController.Pesquisar(EmptyStr,grdDistribuidor);
  finally
    FreeAndNil(oDistribuidorController);
  end;
end;


procedure TfrmDistribuidor.grdDistribuidorDblClick(Sender: TObject);
begin
 HabilitarControles(opAlterar);
 Detalhar;
end;

procedure TfrmDistribuidor.HabilitarControles(aOperacao: TOperacao);
begin
  fOperacao := aOperacao;
  case aOperacao of
    opNovo:
    begin
      pgcDistribuidor.ActivePage := tabCadastro;
    end;
    opAlterar:
    begin
      pgcDistribuidor.ActivePage := tabCadastro;
    end;
    opNavegacao :
    begin
      pgcDistribuidor.ActivePage := tabPesquisa;
    end;
  end;
end;

procedure TfrmDistribuidor.Inserir;
var
  oDistribuidor : TDistribuidor;
  oDistribuidorController : TDistribuidorController;
  sErro: string;
begin
  oDistribuidor := TDistribuidor.Create;
  oDistribuidorController := TDistribuidorController.Create;
  try

    oDistribuidor.Nome := edtNomeCadDistribuidor.Text;
    oDistribuidor.CNPJ := edtCpfCadDistribuidorr.Text;
    oDistribuidor.id := 0;

    if not oDistribuidorController.Inserir(oDistribuidor,sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oDistribuidor);
    FreeAndNil(oDistribuidorController);
  end;

end;

procedure TfrmDistribuidor.LimparCampos;
begin
  edtNomeCadDistribuidor.Clear;
  edtCpfCadDistribuidorr.Clear;
end;

procedure TfrmDistribuidor.Listar;
begin
 pgcDistribuidor.ActivePage := tabPesquisa;
end;

procedure TfrmDistribuidor.Novo;
begin
  LimparCampos;
  HabilitarControles(opNovo)
end;

procedure TfrmDistribuidor.Pesquisar;
var
  oDistribuidor : TDistribuidorController;
begin
  oDistribuidor := TDistribuidorController.Create;
  try
    oDistribuidor.Pesquisar(edtDistribuidor.Text,grdDistribuidor);
  finally
    FreeANdNil(oDistribuidor);
  end;
end;

procedure TfrmDistribuidor.Setup;
begin
 Listar;
end;

procedure TfrmDistribuidor.tnbCadastrarClick(Sender: TObject);
begin
  Novo;
end;

end.
