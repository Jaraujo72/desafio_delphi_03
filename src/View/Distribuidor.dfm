object frmDistribuidor: TfrmDistribuidor
  Left = 0
  Top = 0
  Caption = 'Distribuidor'
  ClientHeight = 313
  ClientWidth = 437
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
    Width = 437
    Height = 313
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object pgcDistribuidor: TPageControl
      Left = 1
      Top = 1
      Width = 435
      Height = 311
      ActivePage = tabPesquisa
      Align = alClient
      TabOrder = 0
      object tabPesquisa: TTabSheet
        Caption = 'Pesquisa'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 427
          Height = 281
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 20
            Width = 62
            Height = 15
            Caption = 'Distribuidor'
          end
          object edtDistribuidor: TEdit
            Left = 16
            Top = 35
            Width = 241
            Height = 23
            TabOrder = 0
          end
          object btnPesquisar: TBitBtn
            Left = 258
            Top = 34
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 1
            OnClick = btnPesquisarClick
          end
          object btnExcluir: TBitBtn
            Left = 91
            Top = 242
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 2
            OnClick = btnExcluirClick
          end
          object btnEditar: TBitBtn
            Left = 16
            Top = 242
            Width = 75
            Height = 25
            Caption = 'Editar'
            TabOrder = 3
            OnClick = btnEditarClick
          end
          object grdDistribuidor: TStringGrid
            Left = 16
            Top = 64
            Width = 395
            Height = 177
            TabOrder = 4
            OnDblClick = grdDistribuidorDblClick
          end
          object tnbCadastrar: TBitBtn
            Left = 336
            Top = 33
            Width = 75
            Height = 25
            Caption = 'Cadastrar'
            TabOrder = 5
            OnClick = tnbCadastrarClick
          end
        end
      end
      object tabCadastro: TTabSheet
        Caption = 'Cadastro'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 427
          Height = 281
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object Label3: TLabel
            Left = 24
            Top = 42
            Width = 62
            Height = 15
            Caption = 'Distribuidor'
          end
          object Label4: TLabel
            Left = 303
            Top = 42
            Width = 27
            Height = 15
            Caption = 'CNPJ'
          end
          object Label7: TLabel
            Left = 24
            Top = 12
            Width = 11
            Height = 15
            Caption = 'ID'
          end
          object edtNomeCadDistribuidor: TEdit
            Left = 24
            Top = 60
            Width = 276
            Height = 23
            TabOrder = 0
          end
          object edtCpfCadDistribuidorr: TEdit
            Left = 303
            Top = 60
            Width = 95
            Height = 23
            TabOrder = 1
          end
          object btnGravarClick: TBitBtn
            Left = 24
            Top = 89
            Width = 75
            Height = 25
            Caption = 'Gravar'
            TabOrder = 2
            OnClick = btnGravarClickClick
          end
          object edtIDCad: TEdit
            Left = 41
            Top = 9
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
