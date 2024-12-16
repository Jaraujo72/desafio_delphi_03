object dtmItensNegociacao: TdtmItensNegociacao
  Height = 243
  Width = 427
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
      
        'SELECT  LI.*, PR.NOME DESCRICAO, (LI.QUANTIDADE*PR.PRECO) PRECO ' +
        ' FROM ITENS_NEGOCIACAO LI'
      'LEFT JOIN PRODUTO PR ON PR.PRODUTO_ID = LI.PRODUTO_ID'
      'WHERE LI.NEGOCIACAO_ID = :NEGOCIACAO_ID')
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
