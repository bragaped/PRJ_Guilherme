object dmSYS: TdmSYS
  OldCreateOrder = False
  Left = 372
  Top = 193
  Height = 245
  Width = 332
  object ibdCobranca: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = ibtCobranca
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 24
  end
  object ibtCobranca: TIBTransaction
    Active = False
    DefaultDatabase = ibdCobranca
    AutoStopAction = saNone
    Left = 32
    Top = 80
  end
  object qryCob: TIBQuery
    Database = ibdCobranca
    Transaction = ibtCobranca
    ForcedRefresh = True
    AfterInsert = qryCobAfterInsert
    BeforeInsert = qryCobBeforeInsert
    BeforePost = qryCobBeforePost
    OnCalcFields = qryCobCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from COBRANCA')
    UpdateObject = ibuCob
    Left = 104
    Top = 24
    object qryCobCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'COBRANCA.CODIGO'
      Required = True
    end
    object qryCobDATA: TDateField
      DisplayLabel = 'Data_Lan'#231'amento'
      FieldName = 'DATA'
      Origin = 'COBRANCA.DATA'
      Required = True
      OnSetText = qryCobDATASetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryCobCLIENTE: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'COBRANCA.CLIENTE'
      Required = True
      Size = 50
    end
    object qryCobDATA_BAIXA: TDateField
      DisplayLabel = 'Data_Baixa'
      FieldName = 'DATA_BAIXA'
      Origin = 'COBRANCA.DATA_BAIXA'
      Required = True
      OnSetText = qryCobDATA_BAIXASetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryCobBAIXADO: TIBStringField
      DisplayLabel = 'Baixado'
      FieldName = 'BAIXADO'
      Origin = 'COBRANCA.BAIXADO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryCobRESPONSALVEL: TIBStringField
      DisplayLabel = 'Responsavel'
      FieldName = 'RESPONSALVEL'
      Origin = 'COBRANCA.RESPONSALVEL'
      Required = True
      Size = 15
    end
    object qryCobEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'COBRANCA.EMPRESA'
      Required = True
      Size = 5
    end
    object qryCobHAVER: TFloatField
      DisplayLabel = 'Haver'
      FieldName = 'HAVER'
      Origin = 'COBRANCA.HAVER'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qryCobVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Origin = 'COBRANCA.VALOR'
      Required = True
      OnChange = qryCobVALORChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qryCobDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      Origin = 'COBRANCA.DESCONTO'
      OnChange = qryCobVALORChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qryCobJUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      Origin = 'COBRANCA.JUROS'
      OnChange = qryCobVALORChange
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qryCobTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      Origin = 'COBRANCA.TOTAL'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object ibuCob: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DATA,'
      '  CLIENTE,'
      '  DATA_BAIXA,'
      '  BAIXADO,'
      '  RESPONSALVEL,'
      '  EMPRESA,'
      '  HAVER,'
      '  VALOR,'
      '  DESCONTO,'
      '  JUROS,'
      '  TOTAL'
      'from COBRANCA '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update COBRANCA'
      'set'
      '  DATA = :DATA,'
      '  CLIENTE = :CLIENTE,'
      '  DATA_BAIXA = :DATA_BAIXA,'
      '  BAIXADO = :BAIXADO,'
      '  RESPONSALVEL = :RESPONSALVEL,'
      '  EMPRESA = :EMPRESA,'
      '  HAVER = :HAVER,'
      '  VALOR = :VALOR,'
      '  DESCONTO = :DESCONTO,'
      '  JUROS = :JUROS,'
      '  TOTAL = :TOTAL'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into COBRANCA'
      
        '  (DATA, CLIENTE, DATA_BAIXA, BAIXADO, RESPONSALVEL, EMPRESA, HA' +
        'VER, '
      'VALOR, '
      '   DESCONTO, JUROS, TOTAL)'
      'values'
      
        '  (:DATA, :CLIENTE, :DATA_BAIXA, :BAIXADO, :RESPONSALVEL, :EMPRE' +
        'SA, '
      ':HAVER, '
      '   :VALOR, :DESCONTO, :JUROS, :TOTAL)')
    DeleteSQL.Strings = (
      'delete from COBRANCA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 104
    Top = 80
  end
  object dsCob: TDataSource
    DataSet = qryCob
    OnDataChange = dsCobDataChange
    Left = 152
    Top = 24
  end
  object dsUsuario: TDataSource
    DataSet = qryUsuario
    Left = 272
    Top = 24
  end
  object qryUsuario: TIBQuery
    Database = ibdCobranca
    Transaction = ibtCobranca
    ForcedRefresh = True
    AfterInsert = qryUsuarioAfterInsert
    BeforeInsert = qryUsuarioBeforeInsert
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from USUARIO')
    UpdateObject = ibuUsuario
    Left = 216
    Top = 24
    object qryUsuarioUSE_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USE_COD'
      Origin = 'USUARIO.USE_COD'
      Required = True
    end
    object qryUsuarioNOME: TIBStringField
      DisplayLabel = 'Us'#250'ario'
      DisplayWidth = 10
      FieldName = 'NOME'
      Origin = 'USUARIO.NOME'
      Required = True
      Size = 10
    end
    object qryUsuarioSENHA: TIBStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = 'USUARIO.SENHA'
      Size = 8
    end
    object qryUsuarioUSE_DESC: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'USE_DESC'
      Origin = 'USUARIO.USE_DESC'
      Size = 70
    end
  end
  object ibuUsuario: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  USE_COD,'
      '  NOME,'
      '  SENHA,'
      '  USE_DESC'
      'from USUARIO '
      'where'
      '  USE_COD = :USE_COD')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  USE_DESC = :USE_DESC'
      'where'
      '  USE_COD = :OLD_USE_COD')
    InsertSQL.Strings = (
      'insert into USUARIO'
      '  (NOME, SENHA, USE_DESC)'
      'values'
      '  (:NOME, :SENHA, :USE_DESC)')
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  USE_COD = :OLD_USE_COD')
    Left = 216
    Top = 80
  end
end
