object frmConsultaNegociacoes: TfrmConsultaNegociacoes
  Left = 0
  Top = 0
  Caption = 'Consulta negocia'#231#245'es'
  ClientHeight = 260
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 260
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object btnPesquisar: TBitBtn
      Left = 287
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
    object rdgProdDist: TRadioGroup
      Left = 16
      Top = 8
      Width = 185
      Height = 33
      BiDiMode = bdLeftToRight
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Produtor'
        'Distribuidor')
      ParentBiDiMode = False
      TabOrder = 1
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 52
      Width = 265
      Height = 23
      TabOrder = 2
    end
    object grdPesquisa: TDBGrid
      Left = 16
      Top = 81
      Width = 559
      Height = 159
      DataSource = dmPesquisaNegociacoes.dtsPesquisa
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'NEGOCIACAO_ID'
          Title.Caption = 'C'#243'd. Contrato'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTOR'
          Title.Caption = 'Produtor'
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTRIBUIDOR'
          Title.Caption = 'Distribuidor'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SITUACAO'
          Title.Caption = 'Situa'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL_CONTRATO'
          Title.Caption = 'Valor Contrato'
          Width = 88
          Visible = True
        end>
    end
    object btnImprimir: TBitBtn
      Left = 368
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 4
      OnClick = btnImprimirClick
    end
  end
end
