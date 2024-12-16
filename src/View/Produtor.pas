unit Produtor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Vcl.DBGrids, Vcl.DBCtrls;

type
  TOperacao  = (opNovo,opAlterar,opNavegacao);

  TfrmProdutor = class(TForm)
    Panel1: TPanel;
    pgcProdutor: TPageControl;
    tabPesquisa: TTabSheet;
    tabCadastro: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    edtNome: TEdit;
    Label1: TLabel;
    btnPesquisar: TBitBtn;
    tnbCadastrar: TBitBtn;
    BitBtn2: TBitBtn;
    btnEditar: TBitBtn;
    pnlCadProdutor: TPanel;
    edtNomeCadProdutor: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCpfCadProdutor: TEdit;
    btnGravarClick: TBitBtn;
    pnlVincularDist: TPanel;
    grdLimite: TStringGrid;
    Label5: TLabel;
    edtLimiteCredito: TEdit;
    Label6: TLabel;
    btnVincular: TBitBtn;
    edtIDCad: TEdit;
    Label7: TLabel;
    grdProdutor: TStringGrid;
    cbbDistribuidor: TComboBox;
    btnExcluirLimite: TBitBtn;
    procedure tnbCadastrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClickClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure grdProdutorDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarDistribuidorClick(Sender: TObject);
    procedure btnVincularClick(Sender: TObject);
    procedure btnExcluirLimiteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fOperacao : TOperacao;
    procedure Setup;
    procedure Pesquisar;
    procedure Novo;
    procedure Detalhar;
    procedure CarregarProdutor;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao : TOperacao);
    procedure LimparCampos;
    procedure Editar;
    procedure CarregarComboDistribuidor;
    procedure PesquisarLimiteCredito(sProdutor_ID:Integer);
    function PegarDistribuidorCombo: Integer;
    procedure VincularLimite;
    procedure ExcluirLimiteCredito;
    procedure ValidaCamposProdutor;
    procedure ValidaCamposLimiteCredito;
  public
    { Public declarations }
  end;

var
  frmProdutor: TfrmProdutor;

implementation

{$R *.dfm}

uses uProdutorController, uProdutorModel, Distribuidor,
  uLimiteCreditoController, uLimiteCreditoModel, Rotinas;


procedure TfrmProdutor.Alterar;
var
  oProdutor : TProdutor;
  oProdutorController : TProdutorController;
  sErro: string;
begin
  oProdutor := TProdutor.Create;
  oProdutorController := TProdutorController.Create;
  try

    oProdutor.Nome := edtNomeCadProdutor.Text;
    oProdutor.Cpf := edtCpfCadProdutor.Text;
    oProdutor.id := StrToInt(edtIDCad.Text);

    if not oProdutorController.Alterar(oProdutor,sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oProdutor);
    FreeAndNil(oProdutorController);
  end;
end;

procedure TfrmProdutor.btnGravarClickClick(Sender: TObject);
begin
  ValidaCamposProdutor;
  Gravar;
  CarregarComboDistribuidor;
  HabilitarControles(opAlterar);
end;

procedure TfrmProdutor.ValidaCamposProdutor;
var
  sErro : String;
begin
  if not VerificaValorPreenchido(edtNomeCadProdutor.Text) then
    raise Exception.Create('Preencha o nome do produtor.');

  if not ValidaCPF_CNPJ(edtCpfCadProdutor.Text,sErro) then
    raise Exception.Create('CPFCNPJ inválido. '+sErro);

end;

procedure TfrmProdutor.ValidaCamposLimiteCredito;
var
  sErro : String;
begin
  if not VerificaValorPreenchido(cbbDistribuidor.Text) then
    raise Exception.Create('Escolha um distribuidor.');

  if not ValidaValorMonetario(edtLimiteCredito.Text,sErro) then
    raise Exception.Create('Valor limite inválido. '+sErro);

end;

procedure TfrmProdutor.CarregarComboDistribuidor;
var
  oLimiteController : TLimiteCreditoController;
