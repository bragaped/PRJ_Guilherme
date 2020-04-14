inherited frmGrupo: TfrmGrupo
  Left = 218
  Top = 189
  Caption = 'Cadastro de Categoria'
  ClientHeight = 293
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCadCons: TPageControl
    Height = 209
    ActivePage = tsCadastro
    OnChanging = pgCadConsChanging
    inherited tsConsulta: TTabSheet
      inherited dbgConsulta: TDBGrid
        Height = 181
        DataSource = dmSYS.dsGrupo
        OnDblClick = dbgConsultaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'GRU_COD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRU_NOM'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRU_OBS'
            Width = 180
            Visible = True
          end>
      end
    end
    inherited tsCadastro: TTabSheet
      object lbcodigo: TLabel [0]
        Left = 33
        Top = 16
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object lbNome: TLabel [1]
        Left = 38
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object lbObs: TLabel [2]
        Left = 8
        Top = 62
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      inherited BitGravar: TBitBtn
        Top = 146
        TabOrder = 3
      end
      inherited bitCancelar: TBitBtn
        Top = 146
        TabOrder = 4
      end
      object dbeCodigo: TDBEdit
        Left = 71
        Top = 8
        Width = 98
        Height = 21
        DataField = 'GRU_COD'
        DataSource = dmSYS.dsGrupo
        ReadOnly = True
        TabOrder = 0
      end
      object dbeNome: TDBEdit
        Left = 71
        Top = 36
        Width = 218
        Height = 21
        CharCase = ecUpperCase
        DataField = 'GRU_NOM'
        DataSource = dmSYS.dsGrupo
        TabOrder = 1
      end
      object dbreObs: TDBRichEdit
        Left = 71
        Top = 62
        Width = 218
        Height = 75
        DataField = 'GRU_OBS'
        DataSource = dmSYS.dsGrupo
        TabOrder = 2
      end
    end
  end
  inherited tbCad: TToolBar
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
    inherited edtPesquisa: TEdit
      OnChange = edtPesquisaChange
    end
    inherited cbOrden: TComboBox
      ItemIndex = 0
      Text = 'Nome'
      OnSelect = cbOrdenSelect
      Items.Strings = (
        'Nome'
        'C'#243'digo')
    end
  end
end
