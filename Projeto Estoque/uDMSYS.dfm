object dmSYS: TdmSYS
  OldCreateOrder = False
  Left = 280
  Top = 163
  Height = 280
  Width = 605
  object ibtEstoque: TIBTransaction
    Active = False
    DefaultDatabase = ibdEstoque
    AutoStopAction = saNone
    Left = 96
    Top = 8
  end
  object ibdEstoque: TIBDatabase
    DatabaseName = 
      'localhost:D:\Projetos\Guilherme\Projeto Estoque\Banco\BDESTOQUE.' +
      'FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = ibtEstoque
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 8
  end
  object ibuGrupo: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  GRU_COD,'
      '  GRU_NOM,'
      '  GRU_OBS'
      'from GRUPO '
      'where'
      '  GRU_COD = :GRU_COD')
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  GRU_COD = :GRU_COD,'
      '  GRU_NOM = :GRU_NOM,'
      '  GRU_OBS = :GRU_OBS'
      'where'
      '  GRU_COD = :OLD_GRU_COD')
    InsertSQL.Strings = (
      'insert into GRUPO'
      '  (GRU_COD, GRU_NOM, GRU_OBS)'
      'values'
      '  (:GRU_COD, :GRU_NOM, :GRU_OBS)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  GRU_COD = :OLD_GRU_COD')
    Left = 89
    Top = 108
  end
  object dsGrupo: TDataSource
    DataSet = qryGrupo
    Left = 89
    Top = 153
  end
  object dsUsuario: TDataSource
    DataSet = qryUsuario
    Left = 24
    Top = 153
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 153
    Top = 153
  end
  object dsLancamento: TDataSource
    DataSet = qryLancamento
    Left = 277
    Top = 174
  end
  object ibuUsuario: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  USE_COD,'
      '  NOME,'
      '  SENHA,'
      '  USE_OBS'
      'from USUARIO '
      'where'
      '  USE_COD = :USE_COD')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  USE_COD = :USE_COD,'
      '  NOME = :NOME,'
      '  SENHA = :SENHA,'
      '  USE_OBS = :USE_OBS'
      'where'
      '  USE_COD = :OLD_USE_COD')
    InsertSQL.Strings = (
      'insert into USUARIO'
      '  (USE_COD, NOME, SENHA, USE_OBS)'
      'values'
      '  (:USE_COD, :NOME, :SENHA, :USE_OBS)')
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  USE_COD = :OLD_USE_COD')
    Left = 24
    Top = 108
  end
  object ibuProduto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  PRO_COD,'
      '  GRU_COD,'
      '  PRO_NOM,'
      '  PRO_PESO,'
      '  PRO_UNI,'
      '  PRO_QTD,'
      '  PRO_VENDA,'
      '  PRO_CUSTO'
      'from PRODUTO '
      'where'
      '  PRO_COD = :PRO_COD')
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  PRO_COD = :PRO_COD,'
      '  GRU_COD = :GRU_COD,'
      '  PRO_NOM = :PRO_NOM,'
      '  PRO_PESO = :PRO_PESO,'
      '  PRO_UNI = :PRO_UNI,'
      '  PRO_QTD = :PRO_QTD,'
      '  PRO_VENDA = :PRO_VENDA,'
      '  PRO_CUSTO = :PRO_CUSTO'
      'where'
      '  PRO_COD = :OLD_PRO_COD')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      '  (PRO_COD, GRU_COD, PRO_NOM, PRO_PESO, PRO_UNI, PRO_QTD, '
      'PRO_VENDA, PRO_CUSTO)'
      'values'
      '  (:PRO_COD, :GRU_COD, :PRO_NOM, :PRO_PESO, :PRO_UNI, :PRO_QTD, '
      ':PRO_VENDA, '
      '   :PRO_CUSTO)')
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  PRO_COD = :OLD_PRO_COD')
    Left = 153
    Top = 108
  end
  object qryUsuario: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    AfterPost = qryUsuarioAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from USUARIO')
    UpdateObject = ibuUsuario
    GeneratorField.Field = 'USE_COD'
    GeneratorField.Generator = 'GEN_USUARIO_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 24
    Top = 64
    object qryUsuarioUSE_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USE_COD'
      Origin = 'USUARIO.USE_COD'
      Required = True
    end
    object qryUsuarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'USUARIO.NOME'
      Required = True
      Size = 8
    end
    object qryUsuarioSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'USUARIO.SENHA'
      Size = 8
    end
    object qryUsuarioUSE_OBS: TIBStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'USE_OBS'
      Origin = 'USUARIO.USE_OBS'
      Size = 70
    end
  end
  object qryProduto: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    AfterPost = qryProdutoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PRODUTO')
    UpdateObject = ibuProduto
    GeneratorField.Field = 'PRO_COD'
    GeneratorField.Generator = 'GEN_PRODUTO_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 153
    Top = 64
    object qryProdutoPRO_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Codigo'
      FieldName = 'PRO_COD'
      Origin = 'PRODUTO.PRO_COD'
      Required = True
    end
    object qryProdutoGRU_COD: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRU_COD'
      Origin = 'PRODUTO.GRU_COD'
    end
    object qryProdutoPRO_NOM: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'PRO_NOM'
      Origin = 'PRODUTO.PRO_NOM'
      Size = 45
    end
    object qryProdutoPRO_PESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PRO_PESO'
      Origin = 'PRODUTO.PRO_PESO'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object qryProdutoPRO_UNI: TIBStringField
      DisplayLabel = 'Unidade'
      FieldName = 'PRO_UNI'
      Origin = 'PRODUTO.PRO_UNI'
      FixedChar = True
      Size = 2
    end
    object qryProdutoPRO_CUSTO: TFloatField
      FieldName = 'PRO_CUSTO'
      Origin = 'PRODUTO.PRO_CUSTO'
    end
    object qryProdutoPRO_VENDA: TFloatField
      FieldName = 'PRO_VENDA'
      Origin = 'PRODUTO.PRO_VENDA'
    end
    object qryProdutoPRO_QTD: TFloatField
      DisplayLabel = 'Qtde'
      FieldName = 'PRO_QTD'
      Origin = 'PRODUTO.PRO_QTD'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object qryProdutoNome_Grupo: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome_Grupo'
      LookupDataSet = qryGrupo
      LookupKeyFields = 'GRU_COD'
      LookupResultField = 'GRU_NOM'
      KeyFields = 'GRU_COD'
      Size = 50
      Lookup = True
    end
  end
  object qryLancamento: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    AfterPost = qryUsuarioAfterPost
    BeforePost = qryLancamentoBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from LANCAMENTOS')
    UpdateObject = ibuLancamento
    GeneratorField.Field = 'LANC_COD'
    GeneratorField.Generator = 'GEN_LANCAMENTOS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 277
    Top = 80
    object qryLancamentoLANC_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'LANC_COD'
      Origin = 'LANCAMENTOS.LANC_COD'
      Required = True
    end
    object qryLancamentoLANC_TIP: TIntegerField
      FieldName = 'LANC_TIP'
      Origin = 'LANCAMENTOS.LANC_TIP'
      Required = True
    end
    object qryLancamentoLANC_SIT: TIntegerField
      FieldName = 'LANC_SIT'
      Origin = 'LANCAMENTOS.LANC_SIT'
      OnGetText = qryLancamentoLANC_SITGetText
    end
    object qryLancamentoLANC_DATA_MOV: TDateField
      FieldName = 'LANC_DATA_MOV'
      Origin = 'LANCAMENTOS.LANC_DATA_MOV'
    end
    object qryLancamentoLANC_DATA: TDateField
      FieldName = 'LANC_DATA'
      Origin = 'LANCAMENTOS.LANC_DATA'
      Required = True
    end
    object qryLancamentoUSE_COD: TIntegerField
      FieldName = 'USE_COD'
      Origin = 'LANCAMENTOS.USE_COD'
      Required = True
    end
    object qryLancamentoNRO_NF: TIntegerField
      FieldName = 'NRO_NF'
      Origin = 'LANCAMENTOS.NRO_NF'
      Required = True
    end
    object qryLancamentoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'LANCAMENTOS.VALOR_TOTAL'
    end
  end
  object qryConsulta: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    BufferChunks = 1000
    CachedUpdates = False
    Left = 208
    Top = 8
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 272
    Top = 8
  end
  object qryGrupo: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    AfterPost = qryGrupoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from GRUPO')
    UpdateObject = ibuGrupo
    GeneratorField.Field = 'GRU_COD'
    GeneratorField.Generator = 'GEN_GRUPO_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 89
    Top = 64
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'GRU_COD'
      Origin = 'GRUPO.GRU_COD'
      Required = True
    end
    object IBStringField1: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'GRU_NOM'
      Origin = 'GRUPO.GRU_NOM'
      Size = 45
    end
    object IBStringField2: TIBStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'GRU_OBS'
      Origin = 'GRUPO.GRU_OBS'
      Size = 80
    end
  end
  object qryConsPro: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select PRO_COD, PRO_NOM from PRODUTO')
    Left = 424
    Top = 80
    object qryConsProPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
      Origin = 'PRODUTO.PRO_COD'
      Required = True
    end
    object qryConsProPRO_NOM: TIBStringField
      FieldName = 'PRO_NOM'
      Origin = 'PRODUTO.PRO_NOM'
      Size = 45
    end
  end
  object dsConsPro: TDataSource
    DataSet = qryConsPro
    Left = 424
    Top = 128
  end
  object ibuLancamento: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  LANC_COD,'
      '  NRO_NF,'
      '  LANC_TIP,'
      '  USE_COD,'
      '  LANC_SIT,'
      '  LANC_DATA_MOV,'
      '  LANC_DATA,'
      '  VALOR_TOTAL'
      'from LANCAMENTOS '
      'where'
      '  LANC_COD = :LANC_COD and'
      '  NRO_NF = :NRO_NF and'
      '  LANC_TIP = :LANC_TIP and'
      '  USE_COD = :USE_COD')
    ModifySQL.Strings = (
      'update LANCAMENTOS'
      'set'
      '  LANC_COD = :LANC_COD,'
      '  NRO_NF = :NRO_NF,'
      '  LANC_TIP = :LANC_TIP,'
      '  USE_COD = :USE_COD,'
      '  LANC_SIT = :LANC_SIT,'
      '  LANC_DATA_MOV = :LANC_DATA_MOV,'
      '  LANC_DATA = :LANC_DATA,'
      '  VALOR_TOTAL = :VALOR_TOTAL'
      'where'
      '  LANC_COD = :OLD_LANC_COD and'
      '  NRO_NF = :OLD_NRO_NF and'
      '  LANC_TIP = :OLD_LANC_TIP and'
      '  USE_COD = :OLD_USE_COD')
    InsertSQL.Strings = (
      'insert into LANCAMENTOS'
      
        '  (LANC_COD, NRO_NF, LANC_TIP, USE_COD, LANC_SIT, LANC_DATA_MOV,' +
        ' LANC_DATA, '
      '   VALOR_TOTAL)'
      'values'
      
        '  (:LANC_COD, :NRO_NF, :LANC_TIP, :USE_COD, :LANC_SIT, :LANC_DAT' +
        'A_MOV, '
      '   :LANC_DATA, :VALOR_TOTAL)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTOS'
      'where'
      '  LANC_COD = :OLD_LANC_COD and'
      '  NRO_NF = :OLD_NRO_NF and'
      '  LANC_TIP = :OLD_LANC_TIP and'
      '  USE_COD = :OLD_USE_COD')
    Left = 277
    Top = 128
  end
  object qryItens_Lanc: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    BeforePost = qryItens_LancBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsLancamento
    SQL.Strings = (
      'select * from ITENS_LANC')
    UpdateObject = ibuItens_Lanc
    GeneratorField.Field = 'ITENS_LANC_COD'
    GeneratorField.Generator = 'GEN_ITENS_LANC_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 352
    Top = 80
    object qryItens_LancITENS_LANC_COD: TIntegerField
      FieldName = 'ITENS_LANC_COD'
      Origin = 'ITENS_LANC.ITENS_LANC_COD'
      Required = True
    end
    object qryItens_LancLANC_COD: TIntegerField
      FieldName = 'LANC_COD'
      Origin = 'ITENS_LANC.LANC_COD'
      Required = True
    end
    object qryItens_LancNRO_NF: TIntegerField
      FieldName = 'NRO_NF'
      Origin = 'ITENS_LANC.NRO_NF'
      Required = True
    end
    object qryItens_LancLANC_TIP: TIntegerField
      FieldName = 'LANC_TIP'
      Origin = 'ITENS_LANC.LANC_TIP'
      Required = True
    end
    object qryItens_LancUSE_COD: TIntegerField
      FieldName = 'USE_COD'
      Origin = 'ITENS_LANC.USE_COD'
      Required = True
    end
    object qryItens_LancPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
      Origin = 'ITENS_LANC.PRO_COD'
      Required = True
    end
    object qryItens_LancNome_Pro: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome_Pro'
      LookupDataSet = qryConsPro
      LookupKeyFields = 'PRO_COD'
      LookupResultField = 'PRO_NOM'
      KeyFields = 'PRO_COD'
      Size = 70
      Lookup = True
    end
    object qryItens_LancITENS_QTDE: TFloatField
      FieldName = 'ITENS_QTDE'
      Origin = 'ITENS_LANC.ITENS_QTDE'
    end
    object qryItens_LancITENS_CUSTO: TFloatField
      FieldName = 'ITENS_CUSTO'
      Origin = 'ITENS_LANC.ITENS_CUSTO'
    end
    object qryItens_LancITENS_VENDA: TFloatField
      FieldName = 'ITENS_VENDA'
      Origin = 'ITENS_LANC.ITENS_VENDA'
    end
    object qryItens_LancITENS_DESC: TFloatField
      FieldName = 'ITENS_DESC'
      Origin = 'ITENS_LANC.ITENS_DESC'
    end
  end
  object ibuItens_Lanc: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ITENS_LANC_COD,'
      '  PRO_COD,'
      '  USE_COD,'
      '  LANC_COD,'
      '  NRO_NF,'
      '  LANC_TIP,'
      '  ITENS_QTDE,'
      '  ITENS_VENDA,'
      '  ITENS_CUSTO,'
      '  ITENS_DESC'
      'from ITENS_LANC '
      'where'
      '  ITENS_LANC_COD = :ITENS_LANC_COD and'
      '  PRO_COD = :PRO_COD and'
      '  USE_COD = :USE_COD and'
      '  LANC_COD = :LANC_COD and'
      '  NRO_NF = :NRO_NF and'
      '  LANC_TIP = :LANC_TIP')
    ModifySQL.Strings = (
      'update ITENS_LANC'
      'set'
      '  ITENS_LANC_COD = :ITENS_LANC_COD,'
      '  PRO_COD = :PRO_COD,'
      '  USE_COD = :USE_COD,'
      '  LANC_COD = :LANC_COD,'
      '  NRO_NF = :NRO_NF,'
      '  LANC_TIP = :LANC_TIP,'
      '  ITENS_QTDE = :ITENS_QTDE,'
      '  ITENS_VENDA = :ITENS_VENDA,'
      '  ITENS_CUSTO = :ITENS_CUSTO,'
      '  ITENS_DESC = :ITENS_DESC'
      'where'
      '  ITENS_LANC_COD = :OLD_ITENS_LANC_COD and'
      '  PRO_COD = :OLD_PRO_COD and'
      '  USE_COD = :OLD_USE_COD and'
      '  LANC_COD = :OLD_LANC_COD and'
      '  NRO_NF = :OLD_NRO_NF and'
      '  LANC_TIP = :OLD_LANC_TIP')
    InsertSQL.Strings = (
      'insert into ITENS_LANC'
      
        '  (ITENS_LANC_COD, PRO_COD, USE_COD, LANC_COD, NRO_NF, LANC_TIP,' +
        ' ITENS_QTDE, '
      '   ITENS_VENDA, ITENS_CUSTO, ITENS_DESC)'
      'values'
      
        '  (:ITENS_LANC_COD, :PRO_COD, :USE_COD, :LANC_COD, :NRO_NF, :LAN' +
        'C_TIP, '
      '   :ITENS_QTDE, :ITENS_VENDA, :ITENS_CUSTO, :ITENS_DESC)')
    DeleteSQL.Strings = (
      'delete from ITENS_LANC'
      'where'
      '  ITENS_LANC_COD = :OLD_ITENS_LANC_COD and'
      '  PRO_COD = :OLD_PRO_COD and'
      '  USE_COD = :OLD_USE_COD and'
      '  LANC_COD = :OLD_LANC_COD and'
      '  NRO_NF = :OLD_NRO_NF and'
      '  LANC_TIP = :OLD_LANC_TIP')
    Left = 352
    Top = 128
  end
  object dsItens_Lanc: TDataSource
    DataSet = qryItens_Lanc
    Left = 352
    Top = 174
  end
  object dsLog_Estoque: TDataSource
    DataSet = qryLog_Estoque
    Left = 528
    Top = 174
  end
  object ibuLog_Estoque: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  LOG_COD,'
      '  ITENS_LANC_COD,'
      '  USE_NOME,'
      '  LANC_COD,'
      '  NRO_NF,'
      '  LANC_TIP,'
      '  MOTIVO,'
      '  DATA,'
      '  QTDE,'
      '  PRO_COD'
      'from LOG_ESTOQUE '
      'where'
      '  LOG_COD = :LOG_COD')
    ModifySQL.Strings = (
      'update LOG_ESTOQUE'
      'set'
      '  LOG_COD = :LOG_COD,'
      '  ITENS_LANC_COD = :ITENS_LANC_COD,'
      '  USE_NOME = :USE_NOME,'
      '  LANC_COD = :LANC_COD,'
      '  NRO_NF = :NRO_NF,'
      '  LANC_TIP = :LANC_TIP,'
      '  MOTIVO = :MOTIVO,'
      '  DATA = :DATA,'
      '  QTDE = :QTDE,'
      '  PRO_COD = :PRO_COD'
      'where'
      '  LOG_COD = :OLD_LOG_COD')
    InsertSQL.Strings = (
      'insert into LOG_ESTOQUE'
      
        '  (LOG_COD, ITENS_LANC_COD, USE_NOME, LANC_COD, NRO_NF, LANC_TIP' +
        ', MOTIVO, '
      '   DATA, QTDE, PRO_COD)'
      'values'
      
        '  (:LOG_COD, :ITENS_LANC_COD, :USE_NOME, :LANC_COD, :NRO_NF, :LA' +
        'NC_TIP, '
      '   :MOTIVO, :DATA, :QTDE, :PRO_COD)')
    DeleteSQL.Strings = (
      'delete from LOG_ESTOQUE'
      'where'
      '  LOG_COD = :OLD_LOG_COD')
    Left = 528
    Top = 128
  end
  object qryLog_Estoque: TIBQuery
    Database = ibdEstoque
    Transaction = ibtEstoque
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from LOG_ESTOQUE')
    UpdateObject = ibuLog_Estoque
    Left = 528
    Top = 80
    object qryLog_EstoqueLOG_COD: TIntegerField
      FieldName = 'LOG_COD'
      Origin = 'LOG_ESTOQUE.LOG_COD'
      Required = True
    end
    object qryLog_EstoqueITENS_LANC_COD: TIntegerField
      FieldName = 'ITENS_LANC_COD'
      Origin = 'LOG_ESTOQUE.ITENS_LANC_COD'
    end
    object qryLog_EstoqueUSE_NOME: TIBStringField
      FieldName = 'USE_NOME'
      Origin = 'LOG_ESTOQUE.USE_NOME'
      Size = 8
    end
    object qryLog_EstoqueLANC_COD: TIntegerField
      FieldName = 'LANC_COD'
      Origin = 'LOG_ESTOQUE.LANC_COD'
    end
    object qryLog_EstoqueNRO_NF: TIntegerField
      FieldName = 'NRO_NF'
      Origin = 'LOG_ESTOQUE.NRO_NF'
    end
    object qryLog_EstoqueLANC_TIP: TIntegerField
      FieldName = 'LANC_TIP'
      Origin = 'LOG_ESTOQUE.LANC_TIP'
    end
    object qryLog_EstoqueMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Origin = 'LOG_ESTOQUE.MOTIVO'
      FixedChar = True
      Size = 5
    end
    object qryLog_EstoqueDATA: TDateField
      FieldName = 'DATA'
      Origin = 'LOG_ESTOQUE.DATA'
    end
    object qryLog_EstoqueQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'LOG_ESTOQUE.QTDE'
    end
    object qryLog_EstoquePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
      Origin = 'LOG_ESTOQUE.PRO_COD'
      Required = True
    end
  end
end
