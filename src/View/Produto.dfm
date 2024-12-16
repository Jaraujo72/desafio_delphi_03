object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  Caption = 'Produto'
  ClientHeight = 356
  ClientWidth = 474
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
    Width = 474
    Height = 356
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object pgcProduto: TPageControl
      Left = 1
      Top = 1
      Width = 472
      Height = 354
      ActivePage = tabPesquisa
      Align = alClient
      TabOrder = 0
      object tabPesquisa: TTabSheet
        Caption = 'Pesquisa'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 464
          Height = 324
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 14
            Width = 43
            Height = 15
            Caption = 'Produto'
          end
          object edtDescProduto: TEdit
            Left = 16
            Top = 29
            Width = 273
            Height = 23
            TabOrder = 0
          end
          object btnPesquisar: TBitBtn
            Left = 292
            Top = 27
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 1
            OnClick = btnPesquisarClick
          end
          object btnExcluir: TBitBtn
            Left = 91
            Top = 275
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 2
            OnClick = btnExcluirClick
          end
          object btnEditar: TBitBtn
            Left = 16
            Top = 275
            Width = 75
            Height = 25
            Caption = 'Editar'
            TabOrder = 3
            OnClick = btnEditarClick
          end
          object grdProduto: TStringGrid
            Left = 16
            Top = 58
            Width = 427
            Height = 215
            TabOrder = 4
          end
          object tnbCadastrar: TBitBtn
            Left = 368
            Top = 27
            Width = 75
            Height = 25
            Caption = 'Cadastrar'
            TabOrder = 5
            OnClick = tnbCadastrarClick
          end
        end
      end
      object TabCadastro: TTabSheet
        Caption = 'Cadastro'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 464
          Height = 324
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object Label5: TLabel
            Left = 16
            Top = 50
            Width = 43
            Height = 15
            Caption = 'Produto'
          end
          object Label6: TLabel
            Left = 263
            Top = 50
            Width = 30
            Height = 15
            Caption = 'Pre'#231'o'
          end
          object Label8: TLabel
            Left = 16
            Top = 20
            Width = 11
            Height = 15
            Caption = 'ID'
          end
          object edtDescricaoProduto: TEdit
            Left = 16
            Top = 64
            Width = 241
            Height = 23
            TabOrder = 0
          end
          object edtPrecoProduto: TEdit
            Left = 263
            Top = 64
            Width = 95
            Height = 23
            TabOrder = 1
          end
          object BitBtn1: TBitBtn
            Left = 16
            Top = 93
            Width = 75
            Height = 25
            Caption = 'Gravar'
            TabOrder = 2
            OnClick = BitBtn1Click
          end
          object edtIDCad: TEdit
            Left = 31
            Top = 18
            Width = 75
            Height = 23
            Enabled = False
            TabOrder = 3
          end
        end
      end
    end
  end
end