begin
  oLimiteController := TLimiteCreditoController.Create;
  try
    oLimiteController.CarregarComboboxDistribuidor(cbbDistribuidor);
  finally
    FreeAndNil(oLimiteController);
  end;
end;

procedure TfrmProdutor.BitBtn2Click(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmProdutor.btnAdicionarDistribuidorClick(Sender: TObject);
begin
  if TComponent(frmDistribuidor) = nil then
    frmDistribuidor := TfrmDistribuidor.Create(self);

  frmDistribuidor.ShowModal;
end;

procedure TfrmProdutor.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TfrmProdutor.btnExcluirLimiteClick(Sender: TObject);
begin
  ExcluirLimiteCredito;
end;

procedure TfrmProdutor.ExcluirLimiteCredito;
var
  oLimiteController : TLimiteCreditoController;
  sErro: string;
begin
  oLimiteController := TLimiteCreditoController.Create;
  try
    if grdProdutor.Cells[0,1] = '' then
      raise Exception.Create('Não há Registro para ser excluído.');

    if not oLimiteController.Excluir(StrToIntDef(grdLimite.Cells[0,grdLimite.row],0),sErro) then
      raise Exception.Create(sErro);

    oLimiteController.Pesquisar(strToInt(edtIDCad.Text),grdLimite);

  finally
    FreeAndNil(oLimiteController);
  end;
end;

procedure TfrmProdutor.Editar;
begin
  HabilitarControles(opAlterar);
  Detalhar;
end;

procedure TfrmProdutor.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmProdutor.VincularLimite;
var
  oLimiteController : TLimiteCreditoController;
  oLimiteCredito : TLimiteCredito;
  sErro: string;
begin
  oLimiteController := TLimiteCreditoController.Create;
  oLimiteCredito := TLimiteCredito.Create;
  try
    oLimiteCredito.id := 0;
    oLimiteCredito.LimiteCredito := StrToFloat(edtLimiteCredito.Text);
    oLimiteCredito.Produtor_id := StrToInt(edtIDCad.Text);
    oLimiteCredito.Distribuidor_id := PegarDistribuidorCombo;

    if not oLimiteController.Inserir(oLimiteCredito,sErro) then
      raise Exception.Create(sErro);
  finally
    FreeAndNil(oLimiteController);
    FreeAndNil(oLimiteCredito);
  end;
end;

procedure TfrmProdutor.btnVincularClick(Sender: TObject);
begin
  ValidaCamposLimiteCredito;
  VincularLimite;
  PesquisarLimiteCredito(StrToInt(edtIDCad.Text));
end;

function TfrmProdutor.PegarDistribuidorCombo :Integer;
begin
  Result := Integer(cbbDistribuidor.items.objects[cbbDistribuidor.ItemIndex]);
end;

procedure TfrmProdutor.CarregarProdutor;
var
  oProdutor : TProdutor;
  oProdutorController : TProdutorController;
begin
  oProdutor := TProdutor.Create;
  oProdutorController := TProdutorController.Create;
  try
    oProdutorController.CarregarProdutor(oProdutor,StrToInt(grdProdutor.Cells[0,grdProdutor.row]));
    edtNomeCadProdutor.Text := oProdutor.Nome;
    edtCpfCadProdutor.Text := oProdutor.Cpf;
    edtIDCad.Text := oProdutor.id.ToString;
    PesquisarLimiteCredito(oProdutor.id);
  finally
    FreeAndNil(oProdutor);
    FreeAndNil(oProdutorController);
  end;
end;

procedure TfrmProdutor.PesquisarLimiteCredito(sProdutor_ID:Integer);
var
  oLimiteController : TLimiteCreditoController;
begin
  oLimiteController := TLimiteCreditoController.Create;
  try
    oLimiteController.Pesquisar(sProdutor_ID,grdLimite);
  finally
    FreeAndNil(oLimiteController);
  end;
end;


procedure TfrmProdutor.Detalhar;
begin
  if grdProdutor.Cells[0,1] = '' then
  begin
    HabilitarControles(opNavegacao);
    raise Exception.Create('Não há Registro para ser detalhado.');
  end;
  CarregarProdutor;
  CarregarComboDistribuidor;
  HabilitarControles(opAlterar);
end;

procedure TfrmProdutor.Excluir;
var
  oProdutorController : TProdutorController;
  sErro: string;
begin
  oProdutorController := TProdutorController.Create;
  try
    if grdProdutor.Cells[0,1] = '' then
      raise Exception.Create('Não há Registro para ser excluído.');

    if not oProdutorController.Excluir(StrToIntDef(grdProdutor.Cells[0,grdProdutor.row],0),sErro) then
      raise Exception.Create(sErro);

    oProdutorController.Pesquisar(EmptyStr,grdProdutor);
  finally
    FreeAndNil(oProdutorController);
  end;
end;

procedure TfrmProdutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmProdutor := nil;
  Action := CaFree;
end;

procedure TfrmProdutor.FormCreate(Sender: TObject);
begin
  Setup;
end;


procedure TfrmProdutor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NextDlgCtl,0,0);
  end;
