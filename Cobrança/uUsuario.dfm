inherited frmUsuario: TfrmUsuario
  Left = 305
  Top = 180
  Width = 437
  Height = 367
  Caption = 'Cadastro de Usuario'
  DefaultMonitor = dmMainForm
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 8
    Top = 40
    Width = 46
    Height = 13
    Caption = 'Pesquisa:'
  end
  object Label6: TLabel [1]
    Left = 20
    Top = 67
    Width = 34
    Height = 13
    Caption = 'Ordem:'
  end
  inherited pgCadastro: TPageControl
    Width = 417
    Height = 233
    TabOrder = 2
    OnChanging = pgCadastroChanging
    inherited tsConsulta: TTabSheet
      inherited dbgConsulta: TDBGrid
        Width = 406
        Height = 201
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
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USE_DESC'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited tsDados: TTabSheet
      object Label1: TLabel [0]
        Left = 18
        Top = 16
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel [1]
        Left = 15
        Top = 45
        Width = 39
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object Label3: TLabel [2]
        Left = 20
        Top = 78
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label4: TLabel [3]
        Left = 3
        Top = 111
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      inherited bitGravar: TBitBtn
        Left = 88
        Top = 152
        TabOrder = 3
        OnClick = bitGravarClick
      end
      inherited bitCancelar: TBitBtn
        Left = 208
        Top = 152
        TabOrder = 4
        OnClick = bitCancelarClick
      end
      object dbeCodigo: TDBEdit
        Left = 64
        Top = 8
        Width = 121
        Height = 21
        DataField = 'USE_COD'
        DataSource = dmSYS.dsUsuario
        ReadOnly = True
        TabOrder = 5
      end
      object dbeUser: TDBEdit
        Left = 64
        Top = 37
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dmSYS.dsUsuario
        TabOrder = 0
      end
      object dbeSenha: TDBEdit
        Left = 64
        Top = 70
        Width = 121
        Height = 21
        DataField = 'SENHA'
        DataSource = dmSYS.dsUsuario
        PasswordChar = '*'
        TabOrder = 1
      end
      object dbeDescricao: TDBEdit
        Left = 64
        Top = 103
        Width = 345
        Height = 21
        DataField = 'USE_DESC'
        DataSource = dmSYS.dsUsuario
        TabOrder = 2
      end
    end
  end
  inherited tbPrincipal: TToolBar
    Width = 421
    Height = 26
    AutoSize = True
    TabOrder = 3
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
    inherited tbIncluir: TToolButton
      OnClick = tbIncluirClick
    end
    inherited tbAlterar: TToolButton
      OnClick = tbAlterarClick
    end
    inherited tbExcluir: TToolButton
      OnClick = tbExcluirClick
    end
    inherited tbPesquisa: TToolButton
      OnClick = tbPesquisaClick
    end
  end
  object edtpesquisa: TEdit [4]
    Left = 64
    Top = 32
    Width = 353
    Height = 21
    TabOrder = 0
    OnChange = edtpesquisaChange
  end
  object cbOrdem: TComboBox [5]
    Left = 64
    Top = 64
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 1
    Text = 'Nome'
    OnSelect = cbOrdemSelect
    Items.Strings = (
      'C'#243'digo'
      'Nome'
      'Descri'#231#227'o')
  end
  inherited pnPadrao: TPopupMenu
    inherited pIncluir: TMenuItem
      OnClick = tbIncluirClick
    end
    inherited pAlterar: TMenuItem
      OnClick = tbAlterarClick
    end
    inherited pExcluir: TMenuItem
      OnClick = tbExcluirClick
    end
  end
end
