inherited frmMovimentacao: TfrmMovimentacao
  Left = 247
  Top = 153
  Caption = 'Lan'#231'amento de Movimenta'#231#245'es'
  ClientHeight = 422
  ClientWidth = 543
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCadCons: TPageControl
    Width = 536
    Height = 337
    inherited tsConsulta: TTabSheet
      inherited dbgConsulta: TDBGrid
        Width = 528
        Height = 309
        DataSource = dmSYS.dsLancamento
        Columns = <
          item
            Expanded = False
            FieldName = 'NRO_NF'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANC_DATA'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANC_DATA_MOV'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANC_TIP'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LANC_SIT'
            Width = 75
            Visible = True
          end>
      end
    end
    inherited tsCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 147
        Top = 34
        Width = 96
        Height = 13
        Caption = 'Data Movimenta'#231#227'o'
      end
      object Label2: TLabel [1]
        Left = 220
        Top = 59
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label3: TLabel [2]
        Left = 220
        Top = 10
        Width = 23
        Height = 13
        Caption = 'Nota'
      end
      object LbSit: TDBText [3]
        Left = 440
        Top = 8
        Width = 81
        Height = 17
        Color = clNavy
        DataField = 'LANC_SIT'
        DataSource = dmSYS.dsLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel [4]
        Left = 384
        Top = 8
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      inherited BitGravar: TBitBtn
        Left = 155
        Top = 271
        TabOrder = 5
      end
      inherited bitCancelar: TBitBtn
        Left = 284
        Top = 271
        TabOrder = 6
      end
      object rbTipMov: TDBRadioGroup
        Left = 6
        Top = 4
        Width = 137
        Height = 41
        Caption = 'Tipo Movimenta'#231#227'o'
        Columns = 2
        DataField = 'LANC_TIP'
        DataSource = dmSYS.dsLancamento
        Items.Strings = (
          'Sa'#237'da'
          'Entrada')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object dbeNota: TDBEdit
        Left = 248
        Top = 6
        Width = 97
        Height = 21
        DataField = 'NRO_NF'
        DataSource = dmSYS.dsLancamento
        TabOrder = 1
      end
      object pgMov: TPageControl
        Left = 1
        Top = 74
        Width = 526
        Height = 193
        ActivePage = tsItens
        TabOrder = 4
        object tsItens: TTabSheet
          Caption = 'Itens'
          object dbgItensMov: TDBGrid
            Left = 0
            Top = 0
            Width = 518
            Height = 165
            Align = alClient
            DataSource = dmSYS.dsItens_Lanc
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'PRO_COD'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome_Pro'
                ReadOnly = True
                Title.Caption = 'Nome'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITENS_QTDE'
                Title.Caption = 'Qtde'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITENS_VENDA'
                ReadOnly = True
                Title.Caption = 'Pre'#231'o'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITENS_DESC'
                Title.Caption = 'Desconto'
                Width = 55
                Visible = True
              end>
          end
        end
      end
      object dtpDataMov: TDateTimePicker
        Left = 249
        Top = 30
        Width = 97
        Height = 21
        Date = 39678.903179432870000000
        Time = 39678.903179432870000000
        TabOrder = 2
      end
      object dtpData: TDateTimePicker
        Left = 249
        Top = 55
        Width = 97
        Height = 21
        Date = 39678.903179432870000000
        Time = 39678.903179432870000000
        TabOrder = 3
      end
    end
  end
  inherited tbCad: TToolBar
    Width = 543
    inherited tbPrimeiro: TToolButton
      OnClick = tbPrimeiroClick
    end
    inherited tbAnterior: TToolButton
      OnClick = tbAnteriorClick
    end
    inherited tbProximo: TToolButton
      OnClick = tbProximoClick
    end
    inherited tbUltimo: TToolButton
      OnClick = tbUltimoClick
    end
    inherited tbExcluir: TToolButton
      OnClick = tbExcluirClick
    end
  end
  inherited gbPesquisa: TGroupBox
    Width = 536
    inherited lbOrdem: TLabel
      Left = 288
    end
    inherited edtPesquisa: TEdit
      Width = 222
    end
    inherited cbOrden: TComboBox
      Left = 328
    end
  end
end
