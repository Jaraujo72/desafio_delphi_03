object dtmConexao: TdtmConexao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 232
  Width = 232
  object SqlConexao: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=F:\Desenvolvimento\DesafioAliare\data\ALIARE.FDB')
    LoginPrompt = False
    BeforeConnect = SqlConexaoBeforeConnect
    Left = 56
    Top = 104
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 128
    Top = 48
  end
end
