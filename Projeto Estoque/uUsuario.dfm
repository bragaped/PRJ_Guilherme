inherited frmUsuario: TfrmUsuario
  Left = 262
  Caption = 'Cadastro de Usuario'
  ClientHeight = 285
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCadCons: TPageControl
    Height = 201
    OnChanging = pgCadConsChanging
    inherited tsConsulta: TTabSheet
      inherited dbgConsulta: TDBGrid
        Height = 173
        DataSource = dmSYS.dsUsuario
        Columns = <
          item
            Expanded = False
            FieldName = 'USE_COD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USE_OBS'
            Width = 240
            Visible = True
          end>
      end
    end
    inherited tsCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 29
        Top = 14
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel [1]
        Left = 34
        Top = 40
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label3: TLabel [2]
        Left = 31
        Top = 64
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label4: TLabel [3]
        Left = 4
        Top = 88
        Width = 61
        Height = 13
        Caption = 'Observa'#231#227'o:'
      end
      inherited BitGravar: TBitBtn
        Top = 137
      end
      inherited bitCancelar: TBitBtn
        Top = 137
      end
      object dbecodigo: TDBEdit
        Left = 69
        Top = 6
        Width = 121
        Height = 21
        DataField = 'USE_COD'
        DataSource = dmSYS.dsUsuario
        ReadOnly = True
        TabOrder = 2
      end
      object dbeNome: TDBEdit
        Left = 69
        Top = 32
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dmSYS.dsUsuario
        TabOrder = 3
      end
      object dbeSenha: TDBEdit
        Left = 69
        Top = 56
        Width = 121
        Height = 21
        DataField = 'SENHA'
        DataSource = dmSYS.dsUsuario
        PasswordChar = '*'
        TabOrder = 4
      end
      object dbreObs: TDBRichEdit
        Left = 69
        Top = 80
        Width = 252
        Height = 49
        DataField = 'USE_OBS'
        DataSource = dmSYS.dsUsuario
        TabOrder = 5
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
