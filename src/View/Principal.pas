unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.StdCtrls, Vcl.Buttons, Vcl.TitleBarCtrls,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnCadastroNegociacao: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    btnSair: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnCadastroNegociacaoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Produtor, Distribuidor, Produto, CadNegociacao, ManutencaoNegociacao,
  ConsultaNegociacoes, Rotinas;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
    ExibirFormulario(TfrmProdutor,frmProdutor,True,True);
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  ExibirFormulario(TfrmDistribuidor,frmDistribuidor,True,True);
end;

procedure TfrmPrincipal.BitBtn3Click(Sender: TObject);
begin
  ExibirFormulario(TfrmProduto,frmProduto,True,True);
end;

procedure TfrmPrincipal.BitBtn5Click(Sender: TObject);
begin
  ExibirFormulario(TfrmManutencaoNegociacao,frmManutencaoNegociacao,True,True);
end;

procedure TfrmPrincipal.BitBtn6Click(Sender: TObject);
begin
  ExibirFormulario(TfrmConsultaNegociacoes,frmConsultaNegociacoes,True,True);
end;

procedure TfrmPrincipal.btnCadastroNegociacaoClick(Sender: TObject);
begin
  ExibirFormulario(TfrmCadNegociacao,frmCadNegociacao,True,True);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
