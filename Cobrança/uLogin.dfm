object frmLogin: TfrmLogin
  Left = 339
  Top = 288
  Width = 272
  Height = 105
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 39
    Height = 13
    Caption = 'Us'#250'ario:'
  end
  object Label2: TLabel
    Left = 13
    Top = 50
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object bitOK: TBitBtn
    Left = 180
    Top = 8
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    OnClick = bitOKClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object bitSair: TBitBtn
    Left = 180
    Top = 38
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 3
    OnClick = bitSairClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object edtuser: TEdit
    Left = 52
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 52
    Top = 42
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object dsLogin: TDataSource
    DataSet = qrylogin
    Left = 112
  end
  object qrylogin: TIBQuery
    Database = dmSYS.ibdCobranca
    Transaction = dmSYS.ibtCobranca
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select NOME, SENHA, USE_COD from USUARIO'
      'where NOME = :Usuario')
    Left = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end>
    object qryloginNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'USUARIO.NOME'
      Required = True
      Size = 10
    end
    object qryloginSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'USUARIO.SENHA'
      Size = 8
    end
    object qryloginUSE_COD: TIntegerField
      FieldName = 'USE_COD'
      Origin = 'USUARIO.USE_COD'
      Required = True
    end
  end
end
