object dtmLimiteCredito: TdtmLimiteCredito
  Height = 274
  Width = 307
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 40
    Top = 65
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PRODUTOR_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 40
    Top = 128
  end
  object dspDistribuidor: TDataSetProvider
    DataSet = sqlDistribuidor
    Left = 136
    Top = 65
  end
  object cdsDistribuidor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspDistribuidor'
    Left = 136
    Top = 128
  end
  object sqlPesquisar: TFDQuery
    Connection = dtmConexao.SqlConexao
    SQL.Strings = (
      'SELECT  LI.*, DI.NOME DISTRIBUIDOR  FROM limitecredito LI'
      
        'LEFT JOIN DISTRIBUIDOR DI ON DI.distribuidor_id = LI.distribuido' +
        'r_id'
      'WHERE PRODUTOR_ID = :PRODUTOR_ID')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'PRODUTOR_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sqlDistribuidor: TFDQuery
    Connection = dtmConexao.SqlConexao
    SQL.Strings = (
      'SELECT * FROM DISTRIBUIDOR WHERE NOME LIKE :NOME')
    Left = 136
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