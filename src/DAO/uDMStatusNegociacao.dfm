object dtmStatusNegociacao: TdtmStatusNegociacao
  Height = 215
  Width = 336
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
        Name = 'NEGOCIACAO_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 40
    Top = 128
  end
  object sqlPesquisar: TFDQuery
    Connection = dtmConexao.SqlConexao
    SQL.Strings = (
      
        'SELECT NEG.*, P.nome produtor, DIS.nome DISTRIBUIDOR FROM NEGOCI' +
        'ACAO NEG'
      'LEFT JOIN PRODUTOR P ON NEG.produtor_id = P.produtor_id'
      
        'LEFT JOIN limitecredito LI ON LI.limitecredito_id = NEG.limitecr' +
        'edito_id'
      
        'LEFT JOIN DISTRIBUIDOR DIS ON DIS.distribuidor_id = LI.distribui' +
        'dor_id'
      'WHERE NEG.negociacao_id = :negociacao_id')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'NEGOCIACAO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
