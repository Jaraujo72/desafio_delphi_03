object frmManutencaoNegociacao: TfrmManutencaoNegociacao
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o Negocia'#231#227'o'
  ClientHeight = 222
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 222
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 89
      Height = 15
      Caption = 'C'#243'digo Contrato'
    end
    object Label2: TLabel
      Left = 16
      Top = 128
      Width = 32
      Height = 15
      Caption = 'Status'
    end
    object edtCodigoContrato: TEdit
      Left = 16
      Top = 24
      Width = 103
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object btnPesquisar: TBitBtn
      Left = 125
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
    object grdPesquisaNegociacao: TStringGrid
      Left = 16
      Top = 53
      Width = 657
      Height = 69
      TabOrder = 2
    end
    object cbbStatus: TComboBox
      Left = 16
      Top = 144
      Width = 153
      Height = 23
      TabOrder = 3
      Items.Strings = (
        'Aprovada'
        'Conclu'#237'da'
        'Cancelada')
    end
    object btnAtualizarStatus: TBitBtn
      Left = 16
      Top = 169
      Width = 103
      Height = 25
      Caption = 'Atualizar Status'
      TabOrder = 4
      OnClick = btnAtualizarStatusClick
    end
  end
end
