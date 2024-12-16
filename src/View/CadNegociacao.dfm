object frmCadNegociacao: TfrmCadNegociacao
  Left = 0
  Top = 0
  Caption = 'Cadastro negocia'#231#227'o'
  ClientHeight = 441
  ClientWidth = 636
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
    Width = 636
    Height = 441
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object pgcProdutor: TPageControl
      Left = 1
      Top = 1
      Width = 634
      Height = 439
      ActivePage = tabCadastro
      Align = alClient
      TabOrder = 0
      object tabCadastro: TTabSheet
        Caption = 'Cadastro'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 626
          Height = 409
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object pnlCadNegociacao: TPanel
            Left = 1
            Top = 40
            Width = 624
            Height = 97
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label1: TLabel
              Left = 23
              Top = 11
              Width = 47
              Height = 15
              Caption = 'Produtor'
            end
            object Label2: TLabel
              Left = 263
              Top = 11
              Width = 62
              Height = 15
              Caption = 'Distribuidor'
            end
            object Label3: TLabel
              Left = 447
              Top = 10
              Width = 89
              Height = 15
              Caption = 'C'#243'digo Contrato'
            end
            object btnGravar: TBitBtn
              Left = 23
              Top = 55
              Width = 75
              Height = 25
              Caption = 'Gravar'
              TabOrder = 0
              OnClick = btnGravarClick
            end
            object edtIDCad: TEdit
              Left = 447
              Top = 27
              Width = 98
              Height = 23
              Enabled = False
              TabOrder = 1
            end
            object cbbProdutor: TComboBox
              Left = 23
              Top = 27
              Width = 234
              Height = 23
              TabOrder = 2
              OnChange = cbbProdutorChange
            end
            object cbbLimiteCredito: TComboBox
              Left = 263
              Top = 27
              Width = 178
              Height = 23
              TabOrder = 3
            end
          end
          object pnlItens: TPanel
            Left = 1
            Top = 137
            Width = 624
            Height = 271
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Label5: TLabel
              Left = 23
              Top = 6
              Width = 48
              Height = 15
              Caption = 'Produtos'
            end
            object Label8: TLabel
              Left = 245
              Top = 6
              Width = 23
              Height = 15
              Caption = 'Qtd.'
            end
            object lblStatus: TLabel
              Left = 404
              Top = 25
              Width = 92
              Height = 15
              Caption = 'Status Pendente'
              Color = clNavy
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object grdItensNegociacao: TStringGrid
              Left = 23
              Top = 52
              Width = 345
              Height = 124
              TabOrder = 2
              RowHeights = (
                24
                24
                24
                24
                24)
            end
            object btnVincular: TBitBtn
              Left = 303
              Top = 21
              Width = 65
              Height = 25
              Caption = 'Vincular'
              TabOrder = 1
              OnClick = btnVincularClick
            end
            object cbbProduto: TComboBox
              Left = 23
              Top = 22
              Width = 218
              Height = 23
              TabOrder = 0
            end
            object btnExcluirProduto: TBitBtn
              Left = 23
              Top = 178
              Width = 75
              Height = 25
              Caption = 'Excluir'
              TabOrder = 3
              OnClick = btnExcluirProdutoClick
            end
            object Panel8: TPanel
              Left = 374
              Top = 52
              Width = 171
              Height = 61
              Color = 4620609
              Padding.Top = 10
              ParentBackground = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
              object Panel13: TPanel
                Left = 1
                Top = 11
                Width = 169
                Height = 49
                Align = alClient
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Label4: TLabel
                  Left = 5
                  Top = 4
                  Width = 91
                  Height = 15
                  Caption = 'Limite Dispon'#237'vel'
                end
                object edtLimiteDisponivel: TEdit
                  Left = 3
                  Top = 20
                  Width = 172
                  Height = 21
                  Hint = 'Soma do Emolumento e da Taxa Judiciaria da Guia'
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 4620609
                  Font.Height = -17
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ReadOnly = True
                  ShowHint = True
                  TabOrder = 0
                  Text = 'R$ 0,00'
                  TextHint = 'Soma do Emolumento e da Taxa Judiciaria da Guia'
                end
              end
            end
            object Panel4: TPanel
              Left = 374
              Top = 116
              Width = 171
              Height = 61
              Color = clRed
              Padding.Top = 10
              ParentBackground = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 5
              object Panel5: TPanel
                Left = 1
                Top = 11
                Width = 169
                Height = 49
                Align = alClient
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object Label6: TLabel
                  Left = 4
                  Top = 4
                  Width = 75
                  Height = 15
                  Caption = 'Total Contrato'
                end
                object edtTotalContrato: TEdit
                  Left = 3
                  Top = 20
                  Width = 174
                  Height = 21
                  Hint = 'Soma do Emolumento e da Taxa Judiciaria da Guia'
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 4620609
                  Font.Height = -17
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ParentShowHint = False
                  ReadOnly = True
                  ShowHint = True
                  TabOrder = 0
                  Text = 'R$ 0,00'
                  TextHint = 'Soma do Emolumento e da Taxa Judiciaria da Guia'
                end
              end
            end
            object btnFinalizar: TBitBtn
              Left = 239
              Top = 216
              Width = 75
              Height = 51
              Caption = 'Finalizar'
              TabOrder = 6
              OnClick = btnFinalizarClick
            end
            object btnDesistirNegociacao: TBitBtn
              Left = 315
              Top = 216
              Width = 75
              Height = 51
              Caption = 'Descartar'
              TabOrder = 7
              OnClick = btnDesistirNegociacaoClick
            end
            object edtQtd: TSpinEdit
              Left = 245
              Top = 22
              Width = 56
              Height = 24
              MaxValue = 0
              MinValue = 0
              TabOrder = 8
              Value = 1
            end
          end
          object pnlTop: TPanel
            Left = 1
            Top = 1
            Width = 624
            Height = 39
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 2
            object btnIniciar: TBitBtn
              Left = 23
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Iniciar'
              TabOrder = 0
              OnClick = btnIniciarClick
            end
            object btnEditar: TBitBtn
              Left = 104
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Editar'
              Enabled = False
              TabOrder = 1
              OnClick = btnEditarClick
            end
          end
        end
      end
    end
  end
end
