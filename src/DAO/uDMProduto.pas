unit uDMProduto;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Datasnap.Provider,Vcl.Grids, uProdutoModel,Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmProduto = class(TDataModule)
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    sqlPesquisar: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID:Integer;
    procedure Pesquisar(sNome: string; var aStringGrid : TStringGrid);
    procedure CarregarProduto(oProduto : TProduto; iCodigo : Integer);
    function Inserir(oProduto : TProduto; out sErro : String):Boolean;
    function Alterar(oProduto : TProduto; out sErro : String):Boolean;
    function Excluir(iCodigo : Integer; out sErro : String):Boolean;
    procedure CarregarComboboxProdutos(cbbProdutos: TCombobox);
  end;

var
  dtmProduto: TdtmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DMConexao, Rotinas;

{$R *.dfm}

{ TdtmProduto }

function TdtmProduto.Alterar(oProduto: TProduto; out sErro: String): Boolean;
var
  sqlAlterar : TFDQuery;
begin
  sqlAlterar := TFDQuery.Create(nil);
  try
    sqlAlterar.Connection := dtmConexao.SqlConexao;
    sqlAlterar.SQL.Text := ' UPDATE PRODUTO '+
                              ' SET NOME = :NOME, '+
                              ' PRECO = :PRECO '+
                              ' WHERE PRODUTO_ID = :PRODUTO_ID ';

    sqlAlterar.Params[0].AsString := oProduto.Descricao;
    sqlAlterar.Params[1].AsFloat := oProduto.Preco;
    sqlAlterar.Params[2].AsInteger := oProduto.id;

    try
      sqlAlterar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao alterar produtor: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlAlterar);
  end;

end;

procedure TdtmProduto.CarregarComboboxProdutos(cbbProdutos: TCombobox);
begin
  try
    cdsPesquisar.Active := False;

    cdsPesquisar.Params[0].AsString := '%';

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;

    //
    cdsPesquisar.First;

    cbbProdutos.Clear;

    while not cdsPesquisar.Eof do
    begin
      cbbProdutos.Items.AddObject( Trim(cdsPesquisar.FieldByName('NOME').AsString),
       tObject(cdsPesquisar.FieldByName('PRODUTO_ID').asInteger) );
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;
end;

procedure TdtmProduto.CarregarProduto(oProduto: TProduto; iCodigo: Integer);
var
  sqlProduto : TFDQuery;
begin
  sqlProduto := TFDQuery.Create(nil);
  try
    sqlProduto.Connection := dtmConexao.SqlConexao;
    sqlProduto.SQL.Text := 'Select * from PRODUTO WHERE PRODUTO_ID = '+iCodigo.ToString;
    sqlProduto.Open;

    oProduto.Descricao := sqlProduto.FieldByName('NOME').AsString;
    oProduto.Preco  := sqlProduto.FieldByName('PRECO').AsFloat;
    oProduto.ID  := sqlProduto.FieldByName('PRODUTO_ID').AsInteger;
  finally
    FreeAndNil(sqlProduto);
  end;
end;

function TdtmProduto.Excluir(iCodigo: Integer; out sErro: String): Boolean;
var
  sqlDeletar : TFDQuery;
begin
  sqlDeletar := TFDQuery.Create(nil);
  try
    sqlDeletar.Connection := dtmConexao.SqlConexao;
    sqlDeletar.SQL.Text := ' DELETE FROM PRODUTO WHERE PRODUTO_ID = :PRODUTO_ID ';

    sqlDeletar.Params[0].AsInteger := iCodigo;

    try
      sqlDeletar.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao excluir produtor: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlDeletar);
  end;

end;

function TdtmProduto.GerarID: Integer;
var
  sqlSeq : TFDQuery;
begin
  sqlSeq := TFDQuery.Create(nil);
  try
    sqlSeq.Connection := dtmConexao.SqlConexao;
    sqlSeq.SQL.Text := 'SELECT GEN_ID(GEN_PRODUTO, 1) FROM RDB$DATABASE;';
    sqlSeq.Open;
    Result := sqlSeq.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(sqlSeq);
  end;
end;

function TdtmProduto.Inserir(oProduto: TProduto; out sErro: String): Boolean;
var
  sqlInsert : TFDQuery;
begin
  sqlInsert := TFDQuery.Create(nil);
  try
    sqlInsert.Connection := dtmConexao.SqlConexao;
    sqlInsert.SQL.Text := ' Insert into produto( '+
                             '                      produto_id, '+
                             '                      Nome, '+
                             '                      PRECO)values( '+
                             '                      :PRODUTO_ID, '+
                             '                      :NOME,  '+
                             '                      :PRECO) ';

    sqlInsert.Params[0].AsInteger := GerarID;
    sqlInsert.Params[1].AsString := oProduto.Descricao;
    sqlInsert.Params[2].AsFloat := oProduto.Preco;

    try
      sqlInsert.ExecSQL();
      Result := true;
    Except
      on e:Exception do
      begin
        sErro := 'Erro ao inserir produto: '+e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(sqlInsert);
  end;

end;

procedure TdtmProduto.Pesquisar(sNome: string; var aStringGrid: TStringGrid);
var
 iTotal : Integer;
begin
  try
    iTotal := 1;

    cdsPesquisar.Active := False;

    if sNome.Trim.IsEmpty then
      cdsPesquisar.Params[0].AsString := '%'
    else
      cdsPesquisar.Params[0].AsString := '%'+sNome+'%';

    cdsPesquisar.Open;
    cdsPesquisar.DisableConstraints;
    cdsPesquisar.Last;

    //Configurar StringGrid
    ConfigurargrdProduto(aStringGrid,3,cdsPesquisar.RecordCount+1);

    //Popular linhas StringGrid
    cdsPesquisar.First;
    while not cdsPesquisar.Eof do
    begin
      aStringGrid.Cells[0,iTotal] := cdsPesquisar.FieldByName('PRODUTO_ID').AsString;
      aStringGrid.Cells[1,iTotal] := cdsPesquisar.FieldByName('NOME').AsString;
      aStringGrid.Cells[2,iTotal] := cdsPesquisar.FieldByName('PRECO').AsString;
      Inc(iTotal);
      cdsPesquisar.Next;
    end;
  finally
    cdsPesquisar.EnableConstraints;
    cdsPesquisar.Close;
  end;

end;

end.