end;

procedure TfrmProdutor.FormShow(Sender: TObject);
begin
  ConfigurargrdLimiteCredito(grdLimite,3,1);
  ConfigurargrdProdutor(grdProdutor,3,1);
end;

procedure TfrmProdutor.Gravar;
var
  oProdutorController : TProdutorController;
begin
  case FOperacao of
    opNovo: Inserir;
    opAlterar: Alterar;
  end;
  oProdutorController := TProdutorController.Create;
  try
    oProdutorController.Pesquisar(EmptyStr,grdProdutor);
  finally
    FreeAndNil(oProdutorController);
  end;
end;

procedure TfrmProdutor.grdProdutorDblClick(Sender: TObject);
begin
 HabilitarControles(opAlterar);
 Detalhar;
end;

procedure TfrmProdutor.HabilitarControles(aOperacao: TOperacao);
begin
  fOperacao := aOperacao;
  case aOperacao of
    opNovo:
    begin
      pgcProdutor.ActivePage := tabCadastro;
      pnlCadProdutor.Enabled := True;
      pnlVincularDist.Enabled := false;
    end;
    opAlterar:
    begin
      pgcProdutor.ActivePage := tabCadastro;
      pnlCadProdutor.Enabled := True;
      pnlVincularDist.Enabled := True;
    end;
    opNavegacao :
    begin
      pgcProdutor.ActivePage := tabPesquisa;
    end;
  end;

end;

procedure TfrmProdutor.Inserir;
var
  oProdutor : TProdutor;
  oProdutorController : TProdutorController;
  sErro: string;
  sResult: Integer;
begin
  oProdutor := TProdutor.Create;
  oProdutorController := TProdutorController.Create;
  try

    oProdutor.Nome := edtNomeCadProdutor.Text;
    oProdutor.Cpf := edtCpfCadProdutor.Text;
    oProdutor.id := 0;

    sResult := oProdutorController.Inserir(oProdutor,sErro);

    if sResult = 0 then
      raise Exception.Create(sErro);

    edtIDCad.Text := sResult.ToString;
  finally
    FreeAndNil(oProdutor);
    FreeAndNil(oProdutorController);
  end;
end;

procedure TfrmProdutor.Listar;
begin
  pgcProdutor.ActivePage := tabPesquisa;
end;

procedure TfrmProdutor.Novo;
begin
  LimparCampos;
  HabilitarControles(opNovo)
end;

procedure TfrmProdutor.LimparCampos;
begin
  edtNomeCadProdutor.Clear;
  edtCpfCadProdutor.Clear;
  edtIDCad.Clear;
end;

procedure TfrmProdutor.Pesquisar;
var
  oProdutor : TProdutorController;
begin
  oProdutor := TProdutorController.Create;
  try
    oProdutor.Pesquisar(edtNome.Text,grdProdutor);
  finally
    FreeANdNil(oProdutor);
  end;
end;

procedure TfrmProdutor.Setup;
begin
  pgcProdutor.ActivePage := tabPesquisa;
end;

procedure TfrmProdutor.tnbCadastrarClick(Sender: TObject);
begin
  Novo;
end;

end.
