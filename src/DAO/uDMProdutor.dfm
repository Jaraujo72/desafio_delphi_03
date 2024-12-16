object dtmProdutor: TdtmProdutor
  Height = 197
  Width = 437
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
      'SELECT * FROM PRODUTOR WHERE NOME LIKE :NOME')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
      end>
    object sqlPesquisarPRODUTOR_ID: TIntegerField
      FieldName = 'PRODUTOR_ID'
      Origin = 'PRODUTOR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 260
    end
    object sqlPesquisarCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      Size = 14
    end
  end
end
