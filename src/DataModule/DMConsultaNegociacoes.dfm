object dmPesquisaNegociacoes: TdmPesquisaNegociacoes
  Height = 272
  Width = 338
  object dtsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 40
    Top = 192
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Left = 40
    Top = 65
  end
  object frxConsultaNegociacoes: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45641.085314039400000000
    ReportOptions.LastChange = 45641.636299513890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 184
    Top = 72
    Datasets = <
      item
        DataSet = frxDBConsultaNegociacoes
        DataSetName = 'frxDBConsultaNegociacoes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 980.410082000000000000
        object Memo5: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 980.410082000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 11.338590000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Negocia'#231#245'es')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produtor')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 56.692950000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Distribuidor')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 56.472480000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'd. Contrato')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Vlr. Contrato')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 512.016080000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt.Cadastro')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'dt.Aprova'#231#227'o')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 684.094930000000000000
          Top = 56.692950000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt.Conclus'#227'o')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 771.024120000000000000
          Top = 56.692950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt. Cancelamento')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 158.740260000000000000
        Width = 980.410082000000000000
        DataSet = frxDBConsultaNegociacoes
        DataSetName = 'frxDBConsultaNegociacoes'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 3.000000000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTOR'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."PRODUTOR"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 3.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'DISTRIBUIDOR'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."DISTRIBUIDOR"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 306.921460000000000000
          Top = 3.000000000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'SITUACAO'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."SITUACAO"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 3.000000000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'NEGOCIACAO_ID'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."NEGOCIACAO_ID"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 2.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_INICIO'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          DisplayFormat.FormatStr = 'DD/MM/YYYY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."DATA_INICIO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 2.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_APROVACAO'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          DisplayFormat.FormatStr = 'DD/MM/YYYY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."DATA_APROVACAO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 681.874460000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_CONCLUSAO'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          DisplayFormat.FormatStr = 'DD/MM/YYYY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."DATA_CONCLUSAO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 788.142240000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_CANCELAMENTO'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          DisplayFormat.FormatStr = 'DD/MM/YYYY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."DATA_CANCELAMENTO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 888.189550000000000000
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_TOTAL_CONTRATO'
          DataSet = frxDBConsultaNegociacoes
          DataSetName = 'frxDBConsultaNegociacoes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBConsultaNegociacoes."VALOR_TOTAL_CONTRATO"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBConsultaNegociacoes: TfrxDBDataset
    UserName = 'frxDBConsultaNegociacoes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NEGOCIACAO_ID=NEGOCIACAO_ID'
      'DATA_INICIO=DATA_INICIO'
      'SITUACAO=SITUACAO'
      'PRODUTOR_ID=PRODUTOR_ID'
      'DATA_APROVACAO=DATA_APROVACAO'
      'DATA_CANCELAMENTO=DATA_CANCELAMENTO'
      'VALOR_TOTAL_CONTRATO=VALOR_TOTAL_CONTRATO'
      'LIMITECREDITO_ID=LIMITECREDITO_ID'
      'DATA_CONCLUSAO=DATA_CONCLUSAO'
      'PRODUTOR=PRODUTOR'
      'DISTRIBUIDOR=DISTRIBUIDOR')
    DataSource = dtsPesquisa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 184
    Top = 144
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
      'WHERE p.nome like  :produtor'
      'and dis.nome like :distribuidor')
    Left = 40
    Top = 8
    ParamData = <
      item
        Position = 1
        Name = 'produtor'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'distribuidor'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'produtor'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'distribuidor'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 40
    Top = 128
  end
end
