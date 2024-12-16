object frmProdutor: TfrmProdutor
  Left = 0
  Top = 0
  Caption = 'Produtor'
  ClientHeight = 400
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 400
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object pgcProdutor: TPageControl
      Left = 1
      Top = 1
      Width = 458
      Height = 398
      ActivePage = tabPesquisa
      Align = alClient
      TabOrder = 0
      object tabPesquisa: TTabSheet
        Caption = 'Pesquisa'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 450
          Height = 368
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 16
            Width = 33
            Height = 15
            Caption = 'Nome'
          end
          object edtNome: TEdit
            Left = 16
            Top = 31
            Width = 241
            Height = 23
            TabOrder = 0
          end
          object btnPesquisar: TBitBtn
            Left = 263
            Top = 29
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 1
            OnClick = btnPesquisarClick
          end
          object tnbCadastrar: TBitBtn
            Left = 344
            Top = 29
            Width = 75
            Height = 25
            Caption = 'Cadastrar'
            TabOrder = 2
            OnClick = tnbCadastrarClick
          end
          object BitBtn2: TBitBtn
            Left = 91
            Top = 300
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 3
            OnClick = BitBtn2Click
          end
          object btnEditar: TBitBtn
            Left = 16
            Top = 300
            Width = 75
            Height = 25
            Caption = 'Editar'
            TabOrder = 4
            OnClick = btnEditarClick
          end
          object grdProdutor: TStringGrid
            Left = 16
            Top = 57
            Width = 403
            Height = 241
            TabOrder = 5
            OnDblClick = grdProdutorDblClick
          end
        end
      end
      object tabCadastro: TTabSheet
        Caption = 'Cadastro'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 450
          Height = 368
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object pnlCadProdutor: TPanel
            Left = 1
            Top = 1
            Width = 448
            Height = 102
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label3: TLabel
              Left = 23
              Top = 29
              Width = 33
              Height = 15
              Caption = 'Nome'
            end
            object Label4: TLabel
              Left = 302
              Top = 29
              Width = 53
              Height = 15
              Caption = 'CPF/CNPJ'
            end
            object Label7: TLabel
              Left = 23
              Top = 6
              Width = 11
              Height = 15
              Caption = 'ID'
            end
            object edtNomeCadProdutor: TEdit
              Left = 23
              Top = 43
              Width = 276
              Height = 23
              TabOrder = 0
            end
            object edtCpfCadProdutor: TEdit
              Left = 302
              Top = 43
              Width = 98
              Height = 23
              TabOrder = 1
            end
            object btnGravarClick: TBitBtn
              Left = 23
              Top = 67
              Width = 75
              Height = 25
              Caption = 'Gravar'
              TabOrder = 2
              OnClick = btnGravarClickClick
            end
            object edtIDCad: TEdit
              Left = 38
              Top = 3
              Width = 75
              Height = 23
              Enabled = False
              TabOrder = 3
            end
          end
          object pnlVincularDist: TPanel
            Left = 1
            Top = 103
            Width = 448
            Height = 264
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Label5: TLabel
              Left = 23
              Top = 6
              Width = 62
              Height = 15
              Caption = 'Distribuidor'
            end
            object Label6: TLabel
              Left = 302
              Top = 6
              Width = 73
              Height = 15
              Caption = 'Limite cr'#233'dito'
            end
            object grdLimite: TStringGrid
              Left = 23
              Top = 83
              Width = 377
              Height = 120
              TabOrder = 3
              RowHeights = (
                24
                24
                24
                24
                24)
            end
            object edtLimiteCredito: TEdit
              Left = 302
              Top = 23
              Width = 98
              Height = 23
              TabOrder = 1
            end
            object btnVincular: TBitBtn
              Left = 23
              Top = 52
              Width = 75
              Height = 25
              Caption = 'Vincular'
              TabOrder = 2
              OnClick = btnVincularClick
            end
            object cbbDistribuidor: TComboBox
              Left = 23
              Top = 23
              Width = 273
              Height = 23
              TabOrder = 0
              Text = 'Selecione um distribuidor'
            end
            object btnExcluirLimite: TBitBtn
              Left = 23
              Top = 204
              Width = 75
              Height = 25
              Caption = 'Excluir'
              TabOrder = 4
              OnClick = btnExcluirLimiteClick
            end
          end
        end
      end
    end
  end
end
