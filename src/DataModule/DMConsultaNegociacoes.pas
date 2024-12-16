unit DMConsultaNegociacoes;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd,
  Data.DB, Datasnap.DBClient,
  Datasnap.Provider,
  frxClass, frxDBXComponents, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmPesquisaNegociacoes = class(TDataModule)
    dtsPesquisa: TDataSource;
    dspPesquisar: TDataSetProvider;
    frxDBConsultaNegociacoes: TfrxDBDataset;
    frxConsultaNegociacoes: TfrxReport;
    sqlPesquisar: TFDQuery;
    cdsPesquisa: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sNome:String;bProdutor:Boolean);
  end;

var
  dmPesquisaNegociacoes: TdmPesquisaNegociacoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmPesquisaNegociacoes.Pesquisar(sNome: String; bProdutor: Boolean);
begin
  cdsPesquisa.Active := False;

  if bProdutor then
  begin
    cdsPesquisa.Params[0].AsString := '%'+sNome+'%';
    cdsPesquisa.Params[1].AsString := '%';
  end
  else
  begin
    cdsPesquisa.Params[0].AsString := '%';
    cdsPesquisa.Params[1].AsString := '%'+sNome+'%';
  end;

  cdsPesquisa.Open;
end;

end.
