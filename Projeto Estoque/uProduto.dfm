inherited frmProduto: TfrmProduto
  Caption = 'Cadastro de Produto'
  ClientWidth = 415
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCadCons: TPageControl
    Width = 409
    OnChanging = pgCadConsChanging
    inherited tsConsulta: TTabSheet
      inherited dbgConsulta: TDBGrid
        Width = 401
        DataSource = dmSYS.dsProduto
        OnDblClick = dbgConsultaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PRO_COD'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_NOM'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_QTD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_VENDA'
            Title.Caption = 'Pre'#231'o Venda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_UNI'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_CUSTO'
            Title.Caption = 'Pre'#231'o Custo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRU_COD'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Grupo'
            Width = 130
            Visible = True
          end>
      end
    end
    inherited tsCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 24
        Top = 12
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel [1]
        Left = 29
        Top = 38
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel [2]
        Left = 28
        Top = 63
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object Label4: TLabel [3]
        Left = 17
        Top = 86
        Width = 40
        Height = 13
        Caption = 'Unidade'
      end
      object Label5: TLabel [4]
        Left = 33
        Top = 109
        Width = 24
        Height = 13
        Caption = 'Peso'
      end
      object Label6: TLabel [5]
        Left = 2
        Top = 138
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object Label7: TLabel [6]
        Left = 201
        Top = 109
        Width = 62
        Height = 13
        Caption = 'Pre'#231'o Venda'
      end
      object Label8: TLabel [7]
        Left = 205
        Top = 86
        Width = 58
        Height = 13
        Caption = 'Pre'#231'o Custo'
      end
      inherited BitGravar: TBitBtn
        Left = 91
        TabOrder = 6
      end
      inherited bitCancelar: TBitBtn
        Left = 220
        TabOrder = 7
      end
      object dbeCodigo: TDBEdit
        Left = 64
        Top = 8
        Width = 89
        Height = 21
        DataField = 'PRO_COD'
        DataSource = dmSYS.dsProduto
        ReadOnly = True
        TabOrder = 8
      end
      object dbeNome: TDBEdit
        Left = 64
        Top = 34
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_NOM'
        DataSource = dmSYS.dsProduto
        TabOrder = 0
      end
      object dbeGrupo: TDBEdit
        Left = 64
        Top = 59
        Width = 89
        Height = 21
        Hint = 'Duplo clique para abrir o Cadastro de Categoria.'
        DataField = 'GRU_COD'
        DataSource = dmSYS.dsProduto
        TabOrder = 1
        OnDblClick = dbeGrupoDblClick
      end
      object pnNomeGrupo: TPanel
        Left = 157
        Top = 59
        Width = 220
        Height = 21
        Alignment = taLeftJustify
        TabOrder = 9
        object dbtGrupo: TDBText
          Left = 5
          Top = 3
          Width = 212
          Height = 16
          DataField = 'Nome_Grupo'
          DataSource = dmSYS.dsProduto
        end
      end
      object Panel1: TPanel
        Left = 64
        Top = 128
        Width = 89
        Height = 33
        Caption = '0,000'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object dbeUni: TDBEdit
        Left = 64
        Top = 82
        Width = 89
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_UNI'
        DataSource = dmSYS.dsProduto
        TabOrder = 2
      end
      object dbePeso: TDBEdit
        Left = 64
        Top = 105
        Width = 89
        Height = 21
        DataField = 'PRO_PESO'
        DataSource = dmSYS.dsProduto
        TabOrder = 3
      end
      object dbePreVenda: TDBEdit
        Left = 272
        Top = 105
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_VENDA'
        DataSource = dmSYS.dsProduto
        TabOrder = 5
      end
      object dbePreCusto: TDBEdit
        Left = 272
        Top = 82
        Width = 105
        Height = 21
        DataField = 'PRO_CUSTO'
        DataSource = dmSYS.dsProduto
        TabOrder = 4
      end
    end
  end
  inherited tbCad: TToolBar
    Width = 415
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
    Width = 408
    inherited edtPesquisa: TEdit
      Width = 182
      OnChange = edtPesquisaChange
    end
    inherited cbOrden: TComboBox
      Width = 113
      ItemIndex = 0
      Text = 'Nome'
      OnSelect = cbOrdenSelect
      Items.Strings = (
        'Nome'
        'C'#243'digo'
        'Nome Grupo')
    end
  end
end
