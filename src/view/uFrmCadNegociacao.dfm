inherited FrmCadNegociacao: TFrmCadNegociacao
  Caption = 'Cadastro de Negocia'#231#227'o'
  ClientHeight = 600
  ClientWidth = 800
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 806
  ExplicitHeight = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnButtons: TPanel
    Height = 600
    ExplicitHeight = 600
    inherited spbSair: TSpeedButton
      Top = 554
      ExplicitTop = 554
    end
    object spbManutencao: TSpeedButton
      Left = 8
      Top = 306
      Width = 110
      Height = 30
      Caption = 'Manuten'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76060000424D7606000000000000360000002800000014000000140000000100
        20000000000040060000C40E0000C40E00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DEDEDEFFD6D6D6FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
        C6FF000000FF292929FFBDBDBDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00212121FF181818FFCECECEFF9494
        94FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00BDBDBDFFD6D6D6FF636363FF000000FF6B6B6BFFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
        84FF737373FF7B7B7BFF7B7B7BFF737373FFFFFFFF00B5B5B5FF000000FF2929
        29FF000000FF6B6B6BFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00EFEFEFFF949494FF000000FF080808FF080808FF080808FF0000
        00FF292929FFFFFFFF007B7B7BFF000000FF292929FF000000FF737373FFFFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDEFF737373FF0000
        00FF292929FF292929FF292929FF292929FF080808FF313131FFFFFFFF008484
        84FF000000FF292929FFC6C6C6FF9C9C9CFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00DEDEDEFF7B7B7BFF000000FF292929FF292929FF292929FF2929
        29FF292929FF080808FF313131FFFFFFFF00848484FFC6C6C6FF848484FF0000
        00FFA5A5A5FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDEFF7B7B7BFF0000
        00FF292929FF292929FF292929FF292929FF292929FF292929FF080808FF2929
        29FFFFFFFF00BDBDBDFF000000FF101010FFD6D6D6FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00DEDEDEFF7B7B7BFF000000FF292929FF292929FF292929FF2929
        29FF292929FF292929FF313131FF000000FF9C9C9CFFFFFFFF008C8C8CFFDEDE
        DEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDEFF7B7B7BFF0000
        00FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF0000
        00FF949494FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00DEDEDEFF7B7B7BFF000000FF292929FF292929FF292929FF2929
        29FF292929FF292929FF292929FF000000FF949494FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDEFF737373FF0000
        00FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF0000
        00FF8C8C8CFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00EFEFEFFF949494FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFADADADFFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009494
        94FF848484FF8C8C8CFF8C8C8CFF8C8C8CFF848484FF848484FF7B7B7BFF9494
        94FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentFont = False
      OnClick = spbManutencaoClick
    end
  end
  inherited pgcMain: TPageControl
    Width = 671
    Height = 600
    ExplicitWidth = 671
    ExplicitHeight = 600
    inherited tbMain: TTabSheet
      ExplicitWidth = 663
      ExplicitHeight = 572
      object lblId: TLabel
        Left = 6
        Top = 66
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 192
        Top = 66
        Width = 93
        Height = 13
        Caption = 'Status Negocia'#231#227'o:'
      end
      object lblProdutor: TLabel
        Left = 5
        Top = 112
        Width = 46
        Height = 13
        Caption = 'Produtor:'
      end
      object lblDistribuidor: TLabel
        Left = 5
        Top = 168
        Width = 58
        Height = 13
        Caption = 'Distribuidor:'
      end
      object spbPesquisaDistribuidor: TSpeedButton
        Left = 416
        Top = 187
        Width = 23
        Height = 22
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000E7E7
          E7008181810042424200BFBFBF00181818006A6A6A00A3A3A300FFFFFF00D0D0
          D00030303000585858000A0A0A008E8E8E00B4B4B400F5F5F5006F6F6F002828
          2800DCDCDC00C9C9C900A6A6A600A1A1A100F3F3F30066666600040404007474
          74003A3A3A0048484800ADADAD001111110087878700EEEEEE00D9D9D900F8F8
          F8001E1E1E00C5C5C50060606000E5E5E500EDEDED00D7D7D700101010009494
          94007B7B7B00363636008C8C8C0046464600CCCCCC00FCFCFC00EAEAEA008585
          8500C3C3C30093939300E0E0E0004C4C4C00161616006C6C6C00060606007070
          70004A4A4A00F1F1F100DBDBDB001B1B1B00A7A7A700C7C7C700838383004444
          4400C1C1C10033333300767676003D3D3D00AFAFAF0014141400FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000080808080808
          0808080808080808080808080808080808080808080808080808080808080808
          080808080F2B3108080808080808080808080808080808080808081635000C07
          080808080808080808080808080808080808161B000000181E08080808080808
          080808080808080808213A00000000000B080808080808080808080808080808
          162D000000000039080808080808080808080808080808161B00000000000608
          0808080808080808080808080808213A00000000003708080808080808080808
          2307070742123A000000000037080808080808080808091B0000000000050000
          00000006080808080808080808321D002D070E1C240000000000370808080808
          08080808343D1807080808080823220018100808080808080808080839002908
          0808080808082E00221608080808080808080830364321080808080808080824
          380408080808080808080827002A0808080808080808081C0015080808080808
          0808082E00020808080808080808080E00070808080808080808082000060808
          080808080808081400070808080808080808083B112226080808080808080803
          3813080808080808080808080D00060808080808080807001B2F080808080808
          080808080F450037260808080F33001D09080808080808080808080808251A00
          363940190A00052308080808080808080808080808083B2C1100000047443C08
          080808080808080808080808080808081F3C2E27010808080808080808080808
          0808080808080808080808080808080808080808080808080808}
        OnClick = spbPesquisaDistribuidorClick
      end
      object spbPesquisaProdutor: TSpeedButton
        Left = 416
        Top = 130
        Width = 23
        Height = 22
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000E7E7
          E7008181810042424200BFBFBF00181818006A6A6A00A3A3A300FFFFFF00D0D0
          D00030303000585858000A0A0A008E8E8E00B4B4B400F5F5F5006F6F6F002828
          2800DCDCDC00C9C9C900A6A6A600A1A1A100F3F3F30066666600040404007474
          74003A3A3A0048484800ADADAD001111110087878700EEEEEE00D9D9D900F8F8
          F8001E1E1E00C5C5C50060606000E5E5E500EDEDED00D7D7D700101010009494
          94007B7B7B00363636008C8C8C0046464600CCCCCC00FCFCFC00EAEAEA008585
          8500C3C3C30093939300E0E0E0004C4C4C00161616006C6C6C00060606007070
          70004A4A4A00F1F1F100DBDBDB001B1B1B00A7A7A700C7C7C700838383004444
          4400C1C1C10033333300767676003D3D3D00AFAFAF0014141400FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000080808080808
          0808080808080808080808080808080808080808080808080808080808080808
          080808080F2B3108080808080808080808080808080808080808081635000C07
          080808080808080808080808080808080808161B000000181E08080808080808
          080808080808080808213A00000000000B080808080808080808080808080808
          162D000000000039080808080808080808080808080808161B00000000000608
          0808080808080808080808080808213A00000000003708080808080808080808
          2307070742123A000000000037080808080808080808091B0000000000050000
          00000006080808080808080808321D002D070E1C240000000000370808080808
          08080808343D1807080808080823220018100808080808080808080839002908
          0808080808082E00221608080808080808080830364321080808080808080824
          380408080808080808080827002A0808080808080808081C0015080808080808
          0808082E00020808080808080808080E00070808080808080808082000060808
          080808080808081400070808080808080808083B112226080808080808080803
          3813080808080808080808080D00060808080808080807001B2F080808080808
          080808080F450037260808080F33001D09080808080808080808080808251A00
          363940190A00052308080808080808080808080808083B2C1100000047443C08
          080808080808080808080808080808081F3C2E27010808080808080808080808
          0808080808080808080808080808080808080808080808080808}
        OnClick = spbPesquisaProdutorClick
      end
      object lblTitulo: TLabel
        Left = 6
        Top = 11
        Width = 196
        Height = 19
        Caption = 'Cadastro de Negocia'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtId: TEdit
        Left = 5
        Top = 85
        Width = 121
        Height = 21
        Color = clInfoBk
        Enabled = False
        NumbersOnly = True
        TabOrder = 0
      end
      object edtProdutor: TEdit
        Left = 5
        Top = 131
        Width = 405
        Height = 21
        Color = clInfoBk
        MaxLength = 255
        ReadOnly = True
        TabOrder = 1
      end
      object edtDistribuidor: TEdit
        Left = 5
        Top = 187
        Width = 405
        Height = 21
        Color = clInfoBk
        MaxLength = 255
        ReadOnly = True
        TabOrder = 2
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 215
        Width = 663
        Height = 357
        ActivePage = TabSheet1
        Align = alBottom
        TabOrder = 3
        object TabSheet1: TTabSheet
          Caption = 'Produto / Itens Negocia'#231#227'o'
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 552
            Height = 288
            Align = alClient
            DataSource = dsItensNegociacao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ITEM_NEGOCIACAO_ID'
                Title.Caption = 'C'#243'd. Item'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NEGOCIACAO_ID'
                Title.Caption = 'C'#243'd. Negocia'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PRODUTO_ID'
                Title.Caption = 'C'#243'd. Produto'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PRODUTO'
                Title.Caption = 'Produto'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Qtd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECO'
                Title.Caption = 'Pre'#231'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLR_TOTAL'
                Title.Caption = 'Vlr. Total'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 288
            Width = 655
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object lblTotalNegociacao: TLabel
              Left = 269
              Top = 6
              Width = 147
              Height = 19
              Caption = 'Total Negocia'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtTotalNegociacao: TEdit
              Left = 439
              Top = 6
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Color = clInfoBk
              Enabled = False
              NumbersOnly = True
              TabOrder = 0
            end
          end
          object Panel2: TPanel
            Left = 552
            Top = 0
            Width = 103
            Height = 288
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 2
            object spbInserirItem: TSpeedButton
              Left = 6
              Top = 9
              Width = 90
              Height = 30
              Hint = 'Inserir Item'
              BiDiMode = bdLeftToRight
              Caption = 'Inserir'
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000120B0000120B0000000100000000000000000000FFFF
                FF008A8A8A004B4B4B0099999900000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000010101010101
                0101010101010101010101010101010101010101010101010101010200000000
                0002010101010101010101010101010101010102000000000002010101010101
                0101010101010101010101020000000000020101010101010101010101010101
                0101010200000000000201010101010101010101010101010101010200000000
                0002010101010101010101010101010101010102000000000002010101010101
                0101010101010101010101040000000000040101010101010101010102020202
                0202020300000000000302020202020202010101000000000000000000000000
                0000000000000000000101010000000000000000000000000000000000000000
                0001010100000000000000000000000000000000000000000001010100000000
                0000000000000000000000000000000000010101000000000000000000000000
                0000000000000000000101010202020202020203000000000003020202020202
                0201010101010101010101040000000000040101010101010101010101010101
                0101010200000000000201010101010101010101010101010101010200000000
                0002010101010101010101010101010101010102000000000002010101010101
                0101010101010101010101020000000000020101010101010101010101010101
                0101010200000000000201010101010101010101010101010101010200000000
                0002010101010101010101010101010101010101010101010101010101010101
                0101010101010101010101010101010101010101010101010101}
              ParentShowHint = False
              ParentBiDiMode = False
              ShowHint = True
              OnClick = spbInserirItemClick
            end
            object spbExcluirItem: TSpeedButton
              Left = 6
              Top = 77
              Width = 90
              Height = 30
              Hint = 'Excluir Item'
              BiDiMode = bdLeftToRight
              Caption = 'Excluir'
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000120B0000120B0000000100000000000000000000D3D3
                D300585858002727270099999900FFFFFF0013131300E6E6E6004A4A4A007171
                7100A1A1A10046464600C7C7C70036363600858585006C6C6C00F5F5F5006A6A
                6A000404040020202000D9D9D900F3F3F300666666001C1C1C00E0E0E000F1F1
                F100404040009F9F9F000707070076767600F8F8F8009D9D9D004C4C4C002323
                23002B2B2B00A4A4A40000000000D5D5D500DBDBDB0087878700060606002424
                24004F4F4F000A0A0A0014141400C9C9C9000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000050505050505
                050505050505050505050505050505050505050505100D0E0505050505050505
                05050505100D0E05050505051020002B0A050505050505050505051520002B23
                050505070B000000121B0505050505050505150B000000122705052617000000
                0000040505050505051E08000000000002050505011700000000121F05050505
                150B0000000000090505050505142100000000121B0505150B00000000001105
                050505050505251300000000000A190800000000000F05050505050505050501
                1700000000062200000000000F05050505050505050505051421000000000000
                000000110505050505050505050505050525030000000000001C0F0505050505
                050505050505050505050C0000000000001A0505050505050505050505050505
                05152A0000000000002C1B050505050505050505050505051E08000000000000
                000000040505050505050505050505150B00000000002B00000000121F050505
                050505050505150B00000000001D0C2900000000121B050505050505051E0800
                000000000F050525130000000000040505050505150B00000000000F05050505
                011700000000120A050505070B00000000001105050505050514210000000012
                2705052617000000000F05050505050505052513000000000205050501170000
                0F05050505050505050505011700000905050505051403110505050505050505
                0505050514031105050505050505180505050505050505050505050505180505
                0505050505050505050505050505050505050505050505050505}
              ParentShowHint = False
              ParentBiDiMode = False
              ShowHint = True
              OnClick = spbExcluirItemClick
            end
            object spbAlterarItem: TSpeedButton
              Left = 5
              Top = 43
              Width = 90
              Height = 30
              Hint = 'Alterar Item'
              BiDiMode = bdLeftToRight
              Caption = 'Alterar'
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000120B0000120B0000000100000000000000000000DBDB
                DB008A8A8A003333330012121200C5C5C5005E5E5E00B9B9B900FFFFFF00B5B5
                B50008080800A9A9A9001E1E1E00A5A5A500D1D1D100A0A0A0001A1A1A00BDBD
                BD0021212100E6E6E6003D3D3D000C0C0C00CCCCCC0027272700E2E2E200C1C1
                C1001414140039393900AEAEAE00D3D3D30004040400181818000A0A0A00C8C8
                C800BBBBBB000E0E0E001C1C1C00B7B7B700D5D5D500C7C7C700E9E9E9003E3E
                3E00292929000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000080808000000
                0000000000000000000000000002080808080808080606060606060606060606
                0606060606110808080808080808080808080808080808080808080808080808
                080808080810101A0C190808080808080808080808080808080808080800001E
                0B0827160808080808080808080808080808080808000A1C0819150416080808
                080808080808080808080808080A0D08050400000C0E08080808080808080808
                08080808081108211A000000000C0E080808080808080808080808080808190A
                000000000000101608080808080808080808080808080700000000000000000C
                0E08080808080808080808080808081123000000000000000C0E080808080808
                0808080808080808071500000000000000101608080808080808080808080808
                08092000000000000000121D0808080808080808080808080808222300000000
                0000000C0E080808080808080808080808080807150000000000000024160808
                080808080808080808080808092000000000000000121D080808080808080808
                08080808080723000000000000000C0E0808080808080808080808080808070A
                000000000000000C0E0808080808080808080808080808091500000000000000
                171908080808080808080808080808082515000000000000001B080808080808
                080808080808080808090A000000000029010808080808080808080808080808
                080809150000000313080808080808080808080808080808080808071A001428
                08080808080808080808080808080808080808080F2A18080808}
              ParentShowHint = False
              ParentBiDiMode = False
              ShowHint = True
              OnClick = spbAlterarItemClick
            end
          end
        end
      end
      object edtStatus: TEdit
        Left = 192
        Top = 85
        Width = 218
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object dsItensNegociacao: TDataSource
    DataSet = cdsItensNegociacao
    Left = 392
    Top = 416
  end
  object cdsItensNegociacao: TClientDataSet
    PersistDataPacket.Data = {
      D50000009619E0BD010000001800000007000000000003000000D50012495445
      4D5F4E45474F43494143414F5F494404000100000000000D4E45474F43494143
      414F5F494404000100000000000A50524F4455544F5F49440400010000000000
      0750524F4455544F01004900000001000557494454480200020014000A515541
      4E544944414445040001000000000005505245434F0800040000000100075355
      42545950450200490006004D6F6E65790009564C525F544F54414C0800040000
      00010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 376
    object cdsItensNegociacaoITEM_NEGOCIACAO_ID: TIntegerField
      FieldName = 'ITEM_NEGOCIACAO_ID'
    end
    object cdsItensNegociacaoNEGOCIACAO_ID: TIntegerField
      FieldName = 'NEGOCIACAO_ID'
    end
    object cdsItensNegociacaoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object cdsItensNegociacaoPRODUTO: TStringField
      FieldName = 'PRODUTO'
    end
    object cdsItensNegociacaoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsItensNegociacaoPRECO: TCurrencyField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
    end
    object cdsItensNegociacaoVLR_TOTAL: TCurrencyField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '#,##0.00'
    end
  end
end