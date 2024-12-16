unit ConsultaNegociacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.DBGrids;

type
  TfrmConsultaNegociacoes = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TBitBtn;
    rdgProdDist: TRadioGroup;
    edtPesquisa: TEdit;
    grdPesquisa: TDBGrid;
    btnImprimir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaNegociacoes: TfrmConsultaNegociacoes;

implementation

{$R *.dfm}

uses DMConsultaNegociacoes;

procedure TfrmConsultaNegociacoes.btnImprimirClick(Sender: TObject);
begin
  dmPesquisaNegociacoes.frxConsultaNegociacoes.ShowReport();
end;

procedure TfrmConsultaNegociacoes.btnPesquisarClick(Sender: TObject);
begin
  dmPesquisaNegociacoes.Pesquisar(edtPesquisa.Text,(rdgProdDist.ItemIndex=0))
end;

procedure TfrmConsultaNegociacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmConsultaNegociacoes := nil;
  Action := CaFree;
end;

end.
