unit Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TOperacao  = (opNovo,opAlterar,opNavegacao);
  TfrmProduto = class(TForm)
    Panel1: TPanel;
    pgcProduto: TPageControl;
    tabPesquisa: TTabSheet;
    Panel2: TPanel;
    TabCadastro: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    edtDescProduto: TEdit;
    btnPesquisar: TBitBtn;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    grdProduto: TStringGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edtDescricaoProduto: TEdit;
    edtPrecoProduto: TEdit;
    BitBtn1: TBitBtn;
    edtIDCad: TEdit;
    tnbCadastrar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tnbCadastrarClick(Sender: TObject);
  private
    fOperacao : TOperacao;
    fIDSelecionado : Integer;
    procedure Pesquisar;
    procedure Novo;
    procedure Detalhar;
    procedure CarregarProduto;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure HabilitarControles(aOperacao : TOperacao);
    procedure Gravar;
    procedure LimparCampos;
    procedure Editar;
    procedure ValidaCampos;
  public
    { Public declarations }
    property IDSelecionado: Integer read fIDSelecionado write fIDSelecionado;
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses uProdutoModel, uProdutoController, Rotinas;

{ TfrmProduto }

procedure TfrmProduto.Alterar;
var
  oProduto : TProduto;
  oProdutoController : TProdutoController;
  sErro: string;
begin
  oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try

    oProduto.Descricao := edtDescricaoProduto.Text;
    oProduto.Preco := StrToFloat(edtPrecoProduto.Text);
    oProduto.id := StrToInt(edtIDCad.Text);

    if not oProdutoController.Alterar(oProduto,sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oProduto);
    FreeAndNil(oProdutoController);
  end;
end;

procedure TfrmProduto.BitBtn1Click(Sender: TObject);
begin
  ValidaCampos;
  Gravar;
end;

procedure TfrmProduto.ValidaCampos;
var
  sErro : String;
begin
  if not VerificaValorPreenchido(edtDescricaoProduto.Text) then
    raise Exception.Create('Preencha a descricão do produto.');

  if not ValidaValorMonetario(edtPrecoProduto.Text,sErro) then
    raise Exception.Create('Valor preço inválido. '+sErro);

end;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmProduto.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmProduto.CarregarProduto;
var
  oProduto : TProduto;
  oProdutoController : TProdutoController;
begin
  oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.CarregarProduto(oProduto,StrToInt(grdProduto.Cells[0,grdProduto.row]));
    edtDescricaoProduto.Text := oProduto.Descricao;
    edtPrecoProduto.Text := FloatToStr(oProduto.Preco);
    edtIDCad.Text := oProduto.id.ToString;
  finally
    FreeAndNil(oProduto);
    FreeAndNil(oProdutoController);
  end;

end;

procedure TfrmProduto.Detalhar;
begin
 if grdProduto.Cells[0,1] = '' then
  begin
    HabilitarControles(opNavegacao);
    raise Exception.Create('Não há Registro para ser detalhado.');
  end;
  CarregarProduto;
  HabilitarControles(opAlterar);
end;

procedure TfrmProduto.Editar;
begin
 HabilitarControles(opAlterar);
 Detalhar;
end;

procedure TfrmProduto.Excluir;
var
  oProdutoController : TProdutoController;
  sErro: string;
begin
  oProdutoController := TProdutoController.Create;
  try
    if grdProduto.Cells[0,1] = '' then
      raise Exception.Create('Não há Registro para ser excluído.');

    if not oProdutoController.Excluir(StrToIntDef(grdProduto.Cells[0,grdProduto.row],0),sErro) then
      raise Exception.Create(sErro);

    oProdutoController.Pesquisar(EmptyStr,grdProduto);
  finally
    FreeAndNil(oProdutoController);
  end;

end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmProduto := nil;
  Action := CaFree;
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  ConfigurargrdProduto(grdProduto,3,1);
  Listar;
end;

procedure TfrmProduto.Gravar;
var
  oProdutoController : TProdutoController;
begin
  case FOperacao of
    opNovo: Inserir;
    opAlterar: Alterar;
  end;
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.Pesquisar(EmptyStr,grdProduto);
  finally
    FreeAndNil(oProdutoController);
  end;

end;

procedure TfrmProduto.HabilitarControles(aOperacao: TOperacao);
begin
  fOperacao := aOperacao;
  case aOperacao of
    opNovo:
    begin
      pgcProduto.ActivePage := tabCadastro;
    end;
    opAlterar:
    begin
      pgcProduto.ActivePage := tabCadastro;
    end;
    opNavegacao :
    begin
      pgcProduto.ActivePage := tabPesquisa;
    end;
  end;
end;

procedure TfrmProduto.Inserir;
var
  oProduto : TProduto;
  oProdutoController : TProdutoController;
  sErro: string;
begin
  oProduto := TProduto.Create;
  oProdutoController := TProdutoController.Create;
  try

    oProduto.Descricao := edtDescricaoProduto.Text;
    oProduto.Preco := StrToFloat(edtPrecoProduto.Text);
    oProduto.id := 0;

    if not oProdutoController.Inserir(oProduto,sErro) then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oProduto);
    FreeAndNil(oProdutoController);
  end;
end;

procedure TfrmProduto.LimparCampos;
begin
  edtDescricaoProduto.Clear;
  edtPrecoProduto.Clear;
end;

procedure TfrmProduto.Listar;
begin
  pgcProduto.ActivePage := tabPesquisa;
end;

procedure TfrmProduto.Novo;
begin
  LimparCampos;
  HabilitarControles(opNovo)
end;

procedure TfrmProduto.Pesquisar;
var
  oProduto : TProdutoController;
begin
  oProduto := TProdutoController.Create;
  try
    oProduto.Pesquisar(edtDescProduto.Text,grdProduto);
  finally
    FreeANdNil(oProduto);
  end;
end;

procedure TfrmProduto.tnbCadastrarClick(Sender: TObject);
begin
  Novo;
end;

end.
