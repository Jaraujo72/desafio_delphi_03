object dtmDistribuidor: TdtmDistribuidor
  Height = 200
  Width = 332
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 40
    Top = 65
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 40
    Top = 128
  end
  object sqlPesquisar: TFDQuery
    Connection = dtmConexao.SqlConexao
    SQL.Strings = (
      'SELECT * FROM DISTRIBUIDOR WHERE NOME LIKE :NOME')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end>
  end
end
