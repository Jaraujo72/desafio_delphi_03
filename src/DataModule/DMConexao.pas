unit DMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  System.IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdtmConexao = class(TDataModule)
    SqlConexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SqlConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  SqlConexao.Connected := true;
end;

procedure TdtmConexao.DataModuleDestroy(Sender: TObject);
begin
  SqlConexao.Connected := false;
end;

procedure TdtmConexao.SqlConexaoBeforeConnect(Sender: TObject);
var
  vIni : TIniFile;
  vBaseDados, vUsuario, vSenha: string;
  vStringList: TStringList;
begin
   vIni := TIniFile.Create('F:\Desenvolvimento\DesafioAliare\docs\Config\Config.ini');
   vBaseDados := vIni.ReadString('Geral', 'BaseDados', '');
   vUsuario := vIni.ReadString('Geral', 'Usuario', '');
   vSenha := vIni.ReadString('Geral', 'Senha', '');

   vStringList:= TStringList.Create;
    try

       try
        vStringList.Add('User_Name=' + vUsuario);
        vStringList.Add('Password='  + vSenha);
        vStringList.Add('Database='  + vBaseDados);
        vStringList.Add('DriverId=FB');

        SqlConexao.Params.Clear;
        SqlConexao.Params.AddStrings(vStringList);
        SqlConexao.LoginPrompt := False;

      finally
        vIni.Free;
      end;

    finally
      FreeAndNil(vStringList);
    end;

end;

end.
