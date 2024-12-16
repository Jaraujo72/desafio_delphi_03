unit CadNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin;

type
  TOperacao  = (opNovo,opAlterar,opFinalizar,opEditar);

  TfrmCadNegociacao = class(TForm)
    Panel1: TPanel;
    pgcProdutor: TPageControl;
    tabCadastro: TTabSheet;
    Panel3: TPanel;
    pnlCadNegociacao: TPanel;
    btnGravar: TBitBtn;
    edtIDCad: TEdit;
    pnlItens: TPanel;
    Label5: TLabel;
    grdItensNegociacao: TStringGrid;
    btnVincular: TBitBtn;
    cbbProduto: TComboBox;
    btnExcluirProduto: TBitBtn;
    cbbProdutor: TComboBox;
    Label1: TLabel;
    cbbLimiteCredito: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    pnlTop: TPanel;
    btnIniciar: TBitBtn;
    Panel8: TPanel;
    Panel13: TPanel;
    Label4: TLabel;
    edtLimiteDisponivel: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    edtTotalContrato: TEdit;
    btnFinalizar: TBitBtn;
    btnDesistirNegociacao: TBitBtn;
    edtQtd: TSpinEdit;
    Label8: TLabel;
    lblStatus: TLabel;
    btnEditar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnVincularClick(Sender: TObject);
    procedure btnDesistirNegociacaoClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure cbbProdutorChange(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    fOperacao : TOperacao;
    FSaldoDisponivel,
    FTotalContrato : Double;
    procedure HabilitarControles(aOperacao : TOperacao);
    procedure CarregarComboProdutor;
    procedure CarregarComboLimiteCredito(sProdutor_ID:Integer);
    function PegarProdutorCombo: Integer;
    procedure Alterar;
    procedure Inserir;
    procedure Gravar;
    function PegarLimiteCreditoCombo: Integer;
    procedure VerificarSaldoDisponivel;
    procedure CarregarComboProdutos;
    procedure VincularItem;
    procedure PesquisarItem;
    function PegarProdutoIDCombo: Integer;
    procedure ExcluirItemNegociacao;
    function VerificarLimiteNegociacao: Boolean;
    procedure AtualizarStatus(sCaption:String);
    procedure LimparCampos;
    function VerificarItemIncluso: Boolean;
    procedure ValidarCampos;
    procedure ValidaCampoVinculo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNegociacao: TfrmCadNegociacao;

implementation

{$R *.dfm}

uses uCadNegociacaoController, uCadNegociacaoModel, uProdutoController,
  uCadItensNegociacaoModel, uItensNegociacaoController, Rotinas;

procedure TfrmCadNegociacao.Alterar;
var
  oCadNegociacao : TCadNegociacao;
  oCadNegociacaoController : TCadNegociacaoController;
  sErro: string;
  sResult: Integer;
begin
  oCadNegociacao := TCadNegociacao.Create;
  oCadNegociacaoController := TCadNegociacaoController.Create;
  try

    oCadNegociacao.Situacao := 'Pendente';

    oCadNegociacao.Produtor_id := PegarProdutorCombo;
    oCadNegociacao.LimiteCredito_ID := PegarLimiteCreditoCombo;

    oCadNegociacao.id := StrToInt(edtIDCad.Text);
    oCadNegociacao.Data_Inicio := now;
    oCadNegociacao.ValorTotalContrato := FTotalContrato;

    if not oCadNegociacaoController.Alterar(oCadNegociacao,sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oCadNegociacao);
    FreeAndNil(oCadNegociacaoController);
  end;
end;

procedure TfrmCadNegociacao.btnDesistirNegociacaoClick(Sender: TObject);
begin
  if VerificarLimiteNegociacao then
  begin
    HabilitarControles(opFinalizar);
  end
  else
  begin
    ShowMessage('Negociação inválida');
  end;
end;

procedure TfrmCadNegociacao.btnEditarClick(Sender: TObject);
begin
  HabilitarControles(opAlterar);
end;

procedure TfrmCadNegociacao.btnExcluirProdutoClick(Sender: TObject);
begin
  ExcluirItemNegociacao;
  PesquisarItem;
end;

procedure TfrmCadNegociacao.ExcluirItemNegociacao;
var
  oItensNegociacaoController : TCadItensNegociacaoController;
  vErro : String;
begin
  oItensNegociacaoController := TCadItensNegociacaoController.Create;
  try
    if grdItensNegociacao.Cells[0,1] = '' then
      raise Exception.Create('Não há Registro para ser excluído.');

    if not oItensNegociacaoController.Excluir(StrToIntDef(grdItensNegociacao.Cells[0,grdItensNegociacao.row],0),vErro) then
      raise Exception.Create(vErro);

  finally
    FreeAndNil(oItensNegociacaoController);
  end;
end;

function TfrmCadNegociacao.VerificarLimiteNegociacao:Boolean;
begin
  Result := FSaldoDisponivel >= FTotalContrato;
end;

function TfrmCadNegociacao.VerificarItemIncluso:Boolean;
begin
  Result :=  grdItensNegociacao.Cells[0,1] <> '';
end;

procedure TfrmCadNegociacao.btnFinalizarClick(Sender: TObject);
begin
  if VerificarLimiteNegociacao then
  begin
    if VerificarItemIncluso then
    begin
      Alterar;
      HabilitarControles(opFinalizar);
      AtualizarStatus('Status Pendente');
    end
    else
    begin
      ShowMessage('Negociação sem produto adicionado!');
    end;
  end
  else
  begin
    ShowMessage('Não foi possível finalizar limite insuficiente!');
  end;
end;

procedure TfrmCadNegociacao.ValidarCampos;
begin
  if not VerificaValorPreenchido(cbbProdutor.Text) then
    raise Exception.Create('Informar um produtor');

  if not VerificaValorPreenchido(cbbLimiteCredito.Text) then
    raise Exception.Create('Informar um distribuidor');

end;

procedure TfrmCadNegociacao.btnGravarClick(Sender: TObject);
begin
  ValidarCampos;
  Gravar;
  VerificarSaldoDisponivel;
  AtualizarStatus('Status Aguardando Finalizar');
  HabilitarControles(opAlterar);
end;

procedure TfrmCadNegociacao.AtualizarStatus(sCaption:String);
begin
  lblStatus.Caption := SCaption;
end;

procedure TfrmCadNegociacao.VerificarSaldoDisponivel;
var
  oCadNegociacaoController : TCadNegociacaoController;
  vLimiteCreditoID : Integer;
begin
  oCadNegociacaoController := TCadNegociacaoController.Create;
  try
    vLimiteCreditoID := PegarLimiteCreditoCombo;

    FSaldoDisponivel := oCadNegociacaoController.PesquisarSaldoDiponivel(vLimiteCreditoID);

    edtLimiteDisponivel.Text := 'R$ '+FormatFloat('.,00',FSaldoDisponivel);
  finally
    FreeAndNil(oCadNegociacaoController);
  end;
end;


procedure TfrmCadNegociacao.btnIniciarClick(Sender: TObject);
begin
  HabilitarControles(opNovo);
end;

procedure TfrmCadNegociacao.LimparCampos;
begin
  cbbProdutor.Clear;
  cbbLimiteCredito.Clear;
  cbbProduto.Clear;
  edtQtd.Value := 1;
  edtLimiteDisponivel.Text := 'R$ 0,00';
  edtTotalContrato.Text := 'R$ 0,00';
  ConfigurargrdItensNegociacao(grdItensNegociacao,4,1);
end;

procedure TfrmCadNegociacao.ValidaCampoVinculo;
begin
  if not VerificaValorPreenchido(cbbProduto.Text) then
    raise Exception.Create('Escolha Produto.');
end;

procedure TfrmCadNegociacao.btnVincularClick(Sender: TObject);
begin
  ValidaCampoVinculo;
  VincularItem;
  PesquisarItem;
end;

procedure TfrmCadNegociacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerificarLimiteNegociacao then
  begin
    frmCadNegociacao := nil;
    Action := Cafree;
  end
  else
  begin
    ShowMessage('Negociação inválida');
    Action := caNone;
  end;
end;

procedure TfrmCadNegociacao.FormShow(Sender: TObject);
begin
  ConfigurargrdItensNegociacao(grdItensNegociacao,4,1);
  AtualizarStatus('');
end;

procedure TfrmCadNegociacao.VincularItem;
var
  oItensNegociacao : TCadItensNegociacao;
  oItensNegociacaoController : TCadItensNegociacaoController;
  vIDProduto: Integer;
  vErro : String;
begin
  oItensNegociacao := TCadItensNegociacao.Create;
  oItensNegociacaoController := TCadItensNegociacaoController.Create;
  try
    vIDProduto := PegarProdutoIDCombo;
    oItensNegociacao.id := 0;
    oItensNegociacao.Produto_id := vIDProduto;
    oItensNegociacao.Negociacao_id := StrToInt(edtIDCad.Text);
    oItensNegociacao.Quantidade := StrToInt(edtQtd.Text);

    if not oItensNegociacaoController.Inserir(oItensNegociacao,vErro) then
      raise Exception.Create(vErro);

  finally
    FreeAndNil(oItensNegociacao);
    FreeAndNil(oItensNegociacaoController);
  end;
end;

procedure TfrmCadNegociacao.PesquisarItem;
var
  oItensNegociacaoController : TCadItensNegociacaoController;
begin
  oItensNegociacaoController := TCadItensNegociacaoController.Create;
  try
    FTotalContrato := oItensNegociacaoController.Pesquisar(StrToInt(edtIDCad.Text),grdItensNegociacao);
    edtTotalContrato.Text := 'R$ '+FormatFloat('.,00',FTotalContrato);
  finally
    FreeAndNil(oItensNegociacaoController);
  end;
end;

procedure TfrmCadNegociacao.Gravar;
begin
  case FOperacao of
    opNovo: Inserir;
    opAlterar: Alterar;
    opEditar: Alterar;
  end;
end;

procedure TfrmCadNegociacao.HabilitarControles(aOperacao: TOperacao);
begin
  fOperacao := aOperacao;
  case aOperacao of
    opNovo:
    begin
      LimparCampos;
      pnlCadNegociacao.Enabled      := True;
      btnGravar.Enabled             := True;
      pnlItens.Enabled              := false;
      btnIniciar.Enabled            := false;
      btnVincular.Enabled           := false;
      AtualizarStatus('');
      CarregarComboProdutor;
    end;
    opAlterar:
    begin
      pnlCadNegociacao.Enabled      := True;
      pnlItens.Enabled              := true;
      btnGravar.Enabled             := True;
      btnVincular.Enabled           := true;
      btnExcluirProduto.Enabled     := true;
      btnDesistirNegociacao.Enabled := true;
      btnFinalizar.Enabled          := true;
      btnIniciar.Enabled            := false;
      CarregarComboProdutos;
    end;
    opFinalizar:
    begin
      btnEditar.Enabled := True;
      btnIniciar.Enabled := True;

      pnlTop.Enabled           := True;
      pnlCadNegociacao.Enabled := False;
      pnlItens.Enabled         := False;
      btnGravar.Enabled        := False;
      btnFinalizar.Enabled     := false;

      btnVincular.Enabled           := false;
      btnExcluirProduto.Enabled     := false;
      btnDesistirNegociacao.Enabled := false;
    end;
  end;
end;

procedure TfrmCadNegociacao.Inserir;
var
  oCadNegociacao : TCadNegociacao;
  oCadNegociacaoController : TCadNegociacaoController;
  sErro: string;
  sResult: Integer;
begin
  oCadNegociacao := TCadNegociacao.Create;
  oCadNegociacaoController := TCadNegociacaoController.Create;
  try

    oCadNegociacao.Situacao := 'Pendente';
    oCadNegociacao.Produtor_id := PegarProdutorCombo;
    oCadNegociacao.LimiteCredito_ID := PegarLimiteCreditoCombo;
    oCadNegociacao.id := 0;

    sResult := oCadNegociacaoController.Inserir(oCadNegociacao,sErro);

    if sResult = 0 then
      raise Exception.Create(sErro);

    edtIDCad.Text := sResult.ToString;
  finally
    FreeAndNil(oCadNegociacao);
    FreeAndNil(oCadNegociacaoController);
  end;
end;

procedure TfrmCadNegociacao.CarregarComboProdutor;
var
 oCadNegociacaoController : TCadNegociacaoController;
begin
  oCadNegociacaoController := TCadNegociacaoController.Create;
  try
    oCadNegociacaoController.CarregarComboboxProdutor(cbbProdutor)
  finally
    FreeAndNil(oCadNegociacaoController);
  end;
end;

procedure TfrmCadNegociacao.CarregarComboProdutos;
var
 oProdutoController : TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.CarregarComboboxProdutos(cbbProduto);
  finally
    FreeAndNil(oProdutoController);
  end;
end;

procedure TfrmCadNegociacao.CarregarComboLimiteCredito(sProdutor_ID:Integer);
var
 oCadNegociacaoController : TCadNegociacaoController;
begin
  oCadNegociacaoController := TCadNegociacaoController.Create;
  try
    oCadNegociacaoController.CarregarComboboxLimiteCredito(cbbLimiteCredito,sProdutor_ID)
  finally
    FreeAndNil(oCadNegociacaoController);
  end;
end;

procedure TfrmCadNegociacao.cbbProdutorChange(Sender: TObject);
var
  Produtor_ID : Integer;
begin
  Produtor_id := PegarProdutorCombo;
  CarregarComboLimiteCredito(Produtor_id);
end;

function TfrmCadNegociacao.PegarProdutoIDCombo: Integer;
begin
 Result := Integer(cbbProduto.items.objects[cbbProduto.ItemIndex]);
end;

function TfrmCadNegociacao.PegarProdutorCombo:Integer;
begin
  Result := Integer(cbbProdutor.items.objects[cbbProdutor.ItemIndex]);
end;

function TfrmCadNegociacao.PegarLimiteCreditoCombo:Integer;
begin
  Result := Integer(cbbLimiteCredito.items.objects[cbbLimiteCredito.ItemIndex]);
end;

end.
