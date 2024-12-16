object dtmCadNegociacao: TdtmCadNegociacao
  Height = 235
  Width = 439
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
  object dspProdutor: TDataSetProvider
    DataSet = sqlProdutor
    Left = 136
    Top = 65
  end
  object cdsProdutor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutor'
    Left = 136
    Top = 128
  end
  object dspLimiteCredito: TDataSetProvider
    DataSet = sqlLimteCredito
    Left = 232
    Top = 73
  end
  object cdsLimiteCredito: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'LIMITECREDITO_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspLimiteCredito'
    Left = 232
    Top = 136
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
  object sqlProdutor: TFDQuery
    Connection = dtmConexao.SqlConexao
    SQL.Strings = (
      'SELECT * FROM PRODUTOR WHERE NOME LIKE :NOME')
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
  object sqlLimteCredito: TFDQuery
    Connection = dtmConexao.SqlConexao
    SQL.Strings = (
      
        'SELECT LIMITEDISPONIVEL FROM SP_LIMITEDISPONIVEL ( :LIMITECREDIT' +
        'O_ID )')
    Left = 232
    Top = 16
    ParamData = <
      item
        Name = 'LIMITECREDITO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
