object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Despesas'
  ClientHeight = 360
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 659
    Height = 360
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Despesas'
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 651
        Height = 332
        ActivePage = Lista
        Align = alClient
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'Cadastro'
          object Label4: TLabel
            Left = 16
            Top = 16
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = DBEdit4
          end
          object Label5: TLabel
            Left = 16
            Top = 64
            Width = 55
            Height = 13
            Caption = 'Vencimento'
          end
          object Label6: TLabel
            Left = 16
            Top = 112
            Width = 24
            Height = 13
            Caption = 'Valor'
            FocusControl = DBEdit6
          end
          object Label7: TLabel
            Left = 16
            Top = 157
            Width = 54
            Height = 13
            Caption = 'Pagamento'
          end
          object DBNavigator1: TDBNavigator
            Left = 16
            Top = 203
            Width = 240
            Height = 25
            DataSource = DSDespesas
            TabOrder = 4
          end
          object DBEdit4: TDBEdit
            Left = 16
            Top = 32
            Width = 600
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = DSDespesas
            TabOrder = 0
          end
          object DBEdit6: TDBEdit
            Left = 16
            Top = 128
            Width = 121
            Height = 21
            DataField = 'VALOR'
            DataSource = DSDespesas
            TabOrder = 2
          end
          object JvDBDateEdit1: TJvDBDateEdit
            Left = 16
            Top = 83
            Width = 121
            Height = 21
            DataField = 'DATA_VENCIMENTO'
            DataSource = DSDespesas
            CheckOnExit = True
            DefaultToday = True
            TabOrder = 1
          end
          object JvDBDateEdit2: TJvDBDateEdit
            Left = 16
            Top = 176
            Width = 121
            Height = 21
            DataField = 'DATA_PAGAMENTO'
            DataSource = DSDespesas
            CheckOnExit = True
            TabOrder = 3
          end
        end
        object Lista: TTabSheet
          Caption = 'Lista'
          ImageIndex = 1
          object DBGrid2: TDBGrid
            Left = 0
            Top = 33
            Width = 643
            Height = 271
            Align = alClient
            DataSource = DSDespesas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_VENCIMENTO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_PAGAMENTO'
                Width = 100
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 643
            Height = 33
            Align = alTop
            TabOrder = 1
            object Label8: TLabel
              Left = 5
              Top = 8
              Width = 23
              Height = 13
              Caption = 'Data'
            end
            object JvDateEdit1: TJvDateEdit
              Left = 34
              Top = 5
              Width = 121
              Height = 21
              DefaultToday = True
              TabOrder = 0
            end
            object JvDateEdit2: TJvDateEdit
              Left = 161
              Top = 5
              Width = 121
              Height = 21
              DefaultToday = True
              TabOrder = 1
            end
            object CheckBox1: TCheckBox
              Left = 288
              Top = 7
              Width = 97
              Height = 17
              Caption = 'Pago'
              TabOrder = 2
            end
            object BitBtn1: TBitBtn
              Left = 421
              Top = 2
              Width = 75
              Height = 25
              Caption = 'Imprimir'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 3
              OnClick = BitBtn1Click
            end
            object BitBtn2: TBitBtn
              Left = 336
              Top = 2
              Width = 75
              Height = 25
              Caption = 'Consultar'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 4
              OnClick = BitBtn2Click
            end
          end
          object QuickRep1: TQuickRep
            Left = 0
            Top = 448
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = CDSDespesas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevShowThumbs = False
            PrevShowSearch = False
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object QRBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 19
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = True
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 0
                Top = 0
                Width = 63
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  0.000000000000000000
                  0.000000000000000000
                  166.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descricao'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRLabel2: TQRLabel
                Left = 512
                Top = 0
                Width = 77
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1354.666666666667000000
                  0.000000000000000000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Vencimento'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 423
                Top = 0
                Width = 35
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1119.187500000000000000
                  0.000000000000000000
                  92.604166666666670000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Valor'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRLabel4: TQRLabel
                Left = 632
                Top = 0
                Width = 74
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1672.166666666667000000
                  0.000000000000000000
                  195.791666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Pagamento'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object QRBand2: TQRBand
              Left = 38
              Top = 57
              Width = 718
              Height = 18
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                47.625000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 0
                Top = 0
                Width = 77
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  0.000000000000000000
                  0.000000000000000000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = CDSDespesas
                DataField = 'DESCRICAO'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRDBText2: TQRDBText
                Left = 413
                Top = 0
                Width = 45
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1092.729166666667000000
                  0.000000000000000000
                  119.062500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = CDSDespesas
                DataField = 'VALOR'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRDBText3: TQRDBText
                Left = 462
                Top = 0
                Width = 127
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1222.375000000000000000
                  0.000000000000000000
                  336.020833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = CDSDespesas
                DataField = 'DATA_VENCIMENTO'
                Transparent = True
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
              object QRDBText4: TQRDBText
                Left = 581
                Top = 0
                Width = 125
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1537.229166666667000000
                  0.000000000000000000
                  330.729166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = CDSDespesas
                DataField = 'DATA_PAGAMENTO'
                Transparent = True
                WordWrap = True
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
            object QRBand3: TQRBand
              Left = 38
              Top = 75
              Width = 718
              Height = 28
              Frame.Color = clBlack
              Frame.DrawTop = True
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                74.083333333333340000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRExpr1: TQRExpr
                Left = 192
                Top = 5
                Width = 266
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  508.000000000000000000
                  13.229166666666670000
                  703.791666666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                ResetAfterPrint = False
                Transparent = False
                WordWrap = True
                Expression = 
                  #39'Valor Total: R$  '#39' + FORMATNUMERIC('#39'###,###,##0.00'#39', SUM(CDSDes' +
                  'pesas.VALOR))'
                ExportAs = exptText
                WrapStyle = BreakOnSpaces
                FontSize = 10
              end
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Conta Corrente'
      ImageIndex = 1
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 651
        Height = 332
        ActivePage = TabSheet5
        Align = alClient
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Cadastro'
          object Label1: TLabel
            Left = 16
            Top = 0
            Width = 29
            Height = 13
            Caption = 'Banco'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 16
            Top = 45
            Width = 29
            Height = 13
            Caption = 'Conta'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 16
            Top = 96
            Width = 24
            Height = 13
            Caption = 'Valor'
            FocusControl = DBEdit3
          end
          object DBNavigator2: TDBNavigator
            Left = 16
            Top = 139
            Width = 240
            Height = 25
            DataSource = DSBancos
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 16
            Width = 616
            Height = 21
            DataField = 'BANCO'
            DataSource = DSBancos
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 16
            Top = 64
            Width = 212
            Height = 21
            DataField = 'CONTA'
            DataSource = DSBancos
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 16
            Top = 112
            Width = 212
            Height = 21
            DataField = 'VALOR'
            DataSource = DSBancos
            TabOrder = 3
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Lista'
          ImageIndex = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 643
            Height = 304
            Align = alClient
            DataSource = DSBancos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'BANCO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Visible = True
              end>
          end
        end
      end
    end
  end
  object SQLCFirebird: TSQLConnection
    ConnectionName = 'Despesas'
    DriverName = 'FIREBIRD'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=FIREBIRD'
      'blobsize=-1'
      'commitretain=False'
      'Database=D:\Projetos\Guilherme\Despesas\DESPESAS.FDB'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'fbclient.dll'
    Left = 544
    Top = 192
  end
  object SQLDSBancos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select BANCO, CONTA, ID, VALOR from BANCO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCFirebird
    Left = 544
    Top = 240
    object SQLDSBancosBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SQLDSBancosCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDSBancosID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLDSBancosVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object SQLDSDespesas: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select DATA_PAGAMENTO, DATA_VENCIMENTO, DESCRICAO, ID, VALOR fro' +
      'm DESPESAS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCFirebird
    Left = 544
    Top = 288
    object SQLDSDespesasDATA_PAGAMENTO: TDateField
      DisplayLabel = 'Pagamento'
      FieldName = 'DATA_PAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDSDespesasDATA_VENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDSDespesasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object SQLDSDespesasID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLDSDespesasVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object DSPBancos: TDataSetProvider
    DataSet = SQLDSBancos
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 472
    Top = 240
  end
  object DSPDespesas: TDataSetProvider
    DataSet = SQLDSDespesas
    Options = [poIncFieldProps, poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 472
    Top = 288
  end
  object CDSBancos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPBancos'
    AfterInsert = CDSBancosAfterInsert
    AfterPost = CDSBancosAfterPost
    OnPostError = CDSBancosPostError
    Left = 408
    Top = 240
    object CDSBancosBANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object CDSBancosCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object CDSBancosID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Required = True
    end
    object CDSBancosVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object DSBancos: TDataSource
    DataSet = CDSBancos
    Left = 344
    Top = 240
  end
  object CDSDespesas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPDespesas'
    AfterInsert = CDSBancosAfterInsert
    AfterPost = CDSBancosAfterPost
    OnPostError = CDSBancosPostError
    Left = 408
    Top = 288
    object CDSDespesasDATA_PAGAMENTO: TDateField
      DisplayLabel = 'Pagamento'
      FieldName = 'DATA_PAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object CDSDespesasDATA_VENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'DATA_VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object CDSDespesasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object CDSDespesasID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSDespesasVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.00'
      Precision = 15
      Size = 2
    end
  end
  object DSDespesas: TDataSource
    DataSet = CDSDespesas
    Left = 344
    Top = 288
  end
  object SQLQOperacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCFirebird
    Left = 472
    Top = 192
  end
end
