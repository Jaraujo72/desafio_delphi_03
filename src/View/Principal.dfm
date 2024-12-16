object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Agro Negocia'#231#245'es'
  ClientHeight = 499
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 499
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 146
      Height = 25
      Caption = 'Produtor'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 47
      Width = 146
      Height = 25
      Caption = 'Distribuidor'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 78
      Width = 146
      Height = 25
      Caption = 'Produto'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object btnCadastroNegociacao: TBitBtn
      Left = 16
      Top = 109
      Width = 146
      Height = 25
      Caption = 'Cadastro Negocia'#231#227'o'
      TabOrder = 3
      OnClick = btnCadastroNegociacaoClick
    end
    object BitBtn5: TBitBtn
      Left = 16
      Top = 136
      Width = 146
      Height = 25
      Caption = 'Manuten'#231#227'o Negocia'#231#227'o'
      TabOrder = 4
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 16
      Top = 167
      Width = 146
      Height = 25
      Caption = 'Pesquisa Negocia'#231#227'o'
      TabOrder = 5
      OnClick = BitBtn6Click
    end
    object btnSair: TBitBtn
      Left = 16
      Top = 198
      Width = 146
      Height = 25
      Caption = 'Sair'
      TabOrder = 6
      OnClick = btnSairClick
    end
  end
end
