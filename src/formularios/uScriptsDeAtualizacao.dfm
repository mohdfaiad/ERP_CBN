object frmScriptsDeAtualizacao: TfrmScriptsDeAtualizacao
  Left = 351
  Top = 216
  Caption = 'frmScriptsDeAtualizacao'
  ClientHeight = 295
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object versao: TMemo
    Left = 8
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE TESTES ('
      '    CODIGO CODIGO NOT NULL,'
      '    NOME_TESTE NOME_MEDIO,'
      '    VALOR_STRING_TESTE VALOR_EXTRA_GRANDE,'
      '    CHAVE_ESTRANGEIRA CODIGO)'
      '^'
      ''
      'alter table TESTES'
      'add constraint PK_TESTES'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_TESTES_ID'
      '^'
      ''
      'create trigger testes_bi for testes'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0))  then'
      '    new.codigo = gen_id(gen_testes_id,1);'
      'end'
      '^')
    TabOrder = 0
    WordWrap = False
  end
  object versao1: TMemo
    Left = 32
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CLASSIFICACAO_FISCAL ('
      '    CODIGO INTEGER NOT NULL,'
      '    NCM VARCHAR(10),'
      '    DESCRICAO VARCHAR(100),'
      '    UND_MEDIDA VARCHAR(2))'
      '^'
      'alter table CLASSIFICACAO_FISCAL'
      'add constraint PK_CLASSIFICACAO_FISCAL'
      'primary key (CODIGO)'
      '^'
      'alter table CLASSIFICACAO_FISCAL'
      'add constraint UNQ1_CLASSIFICACAO_FISCAL'
      'unique (NCM)'
      '^'
      'CREATE GENERATOR GEN_CLASSIFICACAO_FISCAL_ID'
      '^'
      'CREATE TRIGGER CLASSIFICACAO_FISCAL_BI FOR CLASSIFICACAO_FISCAL'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CLASSIFICACAO_FISCAL_ID,1);'
      'END'
      '^'
      'COMMIT'
      '^'
      'CREATE TABLE TIPO_PRODUTO ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(50))'
      '^'
      'alter table TIPO_PRODUTO'
      'add constraint PK_TIPO_PRODUTO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_TIPO_PRODUTO_ID'
      '^'
      'CREATE TRIGGER TIPO_PRODUTO_BI FOR TIPO_PRODUTO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)OR(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_TIPO_PRODUTO_ID,1);'
      'END'
      '^'
      'COMMIT'
      '^'
      'CREATE TABLE GRUPO ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(100))'
      '^'
      'alter table GRUPO'
      'add constraint PK_GRUPO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_GRUPO_ID'
      '^'
      'CREATE TRIGGER GRUPO_BI FOR GRUPO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)OR(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_GRUPO_ID,1);'
      'END'
      '^'
      'COMMIT'
      '^'
      'CREATE TABLE COLECAO ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(30))'
      '^'
      'alter table COLECAO'
      'add constraint PK_COLECAO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_COLECAO_ID'
      '^'
      'CREATE TRIGGER COLECAO_BI FOR COLECAO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)OR(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_COLECAO_ID,1);'
      'END'
      '^'
      'COMMIT'
      '^')
    TabOrder = 1
    WordWrap = False
  end
  object versao2: TMemo
    Left = 56
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE PRODUTOS ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(200),'
      '    COD_NCM INTEGER,'
      '    COD_TIPO INTEGER,'
      '    COD_GRUPO INTEGER,'
      '    COD_COLECAO INTEGER,'
      '    COD_GRADE,'
      '    LINHA_ANO VARCHAR(4),'
      '    ATIVO CHAR(1),'
      '    PRECO_CUSTO NUMERIC(15,2),'
      '    PRECO_VENDA NUMERIC(15,2),'
      '    PRECO_ATACADO NUMERIC(15,2),'
      '    PRECO_MEDIO NUMERIC(15,2),'
      '    ESTOQUE_FIS NUMERIC(15,2),'
      '    ESTOQUE_MIN NUMERIC(15,2),'
      '    PESO_LIQ NUMERIC(15,2),'
      '    PESO_BRU NUMERIC(15,2),'
      '    QTD_PECAS INTEGER,'
      '    REFERENCIA VARCHAR(18))'
      '^'
      'alter table PRODUTOS'
      'add constraint PK_PRODUTOS'
      'primary key (CODIGO)'
      ''
      '^'
      'alter table PRODUTOS'
      'add constraint FK_PRODUTOS_2'
      'foreign key (COD_TIPO)'
      'references TIPO_PRODUTO(CODIGO)'
      '^'
      'alter table PRODUTOS'
      'add constraint FK_PRODUTOS_3'
      'foreign key (COD_GRUPO)'
      'references GRUPO(CODIGO)'
      '^'
      'alter table PRODUTOS'
      'add constraint FK_PRODUTOS_4'
      'foreign key (COD_COLECAO)'
      'references COLECAO(CODIGO)'
      '^'
      'alter table PRODUTOS'
      'add constraint FK_PRODUTOS_5'
      'foreign key (COD_GRADE)'
      'references GRADES(CODIGO)'
      '^'
      'COMMIT'
      '^'
      'CREATE GENERATOR GEN_PRODUTOS_ID;'
      '^'
      'CREATE TRIGGER PRODUTOS_BI FOR PRODUTOS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_PRODUTOS_ID,1);'
      'END'
      '^'
      'commit'
      '^')
    TabOrder = 2
    WordWrap = False
  end
  object versao3: TMemo
    Left = 80
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CORES ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(100))'
      '^'
      'alter table CORES'
      'add constraint PK_CORES'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CORES_ID'
      '^'
      'CREATE TRIGGER CORES_BI FOR CORES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)OR(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CORES_ID,1);'
      'END'
      '^'
      'COMMIT'
      '^'
      'CREATE TABLE CODIGO_BARRAS ('
      '    CODIGO INTEGER NOT NULL,'
      '    TIPO INTEGER,'
      '    NUMERACAO VARCHAR(14),'
      '    CODPRODUTO INTEGER,'
      '    CODCOR INTEGER,'
      '    CODTAMANHO INTEGER,'
      '    CODGRADE INTEGER)'
      '^'
      'alter table CODIGO_BARRAS'
      'add constraint PK_CODIGO_BARRAS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CODIGO_BARRAS_ID'
      '^'
      'CREATE TRIGGER CODIGO_BARRAS_BI FOR CODIGO_BARRAS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)OR(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CODIGO_BARRAS_ID,1);'
      'END'
      '^'
      'alter table CODIGO_BARRAS'
      'add constraint FK_CODIGO_BARRAS_1'
      'foreign key (CODPRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'alter table CODIGO_BARRAS'
      'add constraint FK_CODIGO_BARRAS_2'
      'foreign key (CODCOR)'
      'references CORES(CODIGO)'
      '^'
      'alter table CODIGO_BARRAS'
      'add constraint FK_CODIGO_BARRAS_3'
      'foreign key (CODGRADE)'
      'references GRADES(CODIGO)'
      '^'
      'alter table CODIGO_BARRAS'
      'add constraint FK_CODIGO_BARRAS_4'
      'foreign key (CODTAMANHO)'
      'references TAMANHOS(CODIGO)'
      '^'
      'COMMIT'
      '^')
    TabOrder = 3
    WordWrap = False
  end
  object versao4: TMemo
    Left = 104
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE TABELAS_PRECO ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(50))'
      '^'
      'alter table TABELAS_PRECO'
      'add constraint PK_TABELAS_PRECO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_TABELAS_PRECO_ID'
      '^'
      'CREATE TRIGGER TABELAS_PRECO_BI FOR TABELAS_PRECO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_TABELAS_PRECO_ID,1);'
      'END'
      '^'
      'COMMIT'
      '^')
    TabOrder = 4
    WordWrap = False
  end
  object versao5: TMemo
    Left = 128
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE FORMAS_PGTO ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(100),'
      '    NUMERO_PARCELAS INTEGER,'
      '    DESCONTO NUMERIC(15,2),'
      '    ACRESCIMO NUMERIC(15,2))'
      '^'
      'alter table FORMAS_PGTO'
      'add constraint PK_FORMAS_PGTO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_FORMAS_PGTO_ID'
      '^'
      'CREATE TRIGGER FORMAS_PGTO_BI FOR FORMAS_PGTO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_FORMAS_PGTO_ID,1);'
      'END'
      '^'
      'commit'
      '^'
      'CREATE TABLE FORMAS_PGTO_PARCELAS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODFORMAS_PGTO INTEGER,'
      '    PARCELA INTEGER,'
      '    DIAS_PARCELA INTEGER)'
      '^'
      'alter table FORMAS_PGTO_PARCELAS'
      'add constraint PK_FORMAS_PGTO_PARCELAS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_FORMAS_PGTO_PARCELAS_ID'
      '^'
      'CREATE TRIGGER FORMAS_PGTO_PARCELAS_BI FOR FORMAS_PGTO_PARCELAS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_FORMAS_PGTO_PARCELAS_ID,1);'
      'END'
      '^'
      'alter table FORMAS_PGTO_PARCELAS'
      'add constraint FK_FORMAS_PGTO_PARCELAS_1'
      'foreign key (CODFORMAS_PGTO)'
      'references FORMAS_PGTO(CODIGO)'
      '^'
      'commit'
      '^')
    TabOrder = 5
    WordWrap = False
  end
  object versao6: TMemo
    Left = 152
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CLIENTES ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODCLI INTEGER,'
      '    CODTABELAPRECO INTEGER,'
      '    CODFORMASPGTO INTEGER)'
      '^'
      'alter table CLIENTES'
      'add constraint PK_CLIENTES'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CLIENTES_ID'
      '^'
      'CREATE TRIGGER CLIENTES_BI FOR CLIENTES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CLIENTES_ID,1);'
      'END'
      '^'
      'alter table CLIENTES'
      'add constraint FK_CLIENTES_1'
      'foreign key (CODCLI)'
      'references PESSOAS(CODIGO)'
      '^'
      'alter table CLIENTES'
      'add constraint FK_CLIENTES_2'
      'foreign key (CODTABELAPRECO)'
      'references TABELAS_PRECO(CODIGO)'
      '^'
      'alter table CLIENTES'
      'add constraint FK_CLIENTES_3'
      'foreign key (CODFORMASPGTO)'
      'references FORMAS_PGTO(CODIGO)'
      '^'
      'commit'
      '^')
    TabOrder = 6
    WordWrap = False
  end
  object versao7: TMemo
    Left = 176
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE TAMANHOS ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(15))'
      '^'
      'alter table TAMANHOS'
      'add constraint PK_TAMANHOS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_TAMANHOS_ID'
      '^'
      'CREATE TRIGGER TAMANHOS_BI FOR TAMANHOS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_TAMANHOS_ID,1);'
      'END'
      '^'
      'commit'
      '^'
      'CREATE TABLE GRADES ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(25))'
      '^'
      'alter table GRADES'
      'add constraint PK_GRADES'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_GRADES_ID'
      '^'
      'CREATE TRIGGER GRADES_BI FOR GRADES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_GRADES_ID,1);'
      'END'
      '^'
      'commit'
      '^'
      'CREATE TABLE GRADE_TAMANHOS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODGRADE INTEGER,'
      '    CODTAMANHO INTEGER)'
      '^'
      'alter table GRADE_TAMANHOS'
      'add constraint PK_GRADE_TAMANHOS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_GRADE_TAMANHOS_ID'
      '^'
      'CREATE TRIGGER GRADE_TAMANHOS_BI FOR GRADE_TAMANHOS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_GRADE_TAMANHOS_ID,1);'
      'END'
      '^'
      'alter table GRADE_TAMANHOS'
      'add constraint FK_GRADE_TAMANHOS_1'
      'foreign key (CODGRADE)'
      'references GRADES(CODIGO)'
      '^'
      'alter table GRADE_TAMANHOS'
      'add constraint FK_GRADE_TAMANHOS_2'
      'foreign key (CODTAMANHO)'
      'references TAMANHOS(CODIGO)'
      '^'
      'commit'
      '^')
    TabOrder = 7
    WordWrap = False
  end
  object versao8: TMemo
    Left = 200
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE PRODUTO_CORES ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODPRODUTO INTEGER,'
      '    CODCOR INTEGER)'
      '^'
      'alter table PRODUTO_CORES'
      'add constraint PK_PRODUTO_CORES'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_PRODUTO_CORES_ID'
      '^'
      'CREATE TRIGGER PRODUTO_CORES_BI FOR PRODUTO_CORES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_PRODUTO_CORES_ID,1);'
      'END'
      '^'
      'Commit'
      '^'
      'alter table PRODUTO_CORES'
      'add constraint FK_PRODUTO_CORES_2'
      'foreign key (CODCOR)'
      'references CORES(CODIGO)'
      '^'
      'alter table PRODUTO_CORES'
      'add constraint FK_PRODUTO_CORES_1'
      'foreign key (CODPRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'commit'
      '^')
    TabOrder = 8
    WordWrap = False
  end
  object versao9: TMemo
    Left = 224
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE PRODUTO_TABELA_PRECO ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODPRODUTO INTEGER,'
      '    CODTABELA INTEGER,'
      '    PRECO NUMERIC(15,2),'
      '    PRECO_LIQ NUMERIC(15,2),'
      '    PRECO_ATACADO NUMERIC(15,2))'
      '^'
      'alter table PRODUTO_TABELA_PRECO'
      'add constraint PK_PRODUTO_TABELA_PRECO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_PRODUTO_TABELA_PRECO_ID'
      '^'
      'CREATE TRIGGER PRODUTO_TABELA_PRECO_BI FOR PRODUTO_TABELA_PRECO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_PRODUTO_TABELA_PRECO_ID,1);'
      'END'
      '^'
      'commit'
      '^'
      'alter table PRODUTO_TABELA_PRECO'
      'add constraint FK_PRODUTO_TABELA_PRECO_1'
      'foreign key (CODPRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'alter table PRODUTO_TABELA_PRECO'
      'add constraint FK_PRODUTO_TABELA_PRECO_2'
      'foreign key (CODTABELA)'
      'references TABELAS_PRECO(CODIGO)'
      '^'
      'commit'
      '^')
    TabOrder = 9
    WordWrap = False
  end
  object versao10: TMemo
    Left = 246
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE EMPRESAS ('
      '    CODIGO CODIGO NOT NULL,'
      '    CODIGO_PESSOA CODIGO,'
      '    REGIME_TRIBUTARIO INTEGER NOT NULL)'
      '^'
      ''
      'alter table EMPRESAS'
      'add constraint PK_EMPRESAS'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_EMPRESAS_ID'
      '^'
      ''
      'create trigger empresas_bi for empresas'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = null)) then'
      '    new.codigo = gen_id(gen_empresas_id,1);'
      'end'
      '^'
      ''
      'alter table EMPRESAS'
      'add constraint FK_EMPRESAS_PESSOA'
      'foreign key (CODIGO_PESSOA)'
      'references PESSOAS(CODIGO)'
      'on delete CASCADE'
      'using index FK_EMPRESAS_PESSOA'
      '^')
    TabOrder = 10
    WordWrap = False
  end
  object versao11: TMemo
    Left = 269
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE NATUREZAS_OPERACAO ('
      '    CODIGO CODIGO NOT NULL,'
      '    DESCRICAO NOME_MEDIO,'
      '    CFOP VARCHAR(4) NOT NULL)'
      '^'
      ''
      'alter table NATUREZAS_OPERACAO'
      'add constraint PK_NATUREZAS_OPERACAO'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_NATUREZAS_OPERACAO_ID'
      '^'
      ''
      'create trigger naturezas_operacao_bi for naturezas_operacao'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0))  then'
      '    new.codigo = gen_id(gen_naturezas_operacao_id,1);'
      'end'
      '^')
    TabOrder = 11
    WordWrap = False
  end
  object versao12: TMemo
    Left = 291
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE DOMAIN CODIGO_FLOAT AS'
      'FLOAT'
      'NOT NULL;'
      '^')
    TabOrder = 12
    WordWrap = False
  end
  object versao13: TMemo
    Left = 314
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE NOTAS_FISCAIS ('
      '    CODIGO CODIGO NOT NULL,'
      '    NUMERO_NOTA_FISCAL INTEGER NOT NULL,'
      '    CODIGO_NATUREZA CODIGO,'
      '    SERIE VARCHAR(3) NOT NULL,'
      '    CODIGO_EMITENTE CODIGO,'
      '    CODIGO_DESTINATARIO CODIGO,'
      '    CODIGO_FPAGTO CODIGO,'
      '    DATA_EMISSAO TIMESTAMP NOT NULL,'
      '    DATA_SAIDA TIMESTAMP NOT NULL,'
      '    CODIGO_TRANSPORTADORA CODIGO,'
      '    TIPO_FRETE INTEGER NOT NULL)'
      '^'
      ''
      'alter table NOTAS_FISCAIS'
      'add constraint PK_NOTAS_FISCAIS'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_NOTAS_FISCAIS_ID'
      '^'
      ''
      'create trigger notas_fiscais_bi for notas_fiscais'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0))  then'
      '    new.codigo = gen_id(gen_notas_fiscais_id,1);'
      'end'
      '^'
      '')
    TabOrder = 13
    WordWrap = False
  end
  object versao14: TMemo
    Left = 338
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_FPAGTO'
      'foreign key (CODIGO_FPAGTO)'
      'references FORMAS_PGTO(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_FPAGTO'
      '^'
      ''
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_NAT'
      'foreign key (CODIGO_NATUREZA)'
      'references NATUREZAS_OPERACAO(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_NAT'
      '^'
      ''
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_TRANSP'
      'foreign key (CODIGO_TRANSPORTADORA)'
      'references PESSOAS(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_TRANSP'
      '^'
      ''
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_DEST'
      'foreign key (CODIGO_DESTINATARIO)'
      'references PESSOAS(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_DEST'
      '^'
      ''
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_EMIT'
      'foreign key (CODIGO_EMITENTE)'
      'references PESSOAS(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_EMIT'
      '^')
    TabOrder = 14
    WordWrap = False
  end
  object versao15: TMemo
    Left = 362
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE PEDIDOS_FATURADOS ('
      '    CODIGO CODIGO NOT NULL,'
      '    CODIGO_PEDIDO CODIGO,'
      '    CODIGO_NOTA_FISCAL CODIGO)'
      '^'
      ''
      'alter table PEDIDOS_FATURADOS'
      'add constraint PK_PEDIDOS_FATURADOS'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_PEDIDOS_FATURADOS_ID'
      '^'
      ''
      'create trigger pedidos_faturados_bi for pedidos_faturados'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0))  then'
      '    new.codigo = gen_id(gen_pedidos_faturados_id,1);'
      'end'
      '^')
    TabOrder = 15
    WordWrap = False
  end
  object versao16: TMemo
    Left = 386
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table PEDIDOS_FATURADOS'
      'add constraint FK_PEDIDOS_FATURADOS_NF'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_PEDIDOS_FATURADOS_NF'
      '^'
      ''
      'alter table PEDIDOS_FATURADOS'
      'add constraint FK_PEDIDOS_FATURADOS_PED'
      'foreign key (CODIGO_PEDIDO)'
      'references PEDIDOS(CODIGO)'
      'on delete CASCADE'
      'using index FK_PEDIDOS_FATURADOS_PED'
      '^'
      '')
    TabOrder = 16
    WordWrap = False
  end
  object versao17: TMemo
    Left = 410
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CONFIGURACOES_NF ('
      '    CODIGO INTEGER NOT NULL,'
      '    ALIQ_CRED_SN NUMERIC(15,2),'
      '    ALIQ_ICMS NUMERIC(15,2),'
      '    ALIQ_PIS NUMERIC(15,2),'
      '    ALIQ_COFINS NUMERIC(15,2),'
      '    NUM_CERTIFICADO VARCHAR(50),'
      '    AMBIENTE_NFE CHAR(1))'
      '^'
      'alter table CONFIGURACOES_NF'
      'add constraint PK_CONFIGURACOES_NF'
      'primary key (CODIGO)'
      '^')
    TabOrder = 17
    WordWrap = False
  end
  object versao18: TMemo
    Left = 433
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CONFIGURACOES_NF'
      '    ADD SEQUENCIA_NF INTEGER'
      '^')
    TabOrder = 18
    WordWrap = False
  end
  object versao19: TMemo
    Left = 463
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NOTAS_FISCAIS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_NOTA_FISCAL CODIGO,'
      '    CODIGO_PRODUTO CODIGO,'
      '    CODIGO_NATUREZA CODIGO,'
      '    QUANTIDADE NUMERIC(15,4) NOT NULL,'
      '    VALOR_UNITARIO NUMERIC(15,4) NOT NULL)'
      '^'
      ''
      'alter table ITENS_NOTAS_FISCAIS'
      'add constraint PK_ITENS_NOTAS_FISCAIS'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_ITENS_NOTAS_FISCAIS_ID'
      '^'
      ''
      'create trigger itens_notas_fiscais_bi for itens_notas_fiscais'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0))  then'
      '    new.codigo = gen_id(gen_itens_notas_fiscais_id,1);'
      'end'
      '^'
      '')
    TabOrder = 19
    WordWrap = False
  end
  object versao20: TMemo
    Left = 490
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NOTAS_FISCAIS'
      'add constraint FK_ITENS_NOTAS_FISCAIS_NAT'
      'foreign key (CODIGO_NATUREZA)'
      'references NATUREZAS_OPERACAO(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NOTAS_FISCAIS_NAT'
      '^'
      ''
      'alter table ITENS_NOTAS_FISCAIS'
      'add constraint FK_ITENS_NOTAS_FISCAIS_PROD'
      'foreign key (CODIGO_PRODUTO)'
      'references PRODUTOS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NOTAS_FISCAIS_PROD'
      '^'
      ''
      'alter table ITENS_NOTAS_FISCAIS'
      'add constraint FK_ITENS_NOTAS_FISCAIS_NF'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NOTAS_FISCAIS_NF'
      '^')
    TabOrder = 20
    WordWrap = False
  end
  object versao21: TMemo
    Left = 519
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_ICMS_00 ('
      '    CODIGO_ITEM CODIGO NOT NULL,'
      '    ORIGEM INTEGER NOT NULL,'
      '    ALIQUOTA NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_ICMS_00'
      'add constraint PK_ITENS_NF_ICMS_00'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 21
    WordWrap = False
  end
  object versao22: TMemo
    Left = 547
    Top = 8
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_ICMS_00'
      'add constraint FK_ITENS_NF_ICMS_00_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_ICMS_00_IT'
      '^'
      '')
    TabOrder = 22
    WordWrap = False
  end
  object versao23: TMemo
    Left = 9
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_ICMS_SN_101 ('
      '    CODIGO_ITEM CODIGO NOT NULL,'
      '    ORIGEM INTEGER NOT NULL,'
      '    ALIQUOTA_CREDITO_SN NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_ICMS_SN_101'
      'add constraint PK_ITENS_NF_ICMS_SN_101'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 23
    WordWrap = False
  end
  object versao24: TMemo
    Left = 35
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_ICMS_SN_101'
      'add constraint FK_ITENS_NF_ICMS_SN_101_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_ICMS_SN_101_IT'
      '^')
    TabOrder = 24
    WordWrap = False
  end
  object versao25: TMemo
    Left = 62
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_IPI_NT ('
      '    CODIGO_ITEM CODIGO NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_IPI_NT'
      'add constraint PK_ITENS_NF_IPI_NT'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 25
    WordWrap = False
  end
  object versao26: TMemo
    Left = 86
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_IPI_NT'
      'add constraint FK_ITENS_NF_IPI_NT_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_IPI_NT_IT'
      '^')
    TabOrder = 26
    WordWrap = False
  end
  object versao27: TMemo
    Left = 110
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_IPI_TRIB ('
      '    CODIGO_ITEM CODIGO NOT NULL,'
      '    ALIQUOTA NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_IPI_TRIB'
      'add constraint PK_ITENS_NF_IPI_TRIB'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 27
    WordWrap = False
  end
  object versao28: TMemo
    Left = 134
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_IPI_TRIB'
      'add constraint FK_ITENS_NF_IPI_TRIB_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_IPI_TRIB_IT'
      '^')
    TabOrder = 28
    WordWrap = False
  end
  object versao29: TMemo
    Left = 161
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_PIS_ALIQ ('
      '    CODIGO_ITEM CODIGO NOT NULL,'
      '    ALIQUOTA NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_PIS_ALIQ'
      'add constraint PK_ITENS_NF_PIS_ALIQ'
      'primary key (CODIGO_ITEM)'
      '^')
    TabOrder = 29
    WordWrap = False
  end
  object versao30: TMemo
    Left = 185
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_PIS_ALIQ'
      'add constraint FK_ITENS_NF_PIS_ALIQ_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_PIS_ALIQ_IT'
      '^')
    TabOrder = 30
    WordWrap = False
  end
  object versao31: TMemo
    Left = 209
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_PIS_NT ('
      '    CODIGO_ITEM CODIGO NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_PIS_NT'
      'add constraint PK_ITENS_NF_PIS_NT'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 31
    WordWrap = False
  end
  object versao32: TMemo
    Left = 233
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_PIS_NT'
      'add constraint FK_ITENS_NF_PIS_NT_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_PIS_NT_IT'
      '^'
      '')
    TabOrder = 32
    WordWrap = False
  end
  object versao33: TMemo
    Left = 257
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_COFINS_ALIQ ('
      '    CODIGO_ITEM CODIGO NOT NULL,'
      '    ALIQUOTA NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_COFINS_ALIQ'
      'add constraint PK_ITENS_NF_COFINS_ALIQ'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 33
    WordWrap = False
  end
  object versao34: TMemo
    Left = 281
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_COFINS_ALIQ'
      'add constraint FK_ITENS_NF_COFINS_ALIQ_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_COFINS_ALIQ_IT'
      '^')
    TabOrder = 34
    WordWrap = False
  end
  object versao35: TMemo
    Left = 304
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_NF_COFINS_NT ('
      '    CODIGO_ITEM CODIGO NOT NULL)'
      '^'
      ''
      'alter table ITENS_NF_COFINS_NT'
      'add constraint PK_ITENS_NF_COFINS_NT'
      'primary key (CODIGO_ITEM)'
      '^'
      '')
    TabOrder = 35
    WordWrap = False
  end
  object versao36: TMemo
    Left = 333
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_NF_COFINS_NT'
      'add constraint FK_ITENS_NF_COFINS_NT_IT'
      'foreign key (CODIGO_ITEM)'
      'references ITENS_NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_NF_COFINS_NT_IT'
      '^'
      '')
    TabOrder = 36
    WordWrap = False
  end
  object versao37: TMemo
    Left = 357
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE LOCAIS_ENTREGA_NOTAS_FISCAIS ('
      '    CODIGO_NOTA_FISCAL CODIGO NOT NULL,'
      '    CNPJ_CPF VARCHAR(14) NOT NULL,'
      '    LOGRADOURO VARCHAR(80) CHARACTER SET NONE NOT NULL,'
      '    NUMERO VARCHAR(10) NOT NULL,'
      '    BAIRRO NOME_MEDIO,'
      '    COMPLEMENTO VARCHAR(100) CHARACTER SET NONE NOT NULL,'
      '    COD_MUN INTEGER NOT NULL,'
      '    NOME_MUN VARCHAR(80) NOT NULL,'
      '    UF VARCHAR(2) NOT NULL,'
      '    CEP VARCHAR(10) NOT NULL)'
      '^'
      ''
      'alter table LOCAIS_ENTREGA_NOTAS_FISCAIS'
      'add constraint PK_LOCAIS_ENTREGA_NOTAS_FISCAIS'
      'primary key (CODIGO_NOTA_FISCAL)'
      '^')
    TabOrder = 37
    WordWrap = False
  end
  object versao38: TMemo
    Left = 381
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table LOCAIS_ENTREGA_NOTAS_FISCAIS'
      'add constraint FK_LOCAIS_ENTREGA_NOTAS_FISCAIS'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_LOCAIS_ENTREGA_NOTAS_FISCAIS'
      '^'
      '')
    TabOrder = 38
    WordWrap = False
  end
  object versao39: TMemo
    Left = 405
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE VOLUMES_NOTAS_FISCAIS ('
      '    CODIGO_NOTA_FISCAL CODIGO NOT NULL,'
      '    ESPECIE NOME_MEDIO,'
      '    QUANTIDADE_VOLUMES NUMERIC(15,2) NOT NULL,'
      '    PESO_LIQUIDO NUMERIC(15,2) NOT NULL,'
      '    PESO_BRUTO NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table VOLUMES_NOTAS_FISCAIS'
      'add constraint PK_VOLUMES_NOTAS_FISCAIS'
      'primary key (CODIGO_NOTA_FISCAL)'
      '^')
    TabOrder = 39
    WordWrap = False
  end
  object versao40: TMemo
    Left = 429
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table VOLUMES_NOTAS_FISCAIS'
      'add constraint FK_VOLUMES_NOTAS_FISCAIS'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_VOLUMES_NOTAS_FISCAIS'
      '^'
      '')
    TabOrder = 40
    WordWrap = False
  end
  object versao41: TMemo
    Left = 453
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE OBSERVACOES_NOTAS_FISCAIS ('
      '    CODIGO_NOTA_FISCAL CODIGO NOT NULL,'
      '    OBSERVACOES VALOR_EXTRA_GRANDE,'
      '    OBS_GER_PELO_SISTEMA VALOR_EXTRA_GRANDE)'
      '^'
      ''
      'alter table OBSERVACOES_NOTAS_FISCAIS'
      'add constraint PK_OBSERVACOES_NOTAS_FISCAIS'
      'primary key (CODIGO_NOTA_FISCAL)'
      '^'
      '')
    TabOrder = 41
    WordWrap = False
  end
  object versao42: TMemo
    Left = 477
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table OBSERVACOES_NOTAS_FISCAIS'
      'add constraint FK_OBSERVACOES_NOTAS_FISCAIS'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_OBSERVACOES_NOTAS_FISCAIS'
      '^'
      '')
    TabOrder = 42
    WordWrap = False
  end
  object versao43: TMemo
    Left = 504
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE TOTAIS_NOTAS_FISCAIS ('
      '    CODIGO_NOTA_FISCAL CODIGO NOT NULL,'
      '    FRETE NUMERIC(15,2) NOT NULL,'
      '    SEGURO NUMERIC(15,2) NOT NULL,'
      '    DESCONTO NUMERIC(15,2) NOT NULL,'
      '    OUTRAS_DESPESAS NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table TOTAIS_NOTAS_FISCAIS'
      'add constraint PK_TOTAIS_NOTAS_FISCAIS'
      'primary key (CODIGO_NOTA_FISCAL)'
      '^')
    TabOrder = 43
    WordWrap = False
  end
  object versao44: TMemo
    Left = 528
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table TOTAIS_NOTAS_FISCAIS'
      'add constraint FK_TOTAIS_NOTAS_FISCAIS'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_TOTAIS_NOTAS_FISCAIS'
      '^'
      '')
    TabOrder = 44
    WordWrap = False
  end
  object versao45: TMemo
    Left = 552
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD DESCONTO_FPGTO NUMERIC(15,2)'
      '^')
    TabOrder = 45
    WordWrap = False
  end
  object versao46: TMemo
    Left = 577
    Top = 39
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE LOTES_NFE ('
      '    CODIGO CODIGO NOT NULL,'
      '    CODIGO_NOTA_FISCAL CODIGO,'
      '    DATA TIMESTAMP NOT NULL)'
      '^'
      ''
      'alter table LOTES_NFE'
      'add constraint PK_LOTES_NFE'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_LOTES_NFE_ID'
      '^'
      ''
      'create trigger lotes_nfe_bi for lotes_nfe'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0)) then'
      '    new.codigo = gen_id(gen_lotes_nfe_id,1);'
      'end'
      '^'
      '')
    TabOrder = 46
    WordWrap = False
  end
  object versao47: TMemo
    Left = 9
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table LOTES_NFE'
      'add constraint FK_LOTES_NFE_NOTA_FISCAL'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_LOTES_NFE_NOTA_FISCAL'
      '^')
    TabOrder = 47
    WordWrap = False
  end
  object versao48: TMemo
    Left = 33
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE LOTES_NFE_RETORNO ('
      '    CODIGO_LOTE CODIGO NOT NULL,'
      '    STATUS VARCHAR(3) NOT NULL,'
      '    MOTIVO VALOR_EXTRA_GRANDE,'
      '    RECIBO VARCHAR(15) NOT NULL)'
      '^'
      ''
      'alter table LOTES_NFE_RETORNO'
      'add constraint PK_LOTES_NFE_RETORNO'
      'primary key (CODIGO_LOTE)'
      '^'
      '')
    TabOrder = 48
    WordWrap = False
  end
  object versao49: TMemo
    Left = 61
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table LOTES_NFE_RETORNO'
      'add constraint FK_LOTES_NFE_RETORNO'
      'foreign key (CODIGO_LOTE)'
      'references LOTES_NFE(CODIGO)'
      'on delete CASCADE'
      'using index FK_LOTES_NFE_RETORNO'
      '^')
    TabOrder = 49
    WordWrap = False
  end
  object versao50: TMemo
    Left = 88
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE NOTAS_FISCAIS_NFE ('
      '    CODIGO_NOTA_FISCAL CODIGO NOT NULL,'
      '    CHAVE_ACESSO VARCHAR(44) NOT NULL,'
      '    XML BLOB SUB_TYPE 1 SEGMENT SIZE 80 NOT NULL)'
      '^'
      ''
      'alter table NOTAS_FISCAIS_NFE'
      'add constraint PK_NOTAS_FISCAIS_NFE'
      'primary key (CODIGO_NOTA_FISCAL)'
      '^'
      '')
    TabOrder = 50
    WordWrap = False
  end
  object versao51: TMemo
    Left = 116
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table NOTAS_FISCAIS_NFE'
      'add constraint FK_NOTAS_FISCAIS_NFE'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_NFE'
      '^'
      '')
    TabOrder = 51
    WordWrap = False
  end
  object versao52: TMemo
    Left = 144
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE NOTAS_FISCAIS_NFE_RETORNO ('
      '    CODIGO_NOTA_FISCAL CODIGO NOT NULL,'
      '    STATUS VARCHAR(3) NOT NULL,'
      '    MOTIVO VALOR_EXTRA_GRANDE)'
      '^'
      ''
      'alter table NOTAS_FISCAIS_NFE_RETORNO'
      'add constraint PK_NOTAS_FISCAIS_NFE_RETORNO'
      'primary key (CODIGO_NOTA_FISCAL)'
      '^'
      '')
    TabOrder = 52
    WordWrap = False
  end
  object versao53: TMemo
    Left = 173
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table NOTAS_FISCAIS_NFE_RETORNO'
      'add constraint FK_NOTAS_FISCAIS_NFE_RETORNO'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_NOTAS_FISCAIS_NFE_RETORNO'
      '^')
    TabOrder = 53
    WordWrap = False
  end
  object versao54: TMemo
    Left = 204
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CONFIGURACOES_NF_EMAIL ('
      '    CODIGO_CONFIGURACOES_NF CODIGO NOT NULL,'
      '    SMTP_HOST VARCHAR(50) NOT NULL,'
      '    SMTP_PORT VARCHAR(10) NOT NULL,'
      '    SMTP_USER VARCHAR(50) NOT NULL,'
      '    SMTP_PASSWORD VARCHAR(50) NOT NULL,'
      '    ASSUNTO VARCHAR(50)  NOT NULL,'
      '    MENSAGEM VALOR_EXTRA_GRANDE,'
      '    USA_SSL VARCHAR(1) NOT NULL)'
      '^'
      ''
      'alter table CONFIGURACOES_NF_EMAIL'
      'add constraint PK_CONFIGURACOES_NF_EMAIL'
      'primary key (CODIGO_CONFIGURACOES_NF)'
      '^'
      '')
    TabOrder = 54
    WordWrap = False
  end
  object versao55: TMemo
    Left = 234
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table CONFIGURACOES_NF_EMAIL'
      'add constraint FK_CONFIGURACOES_NF_EMAIL'
      'foreign key (CODIGO_CONFIGURACOES_NF)'
      'references CONFIGURACOES_NF(CODIGO)'
      'on delete CASCADE'
      'using index FK_CONFIGURACOES_NF_EMAIL'
      '^')
    TabOrder = 55
    WordWrap = False
  end
  object versao56: TMemo
    Left = 258
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CONFIGURACOES_NF'
      '    ADD SENHA_CERTIFICADO VARCHAR(50)'
      '^')
    TabOrder = 56
    WordWrap = False
  end
  object versao57: TMemo
    Left = 282
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'DROP TABLE CONFIGURACOES_NF_EMAIL'
      '^'
      ''
      'DROP TABLE CONFIGURACOES_NF'
      '^')
    TabOrder = 57
    WordWrap = False
  end
  object versao58: TMemo
    Left = 305
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      ''
      'CREATE TABLE CONFIGURACOES_NF ('
      '    CODIGO_EMPRESA CODIGO NOT NULL,'
      '    ALIQ_CRED_SN NUMERIC(15,2),'
      '    ALIQ_ICMS NUMERIC(15,2),'
      '    ALIQ_PIS NUMERIC(15,2),'
      '    ALIQ_COFINS NUMERIC(15,2),'
      '    NUM_CERTIFICADO VARCHAR(50),'
      '    AMBIENTE_NFE VARCHAR(1) NOT NULL,'
      '    SENHA_CERTIFICADO VARCHAR(50),'
      '    sequencia_nf integer)'
      '^'
      ''
      'alter table CONFIGURACOES_NF'
      'add constraint PK_CONFIGURACOES_NF'
      'primary key (CODIGO_EMPRESA)'
      '^')
    TabOrder = 58
    WordWrap = False
  end
  object versao59: TMemo
    Left = 329
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table CONFIGURACOES_NF'
      'add constraint FK_CONFIGURACOES_NF_EMPRESA'
      'foreign key (CODIGO_EMPRESA)'
      'references EMPRESAS(CODIGO)'
      'on delete CASCADE'
      'using index FK_CONFIGURACOES_NF_EMPRESA'
      '^')
    TabOrder = 59
    WordWrap = False
  end
  object versao60: TMemo
    Left = 354
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CONFIGURACOES_NF_EMAIL ('
      '    CODIGO_EMPRESA CODIGO NOT NULL,'
      '    SMTP_HOST VARCHAR(50) NOT NULL,'
      '    SMTP_PORT VARCHAR(10) NOT NULL,'
      '    SMTP_USER VARCHAR(50) NOT NULL,'
      '    SMTP_PASSWORD VARCHAR(50) NOT NULL,'
      '    ASSUNTO VARCHAR(50) NOT NULL,'
      '    MENSAGEM VALOR_EXTRA_GRANDE,'
      '    USA_SSL CHAR(1) NOT NULL)'
      '^'
      ''
      'alter table CONFIGURACOES_NF_EMAIL'
      'add constraint PK_CONFIGURACOES_NF_EMAIL'
      'primary key (CODIGO_EMPRESA)'
      '^'
      '')
    TabOrder = 60
    WordWrap = False
  end
  object versao61: TMemo
    Left = 383
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table CONFIGURACOES_NF_EMAIL'
      'add constraint FK_CONFIGURACOES_NF_EMAIL_EMP'
      'foreign key (CODIGO_EMPRESA)'
      'references EMPRESAS(CODIGO)'
      'on delete CASCADE'
      'using index FK_CONFIGURACOES_NF_EMAIL_EMP'
      '^'
      ''
      '')
    TabOrder = 61
    WordWrap = False
  end
  object versao62: TMemo
    Left = 413
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE TOTAIS_NOTAS_FISCAIS'
      '    ADD PERCENTUAL_DESCONTO_FATURA NUMERIC(15,2)'
      '^'
      '')
    TabOrder = 62
    WordWrap = False
  end
  object versao63: TMemo
    Left = 440
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'update RDB$FIELDS set'
      'RDB$FIELD_LENGTH = 500,'
      'RDB$CHARACTER_LENGTH = 500'
      'where RDB$FIELD_NAME = '#39'RDB$172'#39
      '^')
    TabOrder = 63
    WordWrap = False
  end
  object versao64: TMemo
    Left = 467
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_AVULSOS ('
      '    CODIGO CODIGO NOT NULL,'
      '    CODIGO_NOTA_FISCAL CODIGO,'
      '    CODIGO_PRODUTO CODIGO,'
      '    CODIGO_COR CODIGO,'
      '    PRECO NUMERIC(15,2) NOT NULL,'
      '    PERCENTUAL_DESCONTO NUMERIC(15,2) NOT NULL)'
      '^'
      ''
      'alter table ITENS_AVULSOS'
      'add constraint PK_ITENS_AVULSOS'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_ITENS_AVULSOS_ID'
      '^'
      ''
      'create trigger itens_avulsos_bi for itens_avulsos'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0))  then'
      '    new.codigo = gen_id(gen_itens_avulsos_id,1);'
      'end'
      '^'
      '')
    TabOrder = 64
    WordWrap = False
  end
  object versao65: TMemo
    Left = 494
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_AVULSOS'
      'add constraint FK_ITENS_AVULSOS_COR'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      'using index FK_ITENS_AVULSOS_COR'
      '^'
      ''
      'alter table ITENS_AVULSOS'
      'add constraint FK_ITENS_AVULSOS_NF'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      'on delete CASCADE'
      'using index FK_ITENS_AVULSOS_NF'
      '^'
      ''
      'alter table ITENS_AVULSOS'
      'add constraint FK_ITENS_AVULSOS_PRODUTO'
      'foreign key (CODIGO_PRODUTO)'
      'references PRODUTOS(CODIGO)'
      'using index FK_ITENS_AVULSOS_PRODUTO'
      '^')
    TabOrder = 65
    WordWrap = False
  end
  object versao66: TMemo
    Left = 522
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ITENS_AVULSOS_QUANTIDADES ('
      '    CODIGO CODIGO NOT NULL,'
      '    CODIGO_ITEM_AVULSO CODIGO,'
      '    CODIGO_TAMANHO CODIGO,'
      '    QUANTIDADE INTEGER NOT NULL)'
      '^'
      ''
      'alter table ITENS_AVULSOS_QUANTIDADES'
      'add constraint PK_ITENS_AVULSOS_QUANTIDADES'
      'primary key (CODIGO)'
      '^'
      ''
      'CREATE GENERATOR GEN_IT_AVULSOS_QTDS_ID'
      '^'
      ''
      
        'create trigger itens_avulsos_quantidades_bi for itens_avulsos_qu' +
        'antidades'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null)  or (new.codigo = 0)) then'
      '    new.codigo = gen_id(GEN_IT_AVULSOS_QTDS_ID,1);'
      'end'
      '^'
      '')
    TabOrder = 66
    WordWrap = False
  end
  object versao67: TMemo
    Left = 547
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table ITENS_AVULSOS_QUANTIDADES'
      'add constraint FK_IT_AVULSOS_QTDS_IT_AVUL'
      'foreign key (CODIGO_ITEM_AVULSO)'
      'references ITENS_AVULSOS(CODIGO)'
      'on delete CASCADE'
      'using index FK_IT_AVULSOS_QTDS_IT_AVUL'
      '^'
      ''
      'alter table ITENS_AVULSOS_QUANTIDADES'
      'add constraint FK_IT_AVULSOS_QTDS_TAM'
      'foreign key (CODIGO_TAMANHO)'
      'references TAMANHOS(CODIGO)'
      'using index FK_IT_AVULSOS_QTDS_TAM'
      '^'
      '')
    TabOrder = 67
    WordWrap = False
  end
  object versao68: TMemo
    Left = 571
    Top = 69
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CORES'
      'ADD DESC_PRODUCAO VARCHAR(60)'
      '^'
      'ALTER TABLE CORES'
      'ADD COR VARCHAR(40)'
      '^')
    TabOrder = 68
    WordWrap = False
  end
  object versao69: TMemo
    Left = 9
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE MATERIAS ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(200),'
      '    COD_NCM VARCHAR(15),'
      '    PRECO_CUSTO NUMERIC(15,2),'
      '    PRECO_VENDA NUMERIC(15,2),'
      '    ESTOQUE_FISICO NUMERIC(15,2),'
      '    ESTOQUE_MINIMO NUMERIC(15,2),'
      '    UNIDADE CHAR(3))'
      '^'
      'alter table MATERIAS'
      'add constraint PK_MATERIAS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_MATERIAS_ID'
      '^'
      'CREATE TRIGGER MATERIAS_BI FOR MATERIAS'
      ''
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_MATERIAS_ID,1);'
      'END'
      '^'
      'CREATE TABLE ITENS_NF_MATERIA ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_NOTA_FISCAL INTEGER,'
      '    CODIGO_MATERIA INTEGER,'
      '    QUANTIDADE NUMERIC(15,2),'
      '    UNIDADE CHAR(3),'
      '    CLASSIFICACAO_FISCAL VARCHAR(15),'
      '    ORIGEM INTEGER,'
      '    VALOR_UNITARIO NUMERIC(15,2),'
      '    VALOR_BRUTO NUMERIC(15,2),'
      '    VALOR_FRETE NUMERIC(15,2),'
      '    VALOR_SEGURO NUMERIC(15,2),'
      '    VALOR_DESCONTO NUMERIC(15,2),'
      '    VALOR_OUTRAS_DESPESAS NUMERIC(15,2),'#9#9
      '    PER_ICM NUMERIC(15,2),'
      '    PER_IPI NUMERIC(15,2),'
      '    PER_SUB NUMERIC(15,2),'
      '    PER_PIS NUMERIC(15,2),'
      '    PER_COFINS NUMERIC(15,2),'
      '    BASE_ICM NUMERIC(15,2),'
      '    BASE_IPI NUMERIC(15,2),'
      '    BASE_SUB NUMERIC(15,2),'
      '    BASE_PIS NUMERIC(15,2),'
      '    BASE_COFINS NUMERIC(15,2))'
      '^'
      'alter table ITENS_NF_MATERIA'
      'add constraint PK_ITENS_NF_MATERIA'
      'primary key (CODIGO)'
      '^'
      'alter table ITENS_NF_MATERIA'
      'add constraint FK_ITENS_NF_MATERIA_1'
      'foreign key (CODIGO_NOTA_FISCAL)'
      'references NOTAS_FISCAIS(CODIGO)'
      '^'
      'alter table ITENS_NF_MATERIA'
      'add constraint FK_ITENS_NF_MATERIA_2'
      'foreign key (CODIGO_MATERIA)'
      'references MATERIAS(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_ITENS_NF_MATERIA_ID'
      '^'
      'CREATE TRIGGER ITENS_NF_MATERIA_BI FOR ITENS_NF_MATERIA'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ITENS_NF_MATERIA_ID,1);'
      'END'
      '^'
      'CREATE TABLE MATERIA_FORNECEDOR ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_MATERIA INTEGER,'
      '    CODIGO_FORNECEDOR INTEGER,'
      '    CODIGO_MATERIA_FORNECEDOR VARCHAR(15))'
      '^'
      'alter table MATERIA_FORNECEDOR'
      'add constraint PK_MATERIA_FORNECEDOR'
      'primary key (CODIGO)'
      '^'
      'alter table MATERIA_FORNECEDOR'
      'add constraint FK_MATERIA_FORNECEDOR_1'
      'foreign key (CODIGO_MATERIA)'
      'references MATERIAS(CODIGO)'
      '^'
      'alter table MATERIA_FORNECEDOR'
      'add constraint FK_MATERIA_FORNECEDOR_2'
      'foreign key (CODIGO_FORNECEDOR)'
      'references PESSOAS(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_MATERIA_FORNECEDOR_ID'
      '^'
      'CREATE TRIGGER MATERIA_FORNECEDOR_BI FOR MATERIA_FORNECEDOR'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_MATERIA_FORNECEDOR_ID,1);'
      'END'
      '^'
      'CREATE TABLE CFOP_CORRESPONDENTE ('
      '    CODIGO INTEGER NOT NULL,'
      '    COD_CFOP_SAIDA INTEGER,'
      '    COD_CFOP_ENTRADA INTEGER)'
      '^'
      'alter table CFOP_CORRESPONDENTE'
      'add constraint PK_CFOP_CORRESPONDENTE'
      'primary key (CODIGO)'
      '^'
      'alter table CFOP_CORRESPONDENTE'
      'add constraint FK_CFOP_CORRESPONDENTE_1'
      'foreign key (COD_CFOP_SAIDA)'
      'references NATUREZAS_OPERACAO(CODIGO)'
      '^'
      'alter table CFOP_CORRESPONDENTE'
      'add constraint FK_CFOP_CORRESPONDENTE_2'
      'foreign key (COD_CFOP_ENTRADA)'
      'references NATUREZAS_OPERACAO(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CFOP_CORRESPONDENTE_ID'
      '^'
      'CREATE TRIGGER CFOP_CORRESPONDENTE_BI FOR CFOP_CORRESPONDENTE'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CFOP_CORRESPONDENTE_ID,1);'
      'END'
      '^'
      'ALTER TABLE NOTAS_FISCAIS'
      'ADD ENTRADA_SAIDA CHAR(1)'
      '^')
    TabOrder = 69
    WordWrap = False
  end
  object versao70: TMemo
    Left = 33
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS ALTER DT_CADASTRO TO DT_REPRESENTANTE'
      '^'
      'ALTER TABLE PEDIDOS ALTER DT_EMISSAO TO DT_CADASTRO'
      '^')
    TabOrder = 70
    WordWrap = False
  end
  object versao71: TMemo
    Left = 57
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'update RDB$FIELDS set'
      'RDB$FIELD_LENGTH = 20,'
      'RDB$CHARACTER_LENGTH = 20'
      'where RDB$FIELD_NAME = '#39'RDB$317'#39
      '^')
    TabOrder = 71
    WordWrap = False
  end
  object versao72: TMemo
    Left = 81
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE LANCAMENTOS ('
      '    CODIGO NUMERIC(15,0) NOT NULL,'
      '    VALOR_TOTAL NUMERIC(15,2),'
      '    VALOR_PAGO NUMERIC(15,2),'
      '    DATA_VENCIMENTO DATE,'
      '    DATA_CADASTRO DATE,'
      '    DESCRICAO VARCHAR(500),'
      '    TIPO CHAR(1))'
      '^'
      'alter table LANCAMENTOS'
      'add constraint PK_LANCAMENTOS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_LANCAMENTOS_ID'
      '^'
      'create trigger lancamentos_bi for lancamentos'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null)OR(NEW.CODIGO = 0)) then'
      '    new.codigo = gen_id(gen_lancamentos_id,1);'
      'end'
      '^'
      'CREATE TABLE COMISSAO_REPRESENTANTE ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_REPRESENTANTE INTEGER,'
      '    ANO INTEGER,'
      '    MES INTEGER)'
      '^'
      'alter table COMISSAO_REPRESENTANTE'
      'add constraint PK_COMISSAO_REPRESENTANTE'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_COMISSAO_REPRESENTANTE_ID'
      '^'
      
        'create trigger comissao_representante_bi for comissao_representa' +
        'nte'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null)OR(NEW.CODIGO = 0)) then'
      '    new.codigo = gen_id(gen_comissao_representante_id,1);'
      'end'
      '^'
      'alter table COMISSAO_REPRESENTANTE'
      'add constraint FK_COMISSAO_REPRESENTANTE_1'
      'foreign key (CODIGO_REPRESENTANTE)'
      'references PESSOAS(CODIGO)'
      '^'
      'CREATE TABLE COMISSAO_HAS_LANCAMENTOS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_COMISSAO_REPRESENTANTE INTEGER,'
      '    CODIGO_LANCAMENTO NUMERIC(15,0),'
      '    TIPO CHAR(1))'
      '^'
      'alter table COMISSAO_HAS_LANCAMENTOS'
      'add constraint PK_COMISSAO_HAS_LANCAMENTOS'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_COMISSAO_HAS_LANCAMENTOS_ID'
      '^'
      
        'create trigger comissao_has_lancamentos_bi for comissao_has_lanc' +
        'amentos'
      'active before insert position 0'
      'as'
      'begin'
      '  if ((new.codigo is null)OR(NEW.CODIGO = 0)) then'
      '    new.codigo = gen_id(gen_comissao_has_lancamentos_id,1);'
      'end'
      '^'
      'alter table COMISSAO_HAS_LANCAMENTOS'
      'add constraint FK_COMISSAO_HAS_LANCAMENTOS_1'
      'foreign key (CODIGO_COMISSAO_REPRESENTANTE)'
      'references COMISSAO_REPRESENTANTE(CODIGO)'
      '^'
      'alter table COMISSAO_HAS_LANCAMENTOS'
      'add constraint FK_COMISSAO_HAS_LANCAMENTOS_2'
      'foreign key (CODIGO_LANCAMENTO)'
      'references LANCAMENTOS(CODIGO)'
      '^')
    TabOrder = 72
    WordWrap = False
  end
  object versao73: TMemo
    Left = 105
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD DESPACHADO CHAR(1)'
      '^'
      'ALTER TABLE PEDIDOS'
      'ADD DT_DESPACHO DATE'
      '^')
    TabOrder = 73
    WordWrap = False
  end
  object versao74: TMemo
    Left = 129
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD DESCONTO_ITENS NUMERIC(15,2)'
      '^')
    TabOrder = 74
    WordWrap = False
  end
  object versao75: TMemo
    Left = 153
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'update pedidos p set DESCONTO_ITENS = p.desconto'
      'where p.codigo = p.codigo'
      '^'
      'update pedidos set desconto = 0'
      '^'
      
        'update pedidos p set p.desconto = (select tn.desconto - (p.desco' +
        'nto_itens +  p.desconto_fpgto)'
      
        '                                        from totais_notas_fiscai' +
        's tn'
      
        '                                    left join notas_fiscais n   ' +
        '   on n.codigo = tn.codigo_nota_fiscal'
      
        '                                    left join pedidos_faturados ' +
        'pf on pf.codigo_nota_fiscal = n.codigo'
      
        '                                    where pf.codigo_pedido = p.c' +
        'odigo'
      '                                   )'
      '^')
    TabOrder = 75
    WordWrap = False
  end
  object versao76: TMemo
    Left = 177
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS_NF_MATERIA'
      'ADD CST CHAR(3)'
      '^'
      'ALTER TABLE ITENS_NF_MATERIA'
      'ADD CSOSN CHAR(4)'
      '^'
      'ALTER TABLE ITENS_NF_MATERIA'
      'ADD CFOP CHAR(4)'
      '^')
    TabOrder = 76
    WordWrap = False
  end
  object versao77: TMemo
    Left = 201
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CONTADORES ('
      '    CODIGO         INTEGER NOT NULL,'
      '    NOME           VARCHAR(50),'
      '    CRC            VARCHAR(10),'
      '    CPF            VARCHAR(11),'
      '    CNPJ           VARCHAR(20),'
      '    CEP            VARCHAR(9),'
      '    RUA            VARCHAR(60),'
      '    NUMERO         VARCHAR(6),'
      '    BAIRRO         VARCHAR(50),'
      '    CODIGO_CIDADE  INTEGER,'
      '    FONE           VARCHAR(15),'
      '    EMAIL          VARCHAR(100)'
      ')'
      '^'
      
        'ALTER TABLE CONTADORES ADD CONSTRAINT PK_CONTADORES PRIMARY KEY ' +
        '(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CONTADORES_ID'
      '^'
      'CREATE TRIGGER CONTADORES_BI FOR CONTADORES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CONTADORES_ID,1);'
      'END'
      '^')
    TabOrder = 77
    WordWrap = False
  end
  object versao78: TMemo
    Left = 225
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'ALTER TABLE COMISSAO_HAS_LANCAMENTOS DROP CONSTRAINT FK_COMISSAO' +
        '_HAS_LANCAMENTOS_2'
      '^'
      'alter table COMISSAO_HAS_LANCAMENTOS'
      'add constraint FK_COMISSAO_HAS_LANCAMENTOS_2'
      'foreign key (CODIGO_LANCAMENTO)'
      'references LANCAMENTOS(CODIGO)'
      'on delete CASCADE'
      'using index FK_COMISSAO_HAS_LANCAMENTOS_2'
      '^')
    TabOrder = 78
    WordWrap = False
  end
  object versao79: TMemo
    Left = 249
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CONFERENCIA_PEDIDO ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_PEDIDO INTEGER,'
      '    CODIGO_USUARIO INTEGER,'
      '    TEMPO_DECORRIDO FLOAT,'
      '    INICIO DATE,'
      '    FIM DATE)'
      '^'
      'alter table CONFERENCIA_PEDIDO'
      'add constraint PK_CONFERENCIA_PEDIDO'
      'primary key (CODIGO)'
      '^'
      'alter table CONFERENCIA_PEDIDO'
      'add constraint FK_CONFERENCIA_PEDIDO_1'
      'foreign key (CODIGO_PEDIDO)'
      'references PEDIDOS(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CONFERENCIA_PEDIDO_ID'
      '^'
      'CREATE TRIGGER CONFERENCIA_PEDIDO_BI FOR CONFERENCIA_PEDIDO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CONFERENCIA_PEDIDO_ID,1);'
      'END'
      '^'
      'CREATE TABLE CONFERENCIA_ITENS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_CONFERENCIA INTEGER,'
      '    CODIGO_ITEM INTEGER,'
      '    QTD_RN INTEGER,'
      '    QTD_P INTEGER,'
      '    QTD_M INTEGER,'
      '    QTD_G INTEGER,'
      '    QTD_1 INTEGER,'
      '    QTD_2 INTEGER,'
      '    QTD_3 INTEGER,'
      '    QTD_4 INTEGER,'
      '    QTD_6 INTEGER,'
      '    QTD_8 INTEGER,'
      '    QTD_UNICA INTEGER)'
      '^'
      'alter table CONFERENCIA_ITENS'
      'add constraint PK_CONFERENCIA_ITENS'
      'primary key (CODIGO)'
      '^'
      'alter table CONFERENCIA_ITENS'
      'add constraint FK_CONFERENCIA_ITENS_2'
      'foreign key (CODIGO_ITEM)'
      'references ITENS(CODIGO)'
      '^'
      'alter table CONFERENCIA_ITENS'
      'add constraint FK_CONFERENCIA_ITENS_1'
      'foreign key (CODIGO_CONFERENCIA)'
      'references CONFERENCIA_PEDIDO(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CONFERENCIA_ITENS_ID'
      '^'
      'CREATE TRIGGER CONFERENCIA_ITENS_BI FOR CONFERENCIA_ITENS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CONFERENCIA_ITENS_ID,1);'
      'END'
      '^')
    TabOrder = 79
    WordWrap = False
  end
  object versao80: TMemo
    Left = 273
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CONFERENCIA_ITENS'
      'ADD NUMERO_CAIXA INTEGER'
      '^')
    TabOrder = 80
    WordWrap = False
  end
  object versao81: TMemo
    Left = 297
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD COD_PEDIDO_MATRIZ INTEGER'
      '^'
      'ALTER TABLE PEDIDOS ALTER COLUMN NUMPEDIDO TYPE varchar(22)'
      '^')
    TabOrder = 81
    WordWrap = False
  end
  object versao82: TMemo
    Left = 321
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'update pedidos p set p.numpedido = REPLACE(p.numpedido, '#39'.00'#39', '#39 +
        #39')'
      'where p.numpedido like '#39'%.00'#39
      '^')
    TabOrder = 82
    WordWrap = False
  end
  object versao83: TMemo
    Left = 345
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PRODUTOS'
      'ADD GENERO CHAR(1)'
      '^')
    TabOrder = 83
    WordWrap = False
  end
  object versao84: TMemo
    Left = 369
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'ALTER TABLE CONFERENCIA_ITENS DROP CONSTRAINT FK_CONFERENCIA_ITE' +
        'NS_2'
      '^'
      'alter table CONFERENCIA_ITENS'
      'add constraint FK_CONFERENCIA_ITENS_2'
      'foreign key (CODIGO_ITEM)'
      'references ITENS(CODIGO)'
      'on delete CASCADE'
      '^')
    TabOrder = 84
    WordWrap = False
  end
  object versao85: TMemo
    Left = 393
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CAIXAS ('
      '    CODIGO INTEGER NOT NULL,'
      '    NUMERO_CAIXA VARCHAR(15),'
      '    CODIGO_CONFERENCIA INTEGER,'
      '    CODIGO_ITEM INTEGER,'
      '    CODIGO_COR INTEGER,'
      '    QTD_RN INTEGER,'
      '    QTD_P INTEGER,'
      '    QTD_M INTEGER,'
      '    QTD_G INTEGER,'
      '    QTD_1 INTEGER,'
      '    QTD_2 INTEGER,'
      '    QTD_3 INTEGER,'
      '    QTD_4 INTEGER,'
      '    QTD_6 INTEGER,'
      '    QTD_8 INTEGER,'
      '    QTD_UNICA INTEGER)'
      '^'
      'alter table CAIXAS'
      'add constraint PK_CAIXAS'
      'primary key (CODIGO)'
      '^'
      'alter table CAIXAS'
      'add constraint FK_CAIXAS_1'
      'foreign key (CODIGO_CONFERENCIA)'
      'references CONFERENCIA_PEDIDO(CODIGO)'
      '^'
      'alter table CAIXAS'
      'add constraint FK_CAIXAS_2'
      'foreign key (CODIGO_ITEM)'
      'references ITENS(CODIGO)'
      '^'
      'alter table CAIXAS'
      'add constraint FK_CAIXAS_3'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_CAIXAS_ID'
      '^'
      'CREATE TRIGGER CAIXAS_BI FOR CAIXAS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CAIXAS_ID,1);'
      'END'
      '^')
    TabOrder = 85
    WordWrap = False
  end
  object versao86: TMemo
    Left = 417
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CAIXAS DROP CONSTRAINT FK_CAIXAS_2'
      '^'
      'alter table CAIXAS'
      'add constraint FK_CAIXAS_2'
      'foreign key (CODIGO_ITEM)'
      'references ITENS(CODIGO)'
      'on delete CASCADE'
      '^')
    TabOrder = 86
    WordWrap = False
  end
  object versao87: TMemo
    Left = 441
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CORES'
      'ADD TIPO CHAR(1)'
      'DEFAULT '#39'E'#39' '
      '^'
      'ALTER TABLE PRODUTOS'
      'ADD TIPO CHAR(1)'
      'DEFAULT '#39'E'#39' '
      '^')
    TabOrder = 87
    WordWrap = False
  end
  object versao88: TMemo
    Left = 465
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'UPDATE CORES SET TIPO = '#39'E'#39
      '^'
      'UPDATE PRODUTOS SET TIPO = '#39'E'#39
      '^'
      'ALTER TABLE PRODUTO_CORES'
      'ADD GENERO CHAR(1)'
      '^'
      'ALTER TABLE PRODUTOS DROP GENERO'
      '^')
    TabOrder = 88
    WordWrap = False
  end
  object versao89: TMemo
    Left = 489
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS DROP CONSTRAINT FK_ITENS_3'
      '^'
      'alter table ITENS'
      'add constraint FK_ITENS_3'
      'foreign key (COD_PEDIDO)'
      'references PEDIDOS(CODIGO)'
      'on delete CASCADE'
      '^'
      'alter table PEDIDOS'
      'add constraint UNQ1_PEDIDOS'
      'unique (NUMPEDIDO)'
      '^')
    TabOrder = 89
    WordWrap = False
  end
  object versao90: TMemo
    Left = 513
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'update pedidos p set p.dt_aprovacao = p.dt_cadastro'
      'where p.dt_aprovacao < '#39'01.01.2000'#39
      '^')
    TabOrder = 90
    WordWrap = False
  end
  object versao91: TMemo
    Left = 537
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PRODUTOS'
      'ADD UNIDADE_MEDIDA CHAR(2)'
      '^')
    TabOrder = 91
    WordWrap = False
  end
  object versao92: TMemo
    Left = 561
    Top = 100
    Width = 25
    Height = 25
    Lines.Strings = (
      'update produtos set unidade_medida = '#39'UN'#39
      '^'
      'ALTER TABLE NATUREZAS_OPERACAO'
      'ADD SUSPENSAO_ICMS CHAR(1)'
      '^')
    TabOrder = 92
    WordWrap = False
  end
  object versao93: TMemo
    Left = 9
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD DESCONTO_COMISS NUMERIC(15,2)'
      'DEFAULT 0 '
      '^'
      'ALTER TABLE LANCAMENTOS'
      'ADD OBSERVACAO VARCHAR(500)'
      '^')
    TabOrder = 93
    WordWrap = False
  end
  object versao94: TMemo
    Left = 33
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'UPDATE PEDIDOS SET DESCONTO_COMISS = 0'
      'WHERE DESCONTO_COMISS is null'
      '^')
    TabOrder = 94
    WordWrap = False
  end
  object versao95: TMemo
    Left = 57
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS ALTER COLUMN QTD_UNICA TYPE NUMERIC(15,2)'
      '^')
    TabOrder = 95
    WordWrap = False
  end
  object versao96: TMemo
    Left = 81
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ESTOQUE ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_PRODUTO INTEGER,'
      '    CODIGO_TAMANHO INTEGER,'
      '    CODIGO_COR INTEGER,'
      '    QUANTIDADE NUMERIC(15,2))'
      '^'
      'alter table ESTOQUE'
      'add constraint PK_ESTOQUE'
      'primary key (CODIGO)'
      '^'
      'alter table ESTOQUE'
      'add constraint FK_ESTOQUE_1'
      'foreign key (CODIGO_PRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'alter table ESTOQUE'
      'add constraint FK_ESTOQUE_2'
      'foreign key (CODIGO_TAMANHO)'
      'references TAMANHOS(CODIGO)'
      '^'
      'alter table ESTOQUE'
      'add constraint FK_ESTOQUE_3'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      '^'
      'CREATE GENERATOR GEN_ESTOQUE_ID'
      '^'
      'CREATE TRIGGER ESTOQUE_BI FOR ESTOQUE'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ESTOQUE_ID,1);'
      'END'
      '^')
    TabOrder = 96
    WordWrap = False
  end
  object versao97: TMemo
    Left = 105
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'ALTER TABLE NOTAS_FISCAIS DROP CONSTRAINT FK_NOTAS_FISCAIS_TRANS' +
        'P'
      '^'
      'ALTER TABLE NOTAS_FISCAIS DROP CONSTRAINT FK_NOTAS_FISCAIS_NAT'
      '^'
      
        'ALTER TABLE NOTAS_FISCAIS DROP CONSTRAINT FK_NOTAS_FISCAIS_FPAGT' +
        'O'
      '^'
      'ALTER TABLE NOTAS_FISCAIS DROP CONSTRAINT FK_NOTAS_FISCAIS_DEST'
      '^'
      'ALTER TABLE NOTAS_FISCAIS DROP CONSTRAINT FK_NOTAS_FISCAIS_EMIT'
      '^'
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_TRANSP'
      'foreign key (CODIGO_TRANSPORTADORA)'
      'references PESSOAS(CODIGO)'
      '^'
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_NAT'
      'foreign key (CODIGO_NATUREZA)'
      'references NATUREZAS_OPERACAO(CODIGO)'
      '^'
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_FPAGTO'
      'foreign key (CODIGO_FPAGTO)'
      'references FORMAS_PGTO(CODIGO)'
      '^'
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_DEST'
      'foreign key (CODIGO_DESTINATARIO)'
      'references PESSOAS(CODIGO)'
      '^'
      'alter table NOTAS_FISCAIS'
      'add constraint FK_NOTAS_FISCAIS_EMIT'
      'foreign key (CODIGO_EMITENTE)'
      'references PESSOAS(CODIGO)'
      '^')
    TabOrder = 97
    WordWrap = False
  end
  object versao98: TMemo
    Left = 129
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD CANCELADO CHAR(1)'
      'DEFAULT '#39#39
      '^')
    TabOrder = 98
    WordWrap = False
  end
  object versao99: TMemo
    Left = 153
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'UPDATE PEDIDOS'
      'SET CANCELADO = '#39#39
      '^'
      'UPDATE pedidos P set P.cancelado = '#39'S'#39
      'WHERE P.codigo in'
      '    ( select pf.codigo_pedido from pedidos_faturados pf'
      
        '        left join notas_fiscais_nfe_retorno nfr on nfr.codigo_no' +
        'ta_fiscal = pf.codigo_nota_fiscal'
      '      where nfr.status in ('#39'135'#39','#39'101'#39')'
      '     )'
      '^')
    TabOrder = 99
    WordWrap = False
  end
  object versao100: TMemo
    Left = 177
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_CCE_XML_ID'
      '^'
      'CREATE GENERATOR GEN_CORRECOES_CCE_ID'
      '^'
      'CREATE GENERATOR GEN_LOTES_CCE_ID'
      '^'
      'CREATE GENERATOR GEN_RETURN_CCE_CORR_ID'
      '^'
      'CREATE GENERATOR GEN_RETURN_CCE_LOTE_ID'
      '^')
    TabOrder = 100
    WordWrap = False
  end
  object versao101: TMemo
    Left = 201
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE CCE_XML ('
      '    CODIGO        INTEGER NOT NULL,'
      '    COD_RET_CORR  INTEGER,'
      '    XML           BLOB SUB_TYPE 1 SEGMENT SIZE 80'
      ')'
      '^'
      'CREATE TABLE CORRECOES_CCE ('
      '    CODIGO       INTEGER NOT NULL,'
      '    COD_LOTE     INTEGER,'
      '    CODIGO_NOTA      INTEGER,'
      '    DT_CORRECAO  DATE NOT NULL,'
      '    CORRECAO     VARCHAR(1000) NOT NULL'
      ')'
      '^'
      'CREATE TABLE LOTES_CCE ('
      '    CODIGO  INTEGER NOT NULL,'
      '    DATA    DATE NOT NULL'
      ')'
      '^'
      'CREATE TABLE RETURN_CCE_CORR ('
      '    CODIGO        INTEGER NOT NULL,'
      '    COD_CORRECAO  INTEGER,'
      '    STATUS        VARCHAR(3),'
      '    MOTIVO        VARCHAR(255)'
      ')'
      '^'
      'CREATE TABLE RETURN_CCE_LOTE ('
      '    CODIGO    INTEGER NOT NULL,'
      '    COD_LOTE  INTEGER,'
      '    STATUS    VARCHAR(3),'
      '    MOTIVO    VARCHAR(255)'
      ')'
      '^'
      
        'ALTER TABLE CCE_XML ADD CONSTRAINT PK_CCE_XML PRIMARY KEY (CODIG' +
        'O)'
      '^'
      
        'ALTER TABLE CORRECOES_CCE ADD CONSTRAINT PK_CORRECOES_CCE PRIMAR' +
        'Y KEY (CODIGO)'
      '^'
      
        'ALTER TABLE LOTES_CCE ADD CONSTRAINT PK_LOTES_CCE PRIMARY KEY (C' +
        'ODIGO)'
      '^'
      
        'ALTER TABLE RETURN_CCE_CORR ADD CONSTRAINT PK_RETURN_CCE_CORR PR' +
        'IMARY KEY (CODIGO)'
      '^'
      
        'ALTER TABLE RETURN_CCE_LOTE ADD CONSTRAINT PK_RETURN_CCE_LOTE PR' +
        'IMARY KEY (CODIGO)'
      '^')
    TabOrder = 101
    WordWrap = False
  end
  object versao102: TMemo
    Left = 225
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'ALTER TABLE CCE_XML ADD CONSTRAINT FK_CCE_XML_1 FOREIGN KEY (COD' +
        '_RET_CORR) REFERENCES RETURN_CCE_CORR (CODIGO)'
      '^'
      
        'ALTER TABLE CORRECOES_CCE ADD CONSTRAINT FK_CORRECOES_CCE_LOTE F' +
        'OREIGN KEY (COD_LOTE) REFERENCES LOTES_CCE (CODIGO)'
      '^'
      
        'ALTER TABLE CORRECOES_CCE ADD CONSTRAINT FK_CORRECOES_CCE_NFE FO' +
        'REIGN KEY (CODIGO_NOTA) REFERENCES NOTAS_FISCAIS(CODIGO)'
      '^'
      
        'ALTER TABLE RETURN_CCE_CORR ADD CONSTRAINT FK_CORRECOES_RET_CCE ' +
        'FOREIGN KEY (COD_CORRECAO) REFERENCES CORRECOES_CCE (CODIGO) ON ' +
        'DELETE CASCADE'
      '^')
    TabOrder = 102
    WordWrap = False
  end
  object versao103: TMemo
    Left = 249
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TRIGGER CCE_XML_BI FOR CCE_XML'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF((new.codigo is null)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CCE_XML_ID,1);'
      'END'
      '^'
      'CREATE TRIGGER CORRECOES_CCE_BI FOR CORRECOES_CCE'
      'ACTIVE BEFORE INSERT POSITION 0'
      'as'
      'begin'
      '  if ((new.codigo is null)or(new.codigo = 0)) then'
      '    new.codigo = gen_id(gen_CORRECOES_cce_id,1);'
      'end'
      '^'
      'CREATE TRIGGER LOTES_CCE_BI FOR LOTES_CCE'
      'ACTIVE BEFORE INSERT POSITION 0'
      'as'
      'begin'
      '  if ((new.codigo is null) or (new.codigo = 0)) then'
      '    new.codigo = gen_id(gen_LOTES_CCE_id,1);'
      'end'
      '^'
      'CREATE TRIGGER RETURN_CCE_CORR_BI FOR RETURN_CCE_CORR'
      'ACTIVE BEFORE INSERT POSITION 0'
      'as'
      'begin'
      '  if ((new.codigo is null)or(new.codigo = 0)) then'
      '    new.codigo = gen_id(gen_RETURN_CCE_CORR_id,1);'
      'end'
      '^'
      'CREATE TRIGGER RETURN_CCE_LOTE_BI FOR RETURN_CCE_LOTE'
      'ACTIVE BEFORE INSERT POSITION 0'
      'as'
      'begin'
      '  if ((new.codigo is null)or(new.codigo = 0)) then'
      '    new.codigo = gen_id(gen_RETURN_CCE_LOTE_id,1);'
      'end'
      '^')
    TabOrder = 103
    WordWrap = False
  end
  object versao104: TMemo
    Left = 273
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'update pedidos p set p.desconto = 0'
      'where p.desconto is null'
      '^'
      'update pedidos p set p.desconto_fpgto = 0'
      'where p.desconto_fpgto is null'
      '^'
      'update pedidos p set p.acrescimo = 0'
      'where p.acrescimo is null'
      '^')
    TabOrder = 104
    WordWrap = False
  end
  object versao105: TMemo
    Left = 297
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'update pedidos p set p.valor_total = (select ( SUM(it.valor_tota' +
        'l) - p2.desconto - p2.desconto_fpgto + p2.acrescimo) from pedido' +
        's p2'
      
        '                                               left join itens i' +
        't on it.cod_pedido = p2.codigo'
      
        '                                               where p2.codigo =' +
        ' p.codigo'
      
        '                                               group by p2.codig' +
        'o , p2.desconto , p2.desconto_fpgto , p2.acrescimo)'
      'where p.valor_total is null'
      '^')
    TabOrder = 105
    WordWrap = False
  end
  object versao106: TMemo
    Left = 321
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE PROCEDURE PERCENT_ESTOQUE_DISPONIVEL ('
      '    codigo_pedido integer)'
      'returns ('
      '    q_caixas integer,'
      '    percent_disponivel numeric(15,2))'
      'as'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica numeric(15,2);'
      'declare variable codigo_produto integer;'
      'declare variable codigo_cor integer;'
      'declare variable q_estoque numeric(15,2);'
      'declare variable percent_negativa numeric(15,2);'
      'declare variable q_negativa numeric(15,2);'
      'declare variable q_total numeric(15,2);'
      'declare variable tipo_produto integer;'
      'declare variable peso numeric(15,2);'
      'declare variable peso_total numeric(15,2);'
      'begin'
      '  q_negativa = 0;'
      '  q_total    = 0;'
      '  peso_total = 0;'
      '  q_caixas   = 0;'
      '  percent_negativa = 0;'
      ''
      
        '  for select i.qtd_rn, i.qtd_p, i.qtd_m, i.qtd_g, i.qtd_1, i.qtd' +
        '_2, i.qtd_3, i.qtd_4, i.qtd_6, i.qtd_8, i.qtd_unica,'
      '  i.cod_produto, i.cod_cor, pro.cod_tipo, pro.peso_liq'
      '   from itens i'
      '   left join produtos pro on pro.codigo = i.cod_produto'
      '   where i.cod_pedido = :codigo_pedido'
      '  into'
      
        '    :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2, :q_3, :q_4, :q_6, :q_8,' +
        ' :q_unica, :codigo_produto, :codigo_cor, :tipo_produto, :peso'
      '  do'
      '  begin'
      ''
      '    if ((:tipo_produto = 2) and (:codigo_cor in (55,66))) then'
      '      codigo_cor = 0;'
      ''
      '    if (:q_rn > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 1 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_rn;'
      '      peso_total = peso_total + (:q_rn * :peso);'
      ''
      '      if (:q_rn > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_rn - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_p > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 2 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_p;'
      '      peso_total = peso_total + (:q_p * :peso);'
      ''
      '      if (:q_p > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_p - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_m > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 3 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_m;'
      '      peso_total = peso_total + (:q_m * :peso);'
      ''
      '      if (:q_m > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_m - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_g > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 4 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_g;'
      '      peso_total = peso_total + (:q_g * :peso);'
      ''
      '      if (:q_g > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_g - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_1 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 5 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_1;'
      '      peso_total = peso_total + (:q_1 * :peso);'
      ''
      '      if (:q_1 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_1 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_2 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 6 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_2;'
      '      peso_total = peso_total + (:q_2 * :peso);'
      ''
      '      if (:q_2 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_2 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_3 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 7 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_3;'
      '      peso_total = peso_total + (:q_3 * :peso);'
      ''
      '      if (:q_3 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_3 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_4 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 8 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_4;'
      '      peso_total = peso_total + (:q_4 * :peso);'
      ''
      '      if (:q_4 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_4 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_6 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 9 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_6;'
      '      peso_total = peso_total + (:q_6 * :peso);'
      ''
      '      if (:q_6 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_6 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_8 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 10 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_8;'
      '      peso_total = peso_total + (:q_8 * :peso);'
      ''
      '      if (:q_8 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_8 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_unica > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 11 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_unica;'
      '      peso_total = peso_total + (:q_unica * :peso);'
      ''
      '      if (:q_unica > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_unica - :q_estoque);'
      '      end'
      '    end'
      '  end'
      ''
      '  if (:peso_total > 18) then'
      '    q_caixas = TRUNC(peso_total / 18);'
      ''
      '  if (:q_negativa > 0) then'
      '    percent_negativa = (:q_negativa * 100) / :q_total;'
      ''
      '  percent_disponivel = (100 - :percent_negativa);'
      ''
      '  suspend;'
      ''
      'end'
      '^')
    TabOrder = 106
    WordWrap = False
  end
  object versao107: TMemo
    Left = 345
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'create view VW_PEDIDOS_P_CONFERENCIA( codigo, dt_representante, ' +
        'numpedido, valor_total, razao )'
      'as'
      
        'select p.codigo,p.dt_representante, p.numpedido , p.valor_total,' +
        ' c.razao'
      
        '   from pedidos p                                               ' +
        '                     '
      ' inner join pessoas c on c.codigo = p.cod_cliente'
      
        ' left join pedidos_faturados pf on pf.codigo_pedido = p.codigo  ' +
        '                     '
      
        'where not (p.cancelado = '#39'S'#39') and ( (pf.codigo is null) and not(' +
        'p.despachado = '#39'S'#39') )'
      'order by p.dt_representante'
      '^')
    TabOrder = 107
    WordWrap = False
  end
  object versao108: TMemo
    Left = 369
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CORES'
      'ADD COR_PAI CHAR(1)'
      'DEFAULT '#39'N'#39' '
      '^'
      'CREATE TABLE CORES_FILHAS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_COR_PAI INTEGER,'
      '    CODIGO_COR_FILHA INTEGER)'
      '^'
      'alter table CORES_FILHAS'
      'add constraint PK_CORES_FILHAS'
      'primary key (CODIGO)'
      '^'
      'alter table CORES_FILHAS'
      'add constraint FK_CORES_FILHAS_2'
      'foreign key (CODIGO_COR_FILHA)'
      'references CORES(CODIGO)'
      '^'
      'alter table CORES_FILHAS'
      'add constraint FK_CORES_FILHAS_1'
      'foreign key (CODIGO_COR_PAI)'
      'references CORES(CODIGO)'
      '^')
    TabOrder = 108
    WordWrap = False
  end
  object versao109: TMemo
    Left = 393
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_CORES_FILHAS_ID'
      '^'
      'CREATE TRIGGER CORES_FILHAS_BI FOR CORES_FILHAS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CORES_FILHAS_ID,1);'
      'END'
      '^')
    TabOrder = 109
    WordWrap = False
  end
  object versao110: TMemo
    Left = 417
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE NOTAS_FISCAIS'
      'ADD FINALIDADE CHAR(1)'
      '^'
      'ALTER TABLE NOTAS_FISCAIS'
      'ADD NFE_REFERENCIADA VARCHAR(44)'
      '^')
    TabOrder = 110
    WordWrap = False
  end
  object versao111: TMemo
    Left = 441
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE PROCEDURE ESTOQUE_POR_REFERENCIA ('
      '    cod_produto integer,'
      '    cod_cor integer)'
      'returns ('
      '    q_rn integer,'
      '    q_p integer,'
      '    q_m integer,'
      '    q_g integer,'
      '    q_1 integer,'
      '    q_2 integer,'
      '    q_3 integer,'
      '    q_4 integer,'
      '    q_6 integer,'
      '    q_8 integer,'
      '    q_unica integer)'
      'as'
      'declare variable quantidade integer;'
      'declare variable cod_tamanho integer;'
      'begin'
      '  q_rn = 0;'
      '  q_p  = 0;'
      '  q_m  = 0;'
      '  q_g  = 0;'
      '  q_1  = 0;'
      '  q_2  = 0;'
      '  q_3  = 0;'
      '  q_4  = 0;'
      '  q_6  = 0;'
      '  q_8  = 0;'
      '  q_unica  = 0;'
      ''
      '  FOR SELECT E.QUANTIDADE, E.CODIGO_TAMANHO FROM ESTOQUE E'
      
        '  WHERE E.CODIGO_PRODUTO = :cod_produto AND E.CODIGO_COR = :cod_' +
        'cor'
      '  INTO'
      '    :quantidade, :cod_tamanho'
      '  DO BEGIN'
      ''
      '         if (:cod_tamanho = 1) then      q_rn    = :quantidade;'
      '    else if (:cod_tamanho = 2) then      q_p     = :quantidade;'
      '    else if (:cod_tamanho = 3) then      q_m     = :quantidade;'
      '    else if (:cod_tamanho = 4) then      q_g     = :quantidade;'
      '    else if (:cod_tamanho = 5) then      q_1     = :quantidade;'
      '    else if (:cod_tamanho = 6) then      q_2     = :quantidade;'
      '    else if (:cod_tamanho = 7) then      q_3     = :quantidade;'
      '    else if (:cod_tamanho = 8) then      q_4     = :quantidade;'
      '    else if (:cod_tamanho = 9) then      q_6     = :quantidade;'
      '    else if (:cod_tamanho = 10) then     q_8     = :quantidade;'
      '    else if (:cod_tamanho = 11) then     q_unica = :quantidade;'
      ''
      '  END'
      '  suspend;'
      'end'
      '^')
    TabOrder = 111
    WordWrap = False
  end
  object versao112: TMemo
    Left = 465
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE ESTOQUE_POR_REFERENCIA ('
      '    cor_pai char(1),'
      '    cod_produto integer,'
      '    cod_cor integer)'
      'returns ('
      '    q_rn integer,'
      '    q_p integer,'
      '    q_m integer,'
      '    q_g integer,'
      '    q_1 integer,'
      '    q_2 integer,'
      '    q_3 integer,'
      '    q_4 integer,'
      '    q_6 integer,'
      '    q_8 integer,'
      '    q_unica integer)'
      'as'
      'declare variable quantidade integer;'
      'declare variable cod_tamanho integer;'
      
        'begin   q_rn = 0;   q_p  = 0;   q_m  = 0;   q_g  = 0;   q_1  = 0' +
        ';   q_2  = 0;   q_3  = 0;   q_4  = 0;   q_6  = 0;   q_8  = 0;   ' +
        'q_unica  = 0;'
      ''
      'if (:cor_pai = '#39'S'#39') then begin'
      ''
      
        '  FOR SELECT SUM(E.QUANTIDADE) quantidade, E.CODIGO_TAMANHO FROM' +
        ' ESTOQUE E'
      ''
      '  left join cores cor       on cor.codigo = e.codigo_cor'
      '  left join cores_filhas cf on cf.codigo_cor_pai = cor.codigo'
      ''
      '  WHERE E.CODIGO_PRODUTO = :cod_produto'
      '    AND cf.codigo_cor_pai = :cod_cor'
      ''
      '  group by 2'
      ''
      '  INTO'
      '  :quantidade, :cod_tamanho'
      '  DO'
      '  BEGIN'
      '         if (:cod_tamanho = 1) then      q_rn    = :quantidade;'
      '    else if (:cod_tamanho = 2) then      q_p     = :quantidade;'
      '    else if (:cod_tamanho = 3) then      q_m     = :quantidade;'
      '    else if (:cod_tamanho = 4) then      q_g     = :quantidade;'
      '    else if (:cod_tamanho = 5) then      q_1     = :quantidade;'
      '    else if (:cod_tamanho = 6) then      q_2     = :quantidade;'
      '    else if (:cod_tamanho = 7) then      q_3     = :quantidade;'
      '    else if (:cod_tamanho = 8) then      q_4     = :quantidade;'
      '    else if (:cod_tamanho = 9) then      q_6     = :quantidade;'
      '    else if (:cod_tamanho = 10) then     q_8     = :quantidade;'
      '    else if (:cod_tamanho = 11) then     q_unica = :quantidade;'
      '  END'
      ''
      ''
      'end'
      'else begin'
      ''
      '  FOR SELECT E.QUANTIDADE, E.CODIGO_TAMANHO FROM ESTOQUE E'
      '     WHERE E.CODIGO_PRODUTO = :cod_produto'
      '       AND E.CODIGO_COR = :cod_cor'
      '  INTO'
      '    :quantidade, :cod_tamanho'
      '  DO'
      '  BEGIN'
      '         if (:cod_tamanho = 1) then      q_rn    = :quantidade;'
      '    else if (:cod_tamanho = 2) then      q_p     = :quantidade;'
      '    else if (:cod_tamanho = 3) then      q_m     = :quantidade;'
      '    else if (:cod_tamanho = 4) then      q_g     = :quantidade;'
      '    else if (:cod_tamanho = 5) then      q_1     = :quantidade;'
      '    else if (:cod_tamanho = 6) then      q_2     = :quantidade;'
      '    else if (:cod_tamanho = 7) then      q_3     = :quantidade;'
      '    else if (:cod_tamanho = 8) then      q_4     = :quantidade;'
      '    else if (:cod_tamanho = 9) then      q_6     = :quantidade;'
      '    else if (:cod_tamanho = 10) then     q_8     = :quantidade;'
      '    else if (:cod_tamanho = 11) then     q_unica = :quantidade;'
      '  END'
      ''
      'end'
      ''
      '  suspend;'
      'end')
    TabOrder = 112
    WordWrap = False
  end
  object versao113: TMemo
    Left = 489
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE ESTOQUE_POR_REFERENCIA ('
      '    cod_produto integer,'
      '    cod_cor integer,'
      '    cor_pai char(1))'
      'returns ('
      '    q_rn integer,'
      '    q_p integer,'
      '    q_m integer,'
      '    q_g integer,'
      '    q_1 integer,'
      '    q_2 integer,'
      '    q_3 integer,'
      '    q_4 integer,'
      '    q_6 integer,'
      '    q_8 integer,'
      '    q_unica integer)'
      'as'
      'declare variable quantidade integer;'
      'declare variable cod_tamanho integer;'
      
        'begin   q_rn = 0;   q_p  = 0;   q_m  = 0;   q_g  = 0;   q_1  = 0' +
        ';   q_2  = 0;   q_3  = 0;   q_4  = 0;   q_6  = 0;   q_8  = 0;   ' +
        'q_unica  = 0;'
      ''
      'if (:cor_pai = '#39'S'#39') then begin'
      
        '    FOR SELECT SUM( CAST(E.QUANTIDADE as INTEGER)) quantidade, E' +
        '.CODIGO_TAMANHO FROM ESTOQUE E'
      '    left join cores cor       on cor.codigo = e.codigo_cor'
      '    left join cores_filhas cf on cf.codigo_cor_pai = cor.codigo'
      
        '    WHERE E.CODIGO_PRODUTO = :cod_produto     AND cf.codigo_cor_' +
        'pai = :cod_cor'
      '    group by 2'
      '    INTO'
      '      :quantidade, :cod_tamanho'
      '    DO   BEGIN'
      
        '           if (:cod_tamanho = 1) then      q_rn    = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 2) then      q_p     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 3) then      q_m     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 4) then      q_g     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 5) then      q_1     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 6) then      q_2     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 7) then      q_3     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 8) then      q_4     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 9) then      q_6     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 10) then     q_8     = :quantidade' +
        ';'
      
        '      else if (:cod_tamanho = 11) then     q_unica = :quantidade' +
        ';'
      '    END'
      'end'
      '    else begin'
      '      FOR SELECT E.QUANTIDADE, E.CODIGO_TAMANHO FROM ESTOQUE E'
      ''
      
        '      WHERE E.CODIGO_PRODUTO = :cod_produto        AND E.CODIGO_' +
        'COR = :cod_cor'
      ''
      '      INTO     :quantidade, :cod_tamanho'
      '  DO   BEGIN'
      '         if (:cod_tamanho = 1) then      q_rn    = :quantidade;'
      '    else if (:cod_tamanho = 2) then      q_p     = :quantidade;'
      '    else if (:cod_tamanho = 3) then      q_m     = :quantidade;'
      '    else if (:cod_tamanho = 4) then      q_g     = :quantidade;'
      '    else if (:cod_tamanho = 5) then      q_1     = :quantidade;'
      '    else if (:cod_tamanho = 6) then      q_2     = :quantidade;'
      '    else if (:cod_tamanho = 7) then      q_3     = :quantidade;'
      '    else if (:cod_tamanho = 8) then      q_4     = :quantidade;'
      '    else if (:cod_tamanho = 9) then      q_6     = :quantidade;'
      '    else if (:cod_tamanho = 10) then     q_8     = :quantidade;'
      '    else if (:cod_tamanho = 11) then     q_unica = :quantidade;'
      '  END'
      '  end'
      '    suspend;'
      '  end')
    TabOrder = 113
    WordWrap = False
  end
  object versao114: TMemo
    Left = 513
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_UNIDADES_ID'
      '^'
      'CREATE TABLE UNIDADES ('
      '    CODIGO          INTEGER NOT NULL,'
      '    UNIDADE_MEDIDA  VARCHAR(10),'
      '    DESCRICAO       VARCHAR(50)'
      ')'
      '^'
      
        'ALTER TABLE UNIDADES ADD CONSTRAINT PK_UNIDADES PRIMARY KEY (COD' +
        'IGO)'
      '^'
      'CREATE TRIGGER UNIDADES_BI FOR UNIDADES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_UNIDADES_ID,1);'
      'END'
      '^')
    TabOrder = 114
    WordWrap = False
  end
  object versao115: TMemo
    Left = 537
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0, '#39'UN'#39', '#39'UNIDADE'#39')'
      '^'
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0 '#39'FD'#39', '#39'FARDO'#39')'
      '^'
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0, '#39'RL'#39', '#39'ROLO'#39')'
      '^'
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0, '#39'GL'#39', '#39'GAL'#195'O'#39')'
      '^'
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0, '#39'PC'#39', '#39'PACOTE'#39')'
      '^'
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0, '#39'CX'#39', '#39'CAIXA'#39')'
      '^'
      
        'INSERT INTO UNIDADES (CODIGO, UNIDADE_MEDIDA, DESCRICAO) VALUES ' +
        '(0, '#39'KG'#39', '#39'QUILO'#39')'
      '^')
    TabOrder = 115
    WordWrap = False
  end
  object versao116: TMemo
    Left = 561
    Top = 132
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CLIENTES'
      'ADD FUNCIONARIO CHAR(1)'
      '^')
    TabOrder = 116
    WordWrap = False
  end
  object versao117: TMemo
    Left = 9
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CCE_XML DROP CONSTRAINT FK_CCE_XML_1'
      '^'
      'COMMIT WORK'
      '^')
    TabOrder = 117
    WordWrap = False
  end
  object versao118: TMemo
    Left = 33
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'alter table CCE_XML'
      'add constraint FK_CCE_XML_1'
      'foreign key (COD_RET_CORR)'
      'references RETURN_CCE_CORR(CODIGO)'
      'on delete CASCADE'
      'using index FK_CCE_XML_1'
      '^')
    TabOrder = 118
    WordWrap = False
  end
  object versao119: TMemo
    Left = 57
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE PROCEDURE PREVISAO_ESTOQUE ('
      '    codigo_cor integer,'
      '    codigo_produto integer)'
      'returns ('
      '    data_inicial date,'
      '    dias_rn numeric(15,2),'
      '    dias_p numeric(15,2),'
      '    dias_m numeric(15,2),'
      '    dias_g numeric(15,2),'
      '    dias_1 numeric(15,2),'
      '    dias_2 numeric(15,2),'
      '    dias_3 numeric(15,2),'
      '    dias_4 numeric(15,2),'
      '    dias_6 numeric(15,2),'
      '    dias_8 numeric(15,2),'
      '    dias_unica numeric(15,2))'
      'as'
      'declare variable mes_inicial integer;'
      'declare variable codigo_tamanho integer;'
      'declare variable mes_limite integer;'
      'declare variable qtd_meses_ativo integer;'
      'declare variable quantidade numeric(15,2);'
      'declare variable ano_limite integer;'
      'declare variable ano_inicial integer;'
      'begin'
      
        '  for select SUM(it.qtd_rn), SUM(it.qtd_p), SUM(it.qtd_m), SUM(i' +
        't.qtd_g), SUM(it.qtd_1), SUM(it.qtd_2), SUM(it.qtd_3),'
      
        '  SUM(it.qtd_4), SUM(it.qtd_6), SUM(it.qtd_8), SUM(it.qtd_unica)' +
        ',  MIN(ped.dt_aprovacao)'
      
        '  from itens it      left join pedidos  ped on ped.codigo = it.c' +
        'od_pedido'
      
        '  left join pedidos_faturados pf on pf.codigo_pedido = ped.codig' +
        'o'
      
        '  left join notas_fiscais nf on nf.codigo = pf.codigo_nota_fisca' +
        'l'
      ''
      
        '  where it.cod_produto = :codigo_produto and it.cod_cor = :codig' +
        'o_cor and (not (pf.codigo is null) or (ped.despachado = '#39'S'#39') )'
      
        '  and not (ped.cancelado = '#39'S'#39') and ped.dt_aprovacao < CAST('#39'01.' +
        #39' || EXTRACT(MONTH FROM CURRENT_DATE) || '#39'.'#39' ||'
      '  EXTRACT(YEAR FROM CURRENT_DATE) AS DATE)'
      '  into'
      
        '     :dias_rn, :dias_p, :dias_m, :dias_g, :dias_1, :dias_2, :dia' +
        's_3, :dias_4, :dias_6, :dias_8, :dias_unica, :data_inicial'
      '  do'
      '  begin'
      
        '   mes_limite  = CAST( EXTRACT(MONTH FROM CURRENT_DATE) as INTEG' +
        'ER);'
      
        '   mes_inicial = CAST( EXTRACT(MONTH FROM :data_inicial) as INTE' +
        'GER);'
      
        '   ano_limite  = CAST( EXTRACT(YEAR FROM CURRENT_DATE) as INTEGE' +
        'R);'
      
        '   ano_inicial = CAST( EXTRACT(YEAR FROM :data_inicial) as INTEG' +
        'ER);'
      ''
      '   qtd_meses_ativo = 0;'
      ''
      '   if (ano_inicial <> ano_limite) then'
      '     qtd_meses_ativo = 12 * (:ano_limite - :ano_inicial);'
      ''
      '   if (mes_limite < :mes_inicial) then begin'
      '     if (qtd_meses_ativo > 0) then'
      
        '       qtd_meses_ativo = (qtd_meses_ativo - 12) + ((12 - mes_ini' +
        'cial) + mes_limite);'
      '     else'
      '       qtd_meses_ativo = (12 - mes_inicial) + mes_limite;'
      '   end'
      '   else begin'
      
        '     qtd_meses_ativo = :qtd_meses_ativo + (mes_limite - mes_inic' +
        'ial);'
      '   end'
      ''
      '   for select e.codigo_tamanho, e.quantidade from estoque e'
      
        '   where e.codigo_produto = :codigo_produto and e.codigo_cor = :' +
        'codigo_cor'
      '     into'
      '   :codigo_tamanho, :quantidade'
      '   do begin'
      '     if (:codigo_tamanho = 1) then begin'
      '       dias_rn = dias_rn / qtd_meses_ativo;'
      '       dias_rn = dias_rn / 30;'
      '       dias_rn = :quantidade / dias_rn;'
      '     end'
      '     else if (:codigo_tamanho = 2) then begin'
      '     dias_p  = dias_p  / qtd_meses_ativo;'
      '     dias_p = dias_p / 30;'
      '     dias_p = :quantidade / dias_p;'
      '     end'
      '     else if (:codigo_tamanho = 3) then begin'
      '     dias_m = dias_m  / qtd_meses_ativo;'
      '     dias_m = dias_m / 30;'
      '     dias_m = :quantidade / dias_m;'
      '     end'
      '     else if (:codigo_tamanho = 4) then begin'
      '     dias_g  = dias_g  / qtd_meses_ativo;'
      '     dias_g = dias_g / 30;'
      '     dias_g = :quantidade / dias_g;'
      '     end'
      '     else if (:codigo_tamanho = 5) then begin'
      '     dias_1  = dias_1  / qtd_meses_ativo;'
      '     dias_1 = dias_1 / 30;'
      '     dias_1 = :quantidade / dias_1;'
      '     end'
      '     else if (:codigo_tamanho = 6) then begin'
      '     dias_2  = dias_2  / qtd_meses_ativo;'
      '     dias_2 = dias_2 / 30;'
      '     dias_2 = :quantidade / dias_2;'
      '     end'
      '     else if (:codigo_tamanho = 7) then begin'
      '     dias_3  = dias_3  / qtd_meses_ativo;'
      '     dias_3 = dias_3 / 30;'
      '     dias_3 = :quantidade / dias_3;'
      '     end'
      '     else if (:codigo_tamanho = 8) then begin'
      '     dias_4  = dias_4  / qtd_meses_ativo;'
      '     dias_4 = dias_4 / 30;'
      '     dias_4 = :quantidade / dias_4;'
      '     end'
      '     else if (:codigo_tamanho = 9) then begin'
      '     dias_6  = dias_6  / qtd_meses_ativo;'
      '     dias_6 = dias_6 / 30;'
      '     dias_6 = :quantidade / dias_6;'
      '     end'
      '     else if (:codigo_tamanho = 10) then begin'
      '     dias_8  = dias_8  / qtd_meses_ativo;'
      '     dias_8 = dias_8 / 30;'
      '     dias_8 = :quantidade / dias_8;'
      '     end'
      '     else if (:codigo_tamanho = 11) then begin'
      '     dias_unica  = dias_unica  / qtd_meses_ativo;'
      '     dias_unica = dias_unica / 30;'
      '     dias_unica = :quantidade / dias_unica;'
      '     end'
      '   end'
      'end'
      'suspend;'
      'end')
    TabOrder = 119
    WordWrap = False
  end
  object versao120: TMemo
    Left = 81
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'update pedidos set pedidos.dt_aprovacao = pedidos.dt_cadastro'
      
        'where pedidos.dt_aprovacao = '#39'30.12.1899'#39' and pedidos.aprovacao ' +
        '= '#39'A'#39
      '^'
      'update pedidos ped set ped.dt_aprovacao = null'
      'where ped.aprovacao <> '#39'A'#39
      '^'
      'update pedidos set dt_despacho = null'
      'where dt_despacho = '#39'01.01.1900'#39
      '^'
      'update pedidos set dt_despacho = dt_limite_entrega'
      'where despachado = '#39'S'#39' and dt_despacho is null'
      '^')
    TabOrder = 120
    WordWrap = False
  end
  object versao121: TMemo
    Left = 105
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE PREVISAO_ESTOQUE ('
      '    codigo_cor integer,'
      '    codigo_produto integer,'
      '    dt_ini date,'
      '    dt_fim date)'
      'returns ('
      '    data_inicial date,'
      '    dias_rn numeric(15,4),'
      '    dias_p numeric(15,4),'
      '    dias_m numeric(15,4),'
      '    dias_g numeric(15,4),'
      '    dias_1 numeric(15,4),'
      '    dias_2 numeric(15,4),'
      '    dias_3 numeric(15,4),'
      '    dias_4 numeric(15,4),'
      '    dias_6 numeric(15,4),'
      '    dias_8 numeric(15,4),'
      '    dias_unica numeric(15,4))'
      'as'
      'declare variable mes_inicial integer;'
      'declare variable codigo_tamanho integer;'
      'declare variable dias_ativo integer;'
      'declare variable quantidade numeric(15,2);'
      'begin'
      
        '  for select SUM(it.qtd_rn), SUM(it.qtd_p), SUM(it.qtd_m), SUM(i' +
        't.qtd_g), SUM(it.qtd_1), SUM(it.qtd_2), SUM(it.qtd_3),'
      
        '             SUM(it.qtd_4), SUM(it.qtd_6), SUM(it.qtd_8), SUM(it' +
        '.qtd_unica),  MIN(ped.dt_cadastro)   from itens it'
      ''
      '      left join pedidos  ped on ped.codigo = it.cod_pedido'
      
        '      left join pedidos_faturados pf on pf.codigo_pedido = ped.c' +
        'odigo'
      
        '      left join notas_fiscais nf on nf.codigo = pf.codigo_nota_f' +
        'iscal'
      ''
      
        '      where it.cod_produto = :codigo_produto and it.cod_cor = :c' +
        'odigo_cor and (not (pf.codigo is null) or (ped.despachado = '#39'S'#39')' +
        ' )'
      
        '        and not (ped.cancelado = '#39'S'#39') and ped.dt_cadastro betwee' +
        'n :dt_ini and :dt_fim'
      '  into'
      
        '    :dias_rn, :dias_p, :dias_m, :dias_g, :dias_1, :dias_2, :dias' +
        '_3, :dias_4, :dias_6, :dias_8, :dias_unica, :data_inicial'
      '  do'
      '   begin'
      ''
      '     dias_ativo = dt_fim - data_inicial;'
      ''
      '     for select e.codigo_tamanho, e.quantidade from estoque e'
      
        '     where e.codigo_produto = :codigo_produto and e.codigo_cor =' +
        ' :codigo_cor'
      '     into'
      '     :codigo_tamanho, :quantidade'
      '     do begin'
      '      if (:codigo_tamanho = 1) then begin'
      '        if (dias_rn = 0) then'
      '          dias_rn = 999999;'
      '        else begin'
      '            dias_rn = dias_rn / dias_ativo;'
      '            dias_rn = :quantidade / dias_rn;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 2) then begin'
      '        if (dias_p = 0) then'
      '          dias_p = 999999;'
      '        else begin'
      '            dias_p  = dias_p  / dias_ativo;'
      '            dias_p = :quantidade / dias_p;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 3) then begin'
      '        if (dias_m = 0) then'
      '          dias_m = 999999;'
      '        else begin'
      '            dias_m = dias_m  / dias_ativo;'
      '            dias_m = :quantidade / dias_m;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 4) then begin'
      '        if (dias_g = 0) then'
      '          dias_g = 999999;'
      '        else begin'
      '            dias_g  = dias_g  / dias_ativo;'
      '            dias_g = :quantidade / dias_g;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 5) then begin'
      '        if (dias_1 = 0) then'
      '          dias_1 = 999999;'
      '        else begin'
      '            dias_1  = dias_1  / dias_ativo;'
      '            dias_1 = :quantidade / dias_1;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 6) then begin'
      '        if (dias_2 = 0) then'
      '          dias_2 = 999999;'
      '        else begin'
      '            dias_2  = dias_2  / dias_ativo;'
      '            dias_2 = :quantidade / dias_2;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 7) then begin'
      '        if (dias_3 = 0) then'
      '          dias_3 = 999999;'
      '        else begin'
      '            dias_3  = dias_3  / dias_ativo;'
      '            dias_3 = :quantidade / dias_3;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 8) then begin'
      '        if (dias_4 = 0) then'
      '          dias_4 = 999999;'
      '        else begin'
      '            dias_4  = dias_4  / dias_ativo;'
      '            dias_4 = :quantidade / dias_4;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 9) then begin'
      '        if (dias_6 = 0) then'
      '          dias_6 = 999999;'
      '        else begin'
      '            dias_6  = dias_6  / dias_ativo;'
      '            dias_6 = :quantidade / dias_6;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 10) then begin'
      '        if (dias_8 = 0) then'
      '          dias_8 = 999999;'
      '        else begin'
      '            dias_8  = dias_8  / dias_ativo;'
      '            dias_8 = :quantidade / dias_8;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 11) then begin'
      '        if (dias_unica = 0) then'
      '          dias_unica = 999999; '
      '        else begin'
      '            dias_unica  = dias_unica  / dias_ativo;'
      '            dias_unica = :quantidade / dias_unica;'
      '        end'
      '      end'
      '    end'
      '  end'
      '  suspend;'
      'end'
      '^')
    TabOrder = 121
    WordWrap = False
  end
  object versao122: TMemo
    Left = 129
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE PREVISAO_ESTOQUE ('
      '    codigo_cor integer,'
      '    codigo_produto integer,'
      '    dt_ini date,'
      '    dt_fim date,'
      '    inclui_nfaturado char(1))'
      'returns ('
      '    data_inicial date,'
      '    dias_rn numeric(15,4),'
      '    dias_p numeric(15,4),'
      '    dias_m numeric(15,4),'
      '    dias_g numeric(15,4),'
      '    dias_1 numeric(15,4),'
      '    dias_2 numeric(15,4),'
      '    dias_3 numeric(15,4),'
      '    dias_4 numeric(15,4),'
      '    dias_6 numeric(15,4),'
      '    dias_8 numeric(15,4),'
      '    dias_unica numeric(15,4))'
      'as'
      'declare variable mes_inicial integer;'
      'declare variable codigo_tamanho integer;'
      'declare variable dias_ativo integer;'
      'declare variable quantidade numeric(15,2);'
      'begin'
      
        '  for select SUM(it.qtd_rn), SUM(it.qtd_p), SUM(it.qtd_m), SUM(i' +
        't.qtd_g), SUM(it.qtd_1), SUM(it.qtd_2), SUM(it.qtd_3),'
      
        '             SUM(it.qtd_4), SUM(it.qtd_6), SUM(it.qtd_8), SUM(it' +
        '.qtd_unica),  MIN(ped.dt_cadastro)   from itens it'
      ''
      '      left join pedidos  ped on ped.codigo = it.cod_pedido'
      
        '      left join pedidos_faturados pf on pf.codigo_pedido = ped.c' +
        'odigo'
      
        '      left join notas_fiscais nf on nf.codigo = pf.codigo_nota_f' +
        'iscal'
      ''
      
        '      where it.cod_produto = :codigo_produto and it.cod_cor = :c' +
        'odigo_cor and '
      
        '            ( (not (pf.codigo is null) or (ped.despachado = '#39'S'#39')' +
        ' ) or ('#39'S'#39' = :inclui_nfaturado)  )'
      
        '        and not (ped.cancelado = '#39'S'#39') and ped.dt_cadastro betwee' +
        'n :dt_ini and :dt_fim'
      '  into'
      
        '    :dias_rn, :dias_p, :dias_m, :dias_g, :dias_1, :dias_2, :dias' +
        '_3, :dias_4, :dias_6, :dias_8, :dias_unica, :data_inicial'
      '  do'
      '   begin'
      ''
      '     dias_ativo = dt_fim - dt_ini;'
      ''
      '     for select e.codigo_tamanho, e.quantidade from estoque e'
      
        '     where e.codigo_produto = :codigo_produto and e.codigo_cor =' +
        ' :codigo_cor'
      '     into'
      '     :codigo_tamanho, :quantidade'
      '     do begin'
      '      if (:codigo_tamanho = 1) then begin'
      '        if (dias_rn = 0) then'
      '          dias_rn = 999999;'
      '        else begin'
      '            dias_rn = dias_rn / dias_ativo;'
      '            dias_rn = :quantidade / dias_rn;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 2) then begin'
      '        if (dias_p = 0) then'
      '          dias_p = 999999;'
      '        else begin'
      '            dias_p  = dias_p  / dias_ativo;'
      '            dias_p = :quantidade / dias_p;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 3) then begin'
      '        if (dias_m = 0) then'
      '          dias_m = 999999;'
      '        else begin'
      '            dias_m = dias_m  / dias_ativo;'
      '            dias_m = :quantidade / dias_m;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 4) then begin'
      '        if (dias_g = 0) then'
      '          dias_g = 999999;'
      '        else begin'
      '            dias_g  = dias_g  / dias_ativo;'
      '            dias_g = :quantidade / dias_g;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 5) then begin'
      '        if (dias_1 = 0) then'
      '          dias_1 = 999999;'
      '        else begin'
      '            dias_1  = dias_1  / dias_ativo;'
      '            dias_1 = :quantidade / dias_1;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 6) then begin'
      '        if (dias_2 = 0) then'
      '          dias_2 = 999999;'
      '        else begin'
      '            dias_2  = dias_2  / dias_ativo;'
      '            dias_2 = :quantidade / dias_2;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 7) then begin'
      '        if (dias_3 = 0) then'
      '          dias_3 = 999999;'
      '        else begin'
      '            dias_3  = dias_3  / dias_ativo;'
      '            dias_3 = :quantidade / dias_3;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 8) then begin'
      '        if (dias_4 = 0) then'
      '          dias_4 = 999999;'
      '        else begin'
      '            dias_4  = dias_4  / dias_ativo;'
      '            dias_4 = :quantidade / dias_4;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 9) then begin'
      '        if (dias_6 = 0) then'
      '          dias_6 = 999999;'
      '        else begin'
      '            dias_6  = dias_6  / dias_ativo;'
      '            dias_6 = :quantidade / dias_6;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 10) then begin'
      '        if (dias_8 = 0) then'
      '          dias_8 = 999999;'
      '        else begin'
      '            dias_8  = dias_8  / dias_ativo;'
      '            dias_8 = :quantidade / dias_8;'
      '        end'
      '      end'
      '      else if (:codigo_tamanho = 11) then begin'
      '        if (dias_unica = 0) then'
      '          dias_unica = 999999; '
      '        else begin'
      '            dias_unica  = dias_unica  / dias_ativo;'
      '            dias_unica = :quantidade / dias_unica;'
      '        end'
      '      end'
      '    end'
      '  end'
      '  suspend;'
      'end'
      '^')
    TabOrder = 122
    WordWrap = False
  end
  object versao123: TMemo
    Left = 153
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE COLECOES ('
      '    CODIGO INTEGER NOT NULL,'
      '    DESCRICAO VARCHAR(30))'
      '^'
      'alter table COLECOES'
      'add constraint PK_COLECOES'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_COLECOES_ID'
      '^'
      'CREATE TRIGGER COLECOES_BI FOR COLECOES'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_COLECOES_ID,1);'
      'END'
      '^')
    TabOrder = 123
    WordWrap = False
  end
  object versao124: TMemo
    Left = 177
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CORES'
      'ADD CODIGO_COLECAO INTEGER'
      '^'
      'alter table CORES'
      'add constraint FK_CORES_1'
      'foreign key (CODIGO_COLECAO)'
      'references COLECOES(CODIGO)'
      '^')
    TabOrder = 124
    WordWrap = False
  end
  object versao125: TMemo
    Left = 201
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CORES ALTER REFERENCIA TYPE VARCHAR(20) ')
    TabOrder = 125
    WordWrap = False
  end
  object versao126: TMemo
    Left = 225
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_ICMS_ESTADO_ID'
      '^'
      'CREATE TABLE ICMS_ESTADO ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_ESTADO INTEGER,'
      '    PERC_REDUCAO_BC NUMERIC (15,2))'
      '^'
      'alter table ICMS_ESTADO'
      'add constraint PK_ICMS_ESTADO'
      'primary key (CODIGO)'
      '^'
      'alter table ICMS_ESTADO'
      'add constraint FK_ICMS_ESTADO_1'
      'foreign key (CODIGO_ESTADO)'
      'references ESTADOS(CODIGO)'
      '^'
      'CREATE TRIGGER ICMS_ESTADO_BI FOR ICMS_ESTADO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ICMS_ESTADO_ID,1);'
      'END'
      '^')
    TabOrder = 126
    WordWrap = False
  end
  object versao127: TMemo
    Left = 249
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS_NF_ICMS_00'
      'ADD PERC_REDUCAO_BC NUMERIC(15,2)'
      '^')
    TabOrder = 127
    WordWrap = False
  end
  object versao128: TMemo
    Left = 273
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE PROCEDURE BUSCA_CODBAR_DISPONIVEL ('
      '    prefixo varchar(10))'
      'returns ('
      '    cod_barras varchar(14))'
      'as'
      'declare variable numeracao_char varchar(4);'
      'declare variable cont integer;'
      'declare variable numeracao integer;'
      'begin'
      '  cont = 0;'
      '  cod_barras = '#39#39';'
      ''
      
        '  for select CAST(substring(cb.numeracao from 9 for 4) as intege' +
        'r),'
      
        '             lpad( substring(cb.numeracao from 9 for 4), 4, '#39'0'#39')' +
        ' from codigo_barras cb'
      '      where numeracao like :prefixo||'#39'%'#39
      '      order by 1'
      '  into'
      '    :numeracao, :numeracao_char'
      '  do'
      '  begin'
      ''
      '    if (numeracao <> cont) then begin'
      '      cod_barras = prefixo || :numeracao_char;'
      '      suspend;'
      '    end'
      ''
      '    cont = :cont +1;'
      ''
      '  end'
      ''
      '  if ((:cod_barras = '#39#39') and (cont < 9999)) then'
      
        '    cod_barras = prefixo || lpad( CAST((numeracao+1) as varchar(' +
        '4)), 4, '#39'0'#39');'
      '  suspend;'
      'end')
    TabOrder = 128
    WordWrap = False
  end
  object versao129: TMemo
    Left = 297
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE INTERVALOS_PRODUCAO ('
      '    CODIGO INTEGER NOT NULL,'
      '    HORA_INICIO TIME,'
      '    HORA_FIM TIME)'
      '^'
      'alter table INTERVALOS_PRODUCAO'
      'add constraint PK_INTERVALOS_PRODUCAO'
      'primary key (CODIGO)'
      '^'
      'CREATE GENERATOR GEN_INTERVALOS_PRODUCAO_ID'
      '^'
      'CREATE TRIGGER INTERVALOS_PRODUCAO_BI FOR INTERVALOS_PRODUCAO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0))THEN'
      '    NEW.CODIGO = GEN_ID(GEN_INTERVALOS_PRODUCAO_ID,1);'
      'END'
      '^')
    TabOrder = 129
    WordWrap = False
  end
  object versao130: TMemo
    Left = 321
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_ENTRADAS_SAIDAS_ID'
      '^'
      'CREATE TABLE ENTRADAS_SAIDAS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_PRODUTO INTEGER,'
      '    CODIGO_COR INTEGER,'
      '    CODIGO_TAMANHO INTEGER,'
      '    CODIGO_INTERVALO INTEGER,'
      '    DATA_LANCAMENTO DATE,'
      '    DATA_PRODUCAO DATE,'
      '    QUANTIDADE FLOAT,'
      '    TIPO CHAR(1))'
      '^'
      'alter table ENTRADAS_SAIDAS'
      'add constraint PK_ENTRADAS_SAIDAS'
      'primary key (CODIGO)'
      '^'
      'alter table ENTRADAS_SAIDAS'
      'add constraint FK_ENTRADAS_SAIDAS_2'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      '^'
      'alter table ENTRADAS_SAIDAS'
      'add constraint FK_ENTRADAS_SAIDAS_4'
      'foreign key (CODIGO_INTERVALO)'
      'references INTERVALOS_PRODUCAO(CODIGO)'
      '^'
      'alter table ENTRADAS_SAIDAS'
      'add constraint FK_ENTRADAS_SAIDAS_1'
      'foreign key (CODIGO_PRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'alter table ENTRADAS_SAIDAS'
      'add constraint FK_ENTRADAS_SAIDAS_3'
      'foreign key (CODIGO_TAMANHO)'
      'references TAMANHOS(CODIGO)'
      '^'
      'CREATE TRIGGER ENTRADAS_SAIDAS_BI FOR ENTRADAS_SAIDAS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0))THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ENTRADAS_SAIDAS_ID,1);'
      'END'
      '^')
    TabOrder = 130
    WordWrap = False
  end
  object versao131: TMemo
    Left = 345
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE BUSCA_CODBAR_DISPONIVEL ('
      '    prefixo varchar(10))'
      'returns ('
      '    cod_barras varchar(14))'
      'as'
      'declare variable numeracao_char varchar(4);'
      'declare variable cont integer;'
      'declare variable numeracao integer;'
      'begin   cont = 0;   cod_barras = '#39#39';'
      ''
      
        '    for select CAST(substring(cb.numeracao from 9 for 4) as inte' +
        'ger),'
      '    lpad( substring(cb.numeracao from 9 for 4), 4, '#39'0'#39')'
      ''
      '    from codigo_barras cb'
      ''
      '    where numeracao like :prefixo||'#39'%'#39
      ''
      '    order by 1'
      '    into'
      '      :numeracao, :numeracao_char'
      '    do'
      '    begin'
      ''
      '      if (numeracao <> cont) then begin'
      '        cod_barras = prefixo || CAST(cont as VARCHAR(4));'
      '        break;'
      '      end'
      ''
      '      cont = :cont +1;'
      '   end'
      ''
      '      if ((:cod_barras = '#39#39') and (cont < 9999)) then'
      
        '        cod_barras = prefixo || lpad( CAST((numeracao+1) as varc' +
        'har(4)), 4, '#39'0'#39');'
      '        suspend;'
      'end'
      '^')
    TabOrder = 131
    WordWrap = False
  end
  object versao132: TMemo
    Left = 369
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CONFIGURACOES_NF'
      'ADD TIPO_EMISSAO SMALLINT'
      '^'
      'ALTER TABLE CONFIGURACOES_NF'
      'ADD DT_CONTINGENCIA TIMESTAMP'
      '^')
    TabOrder = 132
    WordWrap = False
  end
  object versao133: TMemo
    Left = 393
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'UPDATE CONFIGURACOES_NF SET TIPO_EMISSAO = 1'
      '^')
    TabOrder = 133
    WordWrap = False
  end
  object versao134: TMemo
    Left = 417
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ENDERECOS ALTER BAIRRO TYPE VARCHAR(50) '
      '^')
    TabOrder = 134
    WordWrap = False
  end
  object versao135: TMemo
    Left = 441
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE ALIQ_INTERNA_ICMS ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_ESTADO INTEGER,'
      '    ALIQUOTA NUMERIC(15,2))'
      '^'
      'alter table ALIQ_INTERNA_ICMS'
      'add constraint PK_ALIQ_INTERNA_ICMS'
      'primary key (CODIGO)'
      '^'
      'alter table ALIQ_INTERNA_ICMS'
      'add constraint FK_ALIQ_INTERNA_ICMS_1'
      'foreign key (CODIGO_ESTADO)'
      'references ESTADOS(CODIGO)'
      '^')
    TabOrder = 135
    WordWrap = False
  end
  object versao136: TMemo
    Left = 465
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (1, 1, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (2, 2, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (3, 3, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (4, 4, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (5, 5, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (6, 6, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (7, 7, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (8, 8, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (9, 9, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (10, 10, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (11, 11, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (12, 12, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (13, 13, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (14, 14, 18)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (15, 15, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (16, 16, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (17, 17, 12)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (18, 18, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (19, 19, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (20, 20, 18)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (21, 21, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (22, 22, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (23, 23, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (24, 24, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (25, 25, 17)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (26, 26, 18)^'
      
        'INSERT INTO ALIQ_INTERNA_ICMS (CODIGO, CODIGO_ESTADO, ALIQUOTA) ' +
        'VALUES (27, 27, 17)^')
    TabOrder = 136
    WordWrap = False
  end
  object versao137: TMemo
    Left = 489
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE PROCEDURE CALCULA_SALDO ('
      '    codigo_item integer)'
      'returns ('
      '    qtd_rn integer,'
      '    qtd_p integer,'
      '    qtd_m integer,'
      '    qtd_g integer,'
      '    qtd_1 integer,'
      '    qtd_2 integer,'
      '    qtd_3 integer,'
      '    qtd_4 integer,'
      '    qtd_6 integer,'
      '    qtd_8 integer,'
      '    qtd_unica integer)'
      'as'
      'begin'
      
        '  for select CAST( (i.qtd_rn - iif(ci.qtd_rn is null, 0, ci.qtd_' +
        'rn)) as integer) qtd_rn,'
      
        '      CAST( (i.qtd_p - iif(ci.qtd_p is null, 0, ci.qtd_p))  as i' +
        'nteger) qtd_p,'
      
        '      CAST( (i.qtd_m - iif(ci.qtd_m is null, 0, ci.qtd_m))  as i' +
        'nteger) qtd_m,'
      
        '     CAST(  (i.qtd_g - iif(ci.qtd_g is null, 0, ci.qtd_g))  as i' +
        'nteger) qtd_g,'
      
        '       CAST((i.qtd_1 - iif(ci.qtd_1 is null, 0, ci.qtd_1))  as i' +
        'nteger) qtd_1,'
      
        '     CAST(  (i.qtd_2 - iif(ci.qtd_2 is null, 0, ci.qtd_2))  as i' +
        'nteger) qtd_2,'
      
        '      CAST( (i.qtd_3 - iif(ci.qtd_3 is null, 0, ci.qtd_3))  as i' +
        'nteger) qtd_3,'
      
        '      CAST( (i.qtd_4 - iif(ci.qtd_4 is null, 0, ci.qtd_4))  as i' +
        'nteger) qtd_4,'
      
        '      CAST( (i.qtd_6 - iif(ci.qtd_6 is null, 0, ci.qtd_6))  as i' +
        'nteger) qtd_6,'
      
        '      CAST( (i.qtd_8 - iif(ci.qtd_8 is null, 0, ci.qtd_8))  as i' +
        'nteger) qtd_8,'
      
        '      CAST( (trunc(i.qtd_unica) - iif(ci.qtd_unica is null, 0, c' +
        'i.qtd_unica))  as integer) qtd_unica from itens i'
      ''
      
        '      left join conferencia_itens ci on ci.codigo_item = i.codig' +
        'o'
      '    where i.codigo = :codigo_item'
      ''
      
        '    into :qtd_rn, :qtd_p, :qtd_m, :qtd_g, :qtd_1,  :qtd_2,:qtd_3' +
        ', :qtd_4, :qtd_6, :qtd_8, :qtd_unica'
      '    do begin'
      ''
      '    end'
      ''
      '  suspend;'
      'end'
      '^')
    TabOrder = 137
    WordWrap = False
  end
  object versao138: TMemo
    Left = 513
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE CALCULA_SALDO ('
      '    codigo_item integer)'
      'returns ('
      '    qtd_rn integer,'
      '    qtd_p integer,'
      '    qtd_m integer,'
      '    qtd_g integer,'
      '    qtd_1 integer,'
      '    qtd_2 integer,'
      '    qtd_3 integer,'
      '    qtd_4 integer,'
      '    qtd_6 integer,'
      '    qtd_8 integer,'
      '    qtd_unica integer)'
      'as'
      'begin'
      
        '  for select CAST( (i.qtd_rn - iif(ci.qtd_rn is null, 0, ci.qtd_' +
        'rn)) as integer) qtd_rn,'
      
        '             CAST( (i.qtd_p - iif(ci.qtd_p is null, 0, ci.qtd_p)' +
        ')  as integer) qtd_p,'
      
        '             CAST( (i.qtd_m - iif(ci.qtd_m is null, 0, ci.qtd_m)' +
        ')  as integer) qtd_m,'
      
        '             CAST(  (i.qtd_g - iif(ci.qtd_g is null, 0, ci.qtd_g' +
        '))  as integer) qtd_g,'
      
        '             CAST((i.qtd_1 - iif(ci.qtd_1 is null, 0, ci.qtd_1))' +
        '  as integer) qtd_1,'
      
        '             CAST(  (i.qtd_2 - iif(ci.qtd_2 is null, 0, ci.qtd_2' +
        '))  as integer) qtd_2,'
      
        '             CAST( (i.qtd_3 - iif(ci.qtd_3 is null, 0, ci.qtd_3)' +
        ')  as integer) qtd_3,'
      
        '             CAST( (i.qtd_4 - iif(ci.qtd_4 is null, 0, ci.qtd_4)' +
        ')  as integer) qtd_4,'
      
        '             CAST( (i.qtd_6 - iif(ci.qtd_6 is null, 0, ci.qtd_6)' +
        ')  as integer) qtd_6,'
      
        '             CAST( (i.qtd_8 - iif(ci.qtd_8 is null, 0, ci.qtd_8)' +
        ')  as integer) qtd_8,'
      
        '             CAST( (trunc(i.qtd_unica) - iif(ci.qtd_unica is nul' +
        'l, 0, ci.qtd_unica))  as float) qtd_unica'
      ''
      
        '             from itens i        left join conferencia_itens ci ' +
        'on ci.codigo_item = i.codigo'
      ''
      '             where i.codigo = :codigo_item'
      ''
      
        '             into :qtd_rn, :qtd_p, :qtd_m, :qtd_g, :qtd_1, :qtd_' +
        '2,:qtd_3, :qtd_4, :qtd_6, :qtd_8, :qtd_unica'
      '  do begin'
      '  end'
      '  suspend;'
      'end'
      '^')
    TabOrder = 138
    WordWrap = False
  end
  object versao139: TMemo
    Left = 537
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE trigger estoque_bu0 for estoque'
      'active before update position 0'
      'AS BEGIN'
      '  IF (new.quantidade < 0) THEN'
      '  begin'
      '    New.quantidade = 0;'
      '  end'
      'END'
      '^'
      'CREATE PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer)'
      'as'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'begin'
      ''
      '  for select i.cod_produto, i.cod_cor,'
      
        '       i.qtd_rn, i.qtd_p, i.qtd_m, i.qtd_g, i.qtd_1, i.qtd_2, i.' +
        'qtd_3,'
      '       i.qtd_4, i.qtd_6, i.qtd_8, i.qtd_unica  from itens i'
      ''
      '    left join pedidos p             on p.codigo = i.cod_pedido'
      '    where (p.codigo = :codped)'
      '    order by i.cod_produto, i.cod_cor'
      '  into'
      
        '    :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2,' +
        ' :q_3, :q_4, :q_6, :q_8, :q_unica'
      '  do'
      '  begin'
      '    if (:q_rn > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_rn)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 1;'
      '    end'
      ''
      '    if (:q_p > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_p)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 2;'
      '    end'
      '    if (:q_m > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_m)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 3;'
      '    end'
      '    if (:q_g > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_g)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 4;'
      '    end'
      '    if (:q_1 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_1)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 5;'
      '    end'
      '    if (:q_2 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_2)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 6;'
      '    end'
      '    if (:q_3 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_3)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 7;'
      '    end'
      '    if (:q_4 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_4)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 8 ;'
      '    end'
      '    if (:q_6 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_6)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 9;'
      '    end'
      '    if (:q_8 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_8)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 10 ;'
      '    end'
      '    if (:q_unica > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_unica)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 11;'
      '    end'
      ''
      '  end'
      ''
      '  suspend;'
      'end'
      '^')
    TabOrder = 139
    WordWrap = False
  end
  object versao140: TMemo
    Left = 561
    Top = 164
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_CONTAS_PAGAR_ID'
      '^'
      'CREATE TABLE CONTAS_PAGAR ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_NF INTEGER,'
      '    DT_DOCUMENTO DATE,'
      '    DT_LANCAMENTO DATE,'
      '    NUM_DOCUMENTO INTEGER,'
      '    COD_FORNECEDOR SMALLINT,'
      '    STATUS CHAR(1),'
      '    DESC_STATUS CHAR(10),'
      '    VALOR NUMERIC(15,2),'
      '    OBSERVACAO VARCHAR(120))'
      '^'
      'alter table CONTAS_PAGAR'
      'add constraint PK_CONTAS_PAGAR'
      'primary key (CODIGO)'
      '^'
      'alter table CONTAS_PAGAR'
      'add constraint FK_CONTAS_PAGAR_1'
      'foreign key (CODIGO_NF)'
      'references NOTAS_FISCAIS(CODIGO)'
      '^'
      'CREATE TRIGGER CONTAS_PAGAR_BI FOR CONTAS_PAGAR'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CONTAS_PAGAR_ID,1);'
      'END'
      '^'
      'CREATE GENERATOR GEN_PARCELAS_ID'
      '^'
      'CREATE TABLE PARCELAS('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_CONTA INTEGER,'
      '    NUM_PARCELA SMALLINT,'
      '    DT_VENCIMENTO DATE,'
      '    DT_PAGAMENTO DATE,'
      '    STATUS CHAR(1),'
      '    DESC_STATUS CHAR(10),'
      '    VALOR NUMERIC(15,2),'
      '    VALOR_PAGO NUMERIC(15,2))'
      '^'
      'alter table PARCELAS'
      'add constraint PK_PARCELAS'
      'primary key (CODIGO)'
      '^'
      'alter table PARCELAS'
      'add constraint FK_PARCELAS_1'
      'foreign key (CODIGO_CONTA)'
      'references CONTAS_PAGAR(CODIGO)'
      '^'
      'CREATE TRIGGER PARCELAS_BI FOR PARCELAS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_PARCELAS_ID,1);'
      'END'
      '^'
      'CREATE GENERATOR GEN_ITENS_CONTA_ID'
      '^'
      'CREATE TABLE ITENS_CONTA ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_CONTA INTEGER,'
      '    CODIGO_MATERIA INTEGER,'
      '    QUANTIDADE NUMERIC(15,2))'
      '^'
      'alter table ITENS_CONTA'
      'add constraint PK_ITENS_CONTA'
      'primary key (CODIGO)'
      '^'
      'alter table ITENS_CONTA'
      'add constraint FK_ITENS_CONTA_1'
      'foreign key (CODIGO_CONTA)'
      'references CONTAS_PAGAR(CODIGO)'
      '^'
      'alter table ITENS_CONTA'
      'add constraint FK_ITENS_CONTA_2'
      'foreign key (CODIGO_MATERIA)'
      'references MATERIAS(CODIGO)'
      '^'
      'CREATE TRIGGER ITENS_CONTA_BI FOR ITENS_CONTA'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ITENS_CONTA_ID,1);'
      'END'
      '^')
    TabOrder = 140
    WordWrap = False
  end
  object versao141: TMemo
    Left = 9
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS_CONTA'
      'ADD PRECO_CUSTO NUMERIC(15,2)'
      '^'
      'ALTER TABLE PARCELAS'
      'ADD VALOR_PAGO NUMERIC(15,2)'
      '^')
    TabOrder = 141
    WordWrap = False
  end
  object versao142: TMemo
    Left = 33
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'UPDATE PESSOAS SET BLOQUEADO = '#39'B'#39
      'WHERE BLOQUEADO = '#39'S'#39)
    TabOrder = 142
    WordWrap = False
  end
  object versao143: TMemo
    Left = 57
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PESSOAS'
      'ADD NOME_FANTASIA VARCHAR(60)')
    TabOrder = 143
    WordWrap = False
  end
  object versao144: TMemo
    Left = 81
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PRODUTOS'
      'ADD KIT CHAR(1)'
      '^'
      'CREATE GENERATOR GEN_PRODUTOS_KIT_ID'
      '^'
      'CREATE TABLE PRODUTOS_KIT ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_KIT INTEGER,'
      '    CODIGO_PRODUTO INTEGER)'
      '^'
      'alter table PRODUTOS_KIT'
      'add constraint PK_PRODUTOS_KIT'
      'primary key (CODIGO)'
      '^'
      'CREATE TRIGGER PRODUTOS_KIT_BI FOR PRODUTOS_KIT'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_PRODUTOS_KIT_ID,1);'
      'END'
      '^'
      'alter table PRODUTOS_KIT'
      'add constraint FK_PRODUTOS_KIT_2'
      'foreign key (CODIGO_PRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'alter table PRODUTOS_KIT'
      'add constraint FK_PRODUTOS_KIT_1'
      'foreign key (CODIGO_KIT)'
      'references PRODUTOS(CODIGO)'
      '^')
    TabOrder = 144
    WordWrap = False
  end
  object versao145: TMemo
    Left = 105
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE PROCEDURE ALTERA_ESTOQUE ('
      '    cod_produto integer,'
      '    cod_cor integer,'
      '    qtd_rn integer,'
      '    qtd_p integer,'
      '    qtd_m integer,'
      '    qtd_g integer,'
      '    qtd_1 integer,'
      '    qtd_2 integer,'
      '    qtd_3 integer,'
      '    qtd_4 integer,'
      '    qtd_6 integer,'
      '    qtd_8 integer,'
      '    qtd_unica integer,'
      '    multiplicador integer)'
      'as'
      'begin    '
      ''
      
        'if (:qtd_rn > 0) then begin         UPDATE ESTOQUE est set est.q' +
        'uantidade = (est.quantidade + (:qtd_rn * :multiplicador))'
      
        'where est.codigo_produto = :cod_produto and est.codigo_cor = :co' +
        'd_cor and est.codigo_tamanho = 1; end     '
      
        'if (:qtd_p > 0) then begin          UPDATE ESTOQUE est set est.q' +
        'uantidade = (est.quantidade + (:qtd_p * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 2;     end'
      
        ' if (:qtd_m > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_m * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 3;     end'
      
        ' if (:qtd_g > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_g * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 4;     end'
      
        ' if (:qtd_1 > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_1 * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 5;     end'
      
        ' if (:qtd_2 > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_2 * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 6;     end'
      
        ' if (:qtd_3 > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_3 * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 7;     end'
      
        ' if (:qtd_4 > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_4 * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 8 ;     end'
      
        ' if (:qtd_6 > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_6 * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 9;     end'
      
        ' if (:qtd_8 > 0) then begin        UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_8 * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 10 ;     end'
      
        ' if (:qtd_unica > 0) then begin        UPDATE ESTOQUE est set es' +
        't.quantidade = (est.quantidade + (:qtd_unica * :multiplicador))'
      
        ' where est.codigo_produto = :cod_produto and est.codigo_cor = :c' +
        'od_cor and est.codigo_tamanho = 11;     end'
      ' end'
      '^')
    TabOrder = 145
    WordWrap = False
  end
  object versao146: TMemo
    Left = 129
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer,'
      '    multiplicador integer)'
      'as'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'declare variable teste varchar(10);'
      'declare variable kit char(1);'
      'begin    for select i.cod_produto, i.cod_cor,'
      
        '    ci.qtd_rn, ci.qtd_p, ci.qtd_m, ci.qtd_g, ci.qtd_1, ci.qtd_2,' +
        ' ci.qtd_3,'
      
        '    ci.qtd_4, ci.qtd_6, ci.qtd_8, ci.qtd_unica, pro.kit  from co' +
        'nferencia_itens ci'
      ''
      
        '    inner join itens i               on ci.codigo_item = i.codig' +
        'o'
      '    inner join pedidos p             on p.codigo = i.cod_pedido'
      
        '    inner join produtos pro          on pro.codigo = i.cod_produ' +
        'to'
      ''
      
        '    where (p.codigo = :codped)          order by i.cod_produto, ' +
        'i.cod_cor   into'
      
        '    :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2,' +
        ' :q_3, :q_4, :q_6, :q_8, :q_unica, :kit   do   begin'
      ''
      '    if (:KIT = '#39'S'#39') then begin'
      '    for select pk.codigo_produto from produtos_kit pk'
      
        '    where pk.codigo_kit = :cod_produto        into        :cod_p' +
        'roduto        do'
      
        '    execute procedure altera_estoque(:cod_produto, :cod_cor, :q_' +
        'rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q_8, :q_u' +
        'nica, :multiplicador);'
      '    end'
      '    else'
      
        '    execute procedure altera_estoque(:cod_produto, :cod_cor, :q_' +
        'rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q_8, :q_u' +
        'nica, :multiplicador);'
      '    end   suspend; end')
    TabOrder = 146
    WordWrap = False
  end
  object versao147: TMemo
    Left = 153
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_CORES_KIT_ID'
      '^'
      'CREATE TABLE CORES_KIT ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_KIT INTEGER,'
      '    CODIGO_COR INTEGER)'
      '^'
      'alter table CORES_KIT'
      'add constraint PK_CORES_KIT'
      'primary key (CODIGO)'
      '^'
      'alter table CORES_KIT'
      'add constraint FK_CORES_KIT_2'
      'foreign key (CODIGO_KIT)'
      'references CORES(CODIGO)'
      '^'
      'alter table CORES_KIT'
      'add constraint FK_CORES_KIT_1'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      '^'
      'CREATE TRIGGER CORES_KIT_BI FOR CORES_KIT'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CORES_KIT_ID,1);'
      'END'
      '^'
      'ALTER TABLE CORES'
      'ADD KIT CHAR(1)'
      '^')
    TabOrder = 147
    WordWrap = False
  end
  object versao148: TMemo
    Left = 177
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer,'
      '    multiplicador integer)'
      'as'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'declare variable teste varchar(10);'
      'declare variable prokit char(1);'
      'declare variable corkit char(1);'
      'begin'
      
        '  for select i.cod_produto, i.cod_cor, ci.qtd_rn, ci.qtd_p, ci.q' +
        'td_m, ci.qtd_g, ci.qtd_1, ci.qtd_2, ci.qtd_3,'
      
        '             ci.qtd_4, ci.qtd_6, ci.qtd_8, ci.qtd_unica, pro.kit' +
        ', cor.kit'
      '      from conferencia_itens ci'
      
        '      inner join itens i               on ci.codigo_item = i.cod' +
        'igo'
      
        '      inner join pedidos p             on p.codigo = i.cod_pedid' +
        'o'
      
        '      inner join produtos pro          on pro.codigo = i.cod_pro' +
        'duto'
      '      inner join cores cor             on cor.codigo = i.cod_cor'
      '  where (p.codigo = :codped)'
      '  order by i.cod_produto, i.cod_cor'
      '  into'
      
        '  :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2, :' +
        'q_3, :q_4, :q_6, :q_8, :q_unica, :prokit, :corkit   do   begin'
      ''
      '    if (:prokit = '#39'S'#39') then begin'
      '       for select pk.codigo_produto from produtos_kit pk'
      '       where pk.codigo_kit = :cod_produto'
      '       into'
      '         :cod_produto'
      '       do begin'
      '         if (:corkit = '#39'S'#39') then begin'
      '            for select ck.codigo_cor from cores_kit ck'
      '              where ck.codigo_kit = :cod_cor'
      '            into'
      '              :cod_cor'
      '            do'
      
        '              execute procedure altera_estoque(:cod_produto, :co' +
        'd_cor, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, ' +
        ':q_8, :q_unica, :multiplicador);'
      '         end'
      '         else'
      
        '            execute procedure altera_estoque(:cod_produto, :cod_' +
        'cor, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q' +
        '_8, :q_unica, :multiplicador);'
      ''
      '      end'
      '    end'
      '    else'
      
        '      execute procedure altera_estoque(:cod_produto, :cod_cor, :' +
        'q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q_8, :q' +
        '_unica, :multiplicador);'
      '    end'
      '  suspend;'
      'end'
      '^')
    TabOrder = 148
    WordWrap = False
  end
  object versao149: TMemo
    Left = 201
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE FORMAS_PGTO'
      'ADD PERC_COMISSAO NUMERIC(15,2)'
      '^')
    TabOrder = 149
    WordWrap = False
  end
  object versao150: TMemo
    Left = 225
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PEDIDOS'
      'ADD PESO NUMERIC(15,2)'
      '^'
      'ALTER TABLE PEDIDOS'
      'ADD VOLUMES INTEGER'
      '^')
    TabOrder = 150
    WordWrap = False
  end
  object versao151: TMemo
    Left = 249
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ENDERECOS ALTER COMPLEMENTO TYPE VARCHAR(200)'
      '^')
    TabOrder = 151
    WordWrap = False
  end
  object versao152: TMemo
    Left = 273
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      
        'ALTER TABLE MATERIA_FORNECEDOR ALTER CODIGO_MATERIA_FORNECEDOR T' +
        'YPE VARCHAR(40)'
      '^')
    TabOrder = 152
    WordWrap = False
  end
  object versao153: TMemo
    Left = 297
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS'
      'ADD PESO NUMERIC(15,3)'
      '^'
      'CREATE GENERATOR GEN_PEDIDOS_LOJA_ID'
      '^')
    TabOrder = 153
    WordWrap = False
  end
  object versao154: TMemo
    Left = 322
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_CONTAS_BANCO_ID'
      '^'
      'CREATE TABLE CONTAS_BANCO ('
      '    CODIGO INTEGER NOT NULL,'
      '    BANCO VARCHAR(60),'
      '    TITULAR VARCHAR(60),'
      '    AGENCIA VARCHAR(8),'
      '    NUMERO_CONTA VARCHAR(10))'
      '^'
      'alter table CONTAS_BANCO'
      'add constraint PK_CONTAS_BANCO'
      'primary key (CODIGO)'
      '^'
      'CREATE TRIGGER CONTAS_BANCO_BI FOR CONTAS_BANCO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(new.codigo = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CONTAS_BANCO_ID,1);'
      'END'
      '^'
      'ALTER TABLE CONTAS_PAGAR'
      'ADD COD_CONTA_BANCO SMALLINT'
      '^'
      'alter table CONTAS_PAGAR'
      'add constraint FK_CONTAS_PAGAR_2'
      'foreign key (COD_CONTA_BANCO)'
      'references CONTAS_BANCO(CODIGO)'
      '^'
      'CREATE PROCEDURE QTD_PARCELAS_CONTA ('
      '    codigo_conta integer)'
      'returns ('
      '    qtd_parcelas integer)'
      'as'
      'begin'
      '  for select count(codigo) from parcelas'
      '    where parcelas.codigo_conta = :codigo_conta'
      '  into'
      '    :qtd_parcelas'
      '  do begin'
      '  end'
      '  suspend;'
      'end'
      '^'
      'CREATE  PROCEDURE EFETUA_DEBITO ('
      '    data_corrente date)'
      'as'
      'declare variable vencimento date;'
      'declare variable codigo_conta integer;'
      'declare variable parcela_atual integer;'
      'declare variable total_parcelas integer;'
      'declare variable codigo_parcela integer;'
      'begin'
      
        '  for select par.codigo, par.dt_vencimento, par.num_parcela, par' +
        '.codigo_conta from parcelas par'
      '    left join contas_pagar cp on cp.codigo = par.codigo_conta'
      
        '  where (cp.status in ('#39'A'#39','#39'P'#39')) and (cp.cod_conta_banco > 0) an' +
        'd'
      
        '  (cast(lpad(EXTRACT(DAY FROM par.dt_vencimento), 2, '#39'0'#39') || '#39'.'#39 +
        ' || lpad(EXTRACT(MONTH FROM par.dt_vencimento), 2, '#39'0'#39') || '#39'.'#39' |' +
        '| EXTRACT(YEAR FROM par.dt_vencimento) as date) = :data_corrente' +
        ')'
      '  into'
      '    :codigo_parcela, :vencimento, :parcela_atual, :codigo_conta'
      '  do'
      '  begin'
      
        '      UPDATE parcelas set parcelas.dt_pagamento = parcelas.dt_ve' +
        'ncimento, parcelas.status = '#39'Q'#39','
      
        '                          parcelas.desc_status = '#39'QUITADA'#39', parc' +
        'elas.valor_pago = parcelas.valor'
      '      where parcelas.codigo = :codigo_parcela;'
      ''
      '      select qtd_parcelas from QTD_PARCELAS_CONTA(:codigo_conta)'
      '      into'
      '        :total_parcelas;'
      ''
      '      if (:parcela_atual = :total_parcelas) then'
      '      begin'
      
        '        UPDATE contas_pagar cpg set cpg.status = '#39'Q'#39', cpg.desc_s' +
        'tatus = '#39'QUITADA'#39
      '        where cpg.codigo = :codigo_conta;'
      '      end'
      '      else'
      '      begin'
      
        '        UPDATE contas_pagar cpg set cpg.status = '#39'P'#39', cpg.desc_s' +
        'tatus = '#39'PARCIAL'#39
      '        where cpg.codigo = :codigo_conta;'
      '      end'
      '  end'
      '  suspend;'
      'end')
    TabOrder = 154
    WordWrap = False
  end
  object versao155: TMemo
    Left = 346
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_LOTE_NFCE'
      '^'
      'CREATE GENERATOR GEN_NRNOTA_NFCE'
      '^'
      'CREATE GENERATOR GEN_NFCE_ID'
      '^'
      'CREATE TABLE NFCE ('
      '    CODIGO          INTEGER NOT NULL,'
      '    NR_NOTA         INTEGER,'
      '    CODIGO_PEDIDO   INTEGER,'
      '    SERIE           CHAR(1),'
      '    CHAVE           VARCHAR(44),'
      '    PROTOCOLO       VARCHAR(15),'
      '    DH_RECEBIMENTO  TIMESTAMP,'
      '    STATUS          CHAR(3),'
      '    MOTIVO          VARCHAR(150),'
      '    JUSTIFICATIVA   VARCHAR(100),'
      '    XML             BLOB SUB_TYPE 0 SEGMENT SIZE 80'
      ')'
      '^'
      'ALTER TABLE NFCE ADD CONSTRAINT PK_NFCE PRIMARY KEY (CODIGO)'
      '^'
      
        'ALTER TABLE NFCE ADD CONSTRAINT FK_NFCE_1 FOREIGN KEY (CODIGO_PE' +
        'DIDO) REFERENCES PEDIDOS (CODIGO)'
      '^'
      'CREATE TRIGGER NFCE_BI FOR NFCE'
      'ACTIVE BEFORE INSERT POSITION 0'
      
        'AS BEGIN   IF ((NEW.CODIGO IS NULL) or (new.codigo = 0)) THEN   ' +
        '  NEW.CODIGO = GEN_ID(GEN_NFCE_ID,1); END'
      '^')
    TabOrder = 155
    WordWrap = False
  end
  object versao156: TMemo
    Left = 370
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE PARAMETROS_NFCE ('
      '    CODIGO                INTEGER NOT NULL,'
      '    FORMA_EMISSAO         INTEGER,'
      '    INTERVALO_TENTATIVAS  SMALLINT,'
      '    TENTATIVAS            SMALLINT,'
      '    VERSAO_DF             SMALLINT,'
      '    ID_TOKEN              VARCHAR(10),'
      '    TOKEN                 VARCHAR(100),'
      '    CERTIFICADO           VARCHAR(20),'
      '    SENHA                 VARCHAR(20),'
      '    VISUALIZA_IMPRESSAO   CHAR(1),'
      '    VIA_CONSUMIDOR        CHAR(1),'
      '    IMPRIME_ITENS         CHAR(1),'
      '    AMBIENTE              CHAR(1))'
      '^'
      
        'ALTER TABLE PARAMETROS_NFCE ADD CONSTRAINT PK_PARAMETROS_NFCE PR' +
        'IMARY KEY (CODIGO)'
      '^')
    TabOrder = 156
    WordWrap = False
  end
  object versao157: TMemo
    Left = 394
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_MOVIMENTOS_ID'
      '^'
      'CREATE TABLE MOVIMENTOS ('
      '    CODIGO         INTEGER NOT NULL,'
      '    TIPO_MOEDA     INTEGER,'
      '    CODIGO_PEDIDO  INTEGER,'
      '    DATA           TIMESTAMP,'
      '    VALOR_PAGO     NUMERIC(15,2)'
      ')'
      '^'
      
        'ALTER TABLE MOVIMENTOS ADD CONSTRAINT PK_MOVIMENTOS PRIMARY KEY ' +
        '(CODIGO);'
      '^'
      
        'ALTER TABLE MOVIMENTOS ADD CONSTRAINT FK_MOVIMENTOS_2 FOREIGN KE' +
        'Y (CODIGO_PEDIDO) REFERENCES PEDIDOS (CODIGO)'
      '^'
      'CREATE TRIGGER MOVIMENTOS_BI FOR MOVIMENTOS'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0))THEN'
      '    NEW.CODIGO = GEN_ID(GEN_MOVIMENTOS_ID,1);'
      'END'
      '^')
    TabOrder = 157
    WordWrap = False
  end
  object versao158: TMemo
    Left = 418
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_ORDEM_SERVICO_ID'
      '^'
      'CREATE TABLE ORDEM_SERVICO ('
      '    CODIGO INTEGER NOT NULL,'
      '    NUMERO INTEGER,'
      '    CODIGO_PRODUTO INTEGER,'
      '    CODIGO_COR INTEGER,'
      '    CODIGO_TAMANHO INTEGER,'
      '    QUANTIDADE INTEGER)'
      '^'
      'alter table ORDEM_SERVICO'
      'add constraint PK_ORDEM_SERVICO'
      'primary key (CODIGO)'
      '^'
      'CREATE TRIGGER ORDEM_SERVICO_BI FOR ORDEM_SERVICO'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ORDEM_SERVICO_ID,1);'
      'END'
      '^'
      'alter table ORDEM_SERVICO'
      'add constraint FK_ORDEM_SERVICO_1'
      'foreign key (CODIGO_PRODUTO)'
      'references PRODUTOS(CODIGO)'
      '^'
      'alter table ORDEM_SERVICO'
      'add constraint FK_ORDEM_SERVICO_2'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      '^'
      'alter table ORDEM_SERVICO'
      'add constraint FK_ORDEM_SERVICO_3'
      'foreign key (CODIGO_TAMANHO)'
      'references TAMANHOS(CODIGO)'
      '^')
    TabOrder = 158
    WordWrap = False
  end
  object versao159: TMemo
    Left = 441
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE TABLE IBPT ('
      '    CODIGO                  INTEGER NOT NULL,'
      '    NCM_IBPT                VARCHAR(10),'
      '    EX_IBPT                 VARCHAR(3),'
      '    TABELA_IBPT             VARCHAR(3),'
      '    ALIQNACIONAL_IBPT       NUMERIC(15,2),'
      '    ALIQINTERNACIONAL_IBPT  NUMERIC(15,2)'
      ')'
      '^'
      'ALTER TABLE IBPT ADD CONSTRAINT PK_IBPT PRIMARY KEY (CODIGO)'
      '^'
      'ALTER TABLE PRODUTOS'
      'ADD CODIGO_IBPT INTEGER'
      '^'
      'alter table PRODUTOS'
      'add constraint FK_PRODUTOS_1'
      'foreign key (CODIGO_IBPT)'
      'references IBPT(CODIGO)'
      '^')
    TabOrder = 159
    WordWrap = False
  end
  object versao160: TMemo
    Left = 465
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ORDEM_SERVICO'
      'ADD IMPRESSO CHAR(1)'
      '^')
    TabOrder = 160
    WordWrap = False
  end
  object versao161: TMemo
    Left = 489
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_CAIXA_ID'
      '^'
      'CREATE TABLE CAIXA ('
      '    CODIGO            INTEGER NOT NULL,'
      '    DATA_ABERTURA     TIMESTAMP,'
      '    VALOR_ABERTURA    NUMERIC(15,2),'
      '    DATA_FECHAMENTO   TIMESTAMP,'
      '    VALOR_FECHAMENTO  NUMERIC(15,2)'
      ')'
      '^'
      'ALTER TABLE CAIXA ADD CONSTRAINT PK_CAIXA PRIMARY KEY (CODIGO)'
      '^'
      'CREATE TRIGGER CAIXA_BI FOR CAIXA'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL) or (NEW.CODIGO = 0))THEN'
      '    NEW.CODIGO = GEN_ID(GEN_CAIXA_ID,1);'
      'END'
      '^'
      'ALTER TABLE MOVIMENTOS'
      'ADD CODIGO_CAIXA INTEGER'
      '^'
      'alter table MOVIMENTOS'
      'add constraint FK_MOVIMENTOS_1'
      'foreign key (CODIGO_CAIXA)'
      'references CAIXA(CODIGO)'
      '^')
    TabOrder = 161
    WordWrap = False
  end
  object versao162: TMemo
    Left = 513
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'CREATE GENERATOR GEN_ENTRADA_SAIDA_MOEDA_ID'
      '^'
      'CREATE TABLE ENTRADA_SAIDA_MOEDA ('
      '    CODIGO INTEGER NOT NULL,'
      '    CODIGO_CAIXA INTEGER,'
      '    TIPO CHAR(1),'
      '    VALOR NUMERIC(15,2),'
      '    DESCRICAO VARCHAR(150),'
      '    HORA TIME,'
      '    TIPO_MOEDA SMALLINT)'
      '^'
      'alter table ENTRADA_SAIDA_MOEDA'
      'add constraint PK_ENTRADA_SAIDA_MOEDA'
      'primary key (CODIGO)'
      '^'
      'alter table ENTRADA_SAIDA_MOEDA'
      'add constraint FK_ENTRADA_SAIDA_MOEDA_1'
      'foreign key (CODIGO_CAIXA)'
      'references CAIXA(CODIGO)'
      '^'
      'CREATE TRIGGER ENTRADA_SAIDA_MOEDA_BI FOR ENTRADA_SAIDA_MOEDA'
      'ACTIVE BEFORE INSERT POSITION 0'
      'AS'
      'BEGIN'
      '  IF ((NEW.CODIGO IS NULL)or(NEW.CODIGO = 0)) THEN'
      '    NEW.CODIGO = GEN_ID(GEN_ENTRADA_SAIDA_MOEDA_ID,1);'
      'END'
      '^')
    TabOrder = 162
    WordWrap = False
  end
  object versao163: TMemo
    Left = 537
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer,'
      '    multiplicador integer)'
      'as'
      'declare variable cod_cor_kit integer;'
      'declare variable cod_produto_kit integer;'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'declare variable teste varchar(10);'
      'declare variable prokit char(1);'
      'declare variable corkit char(1);'
      'begin'
      
        'for select i.cod_produto, i.cod_cor, ci.qtd_rn, ci.qtd_p, ci.qtd' +
        '_m, ci.qtd_g, ci.qtd_1, ci.qtd_2, ci.qtd_3,'
      
        '           ci.qtd_4, ci.qtd_6, ci.qtd_8, ci.qtd_unica, pro.kit, ' +
        'cor.kit'
      '    from conferencia_itens ci'
      
        '      inner join itens i               on ci.codigo_item = i.cod' +
        'igo'
      
        '      inner join pedidos p             on p.codigo = i.cod_pedid' +
        'o'
      
        '      inner join produtos pro          on pro.codigo = i.cod_pro' +
        'duto'
      '      inner join cores cor             on cor.codigo = i.cod_cor'
      '    where (p.codigo = :codped)'
      '    order by i.cod_produto, i.cod_cor   into'
      
        '    :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2,' +
        ' :q_3, :q_4, :q_6, :q_8, :q_unica, :prokit, :corkit   do'
      '    begin'
      '      if (:prokit = '#39'S'#39') then'
      '      begin'
      '        for select pk.codigo_produto from produtos_kit pk'
      '        where pk.codigo_kit = :cod_produto'
      '          into          :cod_produto_kit        do'
      '        begin'
      '          if (:corkit = '#39'S'#39') then'
      '          begin'
      '            for select ck.codigo_cor from cores_kit ck'
      '            where ck.codigo_kit = :cod_cor'
      '              into'
      '            :cod_cor_kit             do'
      
        '              execute procedure altera_estoque(:cod_produto_kit,' +
        ' :cod_cor_kit, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4' +
        ', :q_6, :q_8, :q_unica, :multiplicador);'
      '          end'
      '          else'
      
        '            execute procedure altera_estoque(:cod_produto_kit, :' +
        'cod_cor, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6' +
        ', :q_8, :q_unica, :multiplicador);'
      '        end'
      '      end'
      '      else'
      
        '        execute procedure altera_estoque(:cod_produto, :cod_cor,' +
        ' :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q_8, ' +
        ':q_unica, :multiplicador);'
      '    end'
      'suspend;'
      'end'
      '^')
    TabOrder = 163
    WordWrap = False
  end
  object versao164: TMemo
    Left = 561
    Top = 196
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE ITENS'
      'ADD QTD_10 INTEGER'
      '^'
      'ALTER TABLE ITENS'
      'ADD QTD_12 INTEGER'
      '^'
      'ALTER TABLE ITENS'
      'ADD QTD_14 INTEGER'
      '^'
      'ALTER TABLE CONFERENCIA_ITENS'
      'ADD QTD_10 INTEGER'
      '^'
      'ALTER TABLE CONFERENCIA_ITENS'
      'ADD QTD_12 INTEGER'
      '^'
      'ALTER TABLE CONFERENCIA_ITENS'
      'ADD QTD_14 INTEGER'
      '^')
    TabOrder = 164
    WordWrap = False
  end
  object versao165: TMemo
    Left = 9
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE ALTERA_ESTOQUE ('
      '    cod_produto integer,'
      '    cod_cor integer,'
      '    qtd_rn integer,'
      '    qtd_p integer,'
      '    qtd_m integer,'
      '    qtd_g integer,'
      '    qtd_1 integer,'
      '    qtd_2 integer,'
      '    qtd_3 integer,'
      '    qtd_4 integer,'
      '    qtd_6 integer,'
      '    qtd_8 integer,'
      '    qtd_10 integer,'
      '    qtd_12 integer,'
      '    qtd_14 integer,'
      '    qtd_unica integer,'
      '    multiplicador integer)'
      'as'
      'begin'
      
        '  if (:qtd_rn > 0) then begin   UPDATE ESTOQUE est set est.quant' +
        'idade = (est.quantidade + (:qtd_rn * :multiplicador))   where es' +
        't.codigo_produto = :cod_produto and est.codigo_cor = :cod_cor an' +
        'd est.codigo_tamanho = 1;   end'
      
        '  if (:qtd_p > 0) then begin    UPDATE ESTOQUE est set est.quant' +
        'idade = (est.quantidade + (:qtd_p * :multiplicador))    where es' +
        't.codigo_produto = :cod_produto and est.codigo_cor = :cod_cor an' +
        'd est.codigo_tamanho = 2;     end'
      
        '  if (:qtd_m > 0) then begin    UPDATE ESTOQUE est set est.quant' +
        'idade = (est.quantidade + (:qtd_m * :multiplicador))    where es' +
        't.codigo_produto = :cod_produto and est.codigo_cor = :cod_cor an' +
        'd est.codigo_tamanho = 3;     end'
      
        '  if (:qtd_g > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_g * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 4;     end'
      
        '  if (:qtd_1 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_1 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 5;     end'
      
        '  if (:qtd_2 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_2 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 6;     end'
      
        '  if (:qtd_3 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_3 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 7;     end'
      
        '  if (:qtd_4 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_4 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 8 ;     end'
      
        '  if (:qtd_6 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_6 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 9;     end'
      
        '  if (:qtd_8 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_8 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 10 ;     end'
      ''
      '  if (:qtd_10 > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_10 * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 16 ;     end'
      '  if (:qtd_12 > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_12 * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 17 ;     end'
      '  if (:qtd_14 > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_14 * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 18 ;     end'
      '  if (:qtd_unica > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_unica * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 11;     end'
      'end'#11
      ''
      ''
      ''
      '^'
      'ALTER PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer,'
      '    multiplicador integer)'
      'as'
      'declare variable q_14 integer;'
      'declare variable q_12 integer;'
      'declare variable q_10 integer;'
      'declare variable cod_cor_kit integer;'
      'declare variable cod_produto_kit integer;'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'declare variable teste varchar(10);'
      'declare variable prokit char(1);'
      'declare variable corkit char(1);'
      
        'begin for select i.cod_produto, i.cod_cor, ci.qtd_rn, ci.qtd_p, ' +
        'ci.qtd_m, ci.qtd_g, ci.qtd_1, ci.qtd_2, ci.qtd_3,'
      
        'ci.qtd_4, ci.qtd_6, ci.qtd_8, ci.qtd_10, ci.qtd_12, ci.qtd_14, c' +
        'i.qtd_unica, pro.kit, cor.kit     from conferencia_itens ci'
      
        'inner join itens i               on ci.codigo_item = i.codigo   ' +
        '    inner join pedidos p             on p.codigo = i.cod_pedido'
      
        'inner join produtos pro          on pro.codigo = i.cod_produto  ' +
        '     inner join cores cor             on cor.codigo = i.cod_cor'
      ''
      'where (p.codigo = :codped)     order by i.cod_produto, i.cod_cor'
      
        'into     :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, ' +
        ':q_2, :q_3, :q_4, :q_6, :q_8, :q_10, :q_12, :q_14, :q_unica, :pr' +
        'okit, :corkit   do'
      'begin'
      '  if (:prokit = '#39'S'#39') then       begin'
      '    for select pk.codigo_produto from produtos_kit pk'
      '    where pk.codigo_kit = :cod_produto'
      '    into          :cod_produto_kit        do'
      '    begin           if (:corkit = '#39'S'#39') then'
      '      begin'
      '      for select ck.codigo_cor from cores_kit ck'
      
        '      where ck.codigo_kit = :cod_cor               into         ' +
        '    :cod_cor_kit             do'
      
        '         execute procedure altera_estoque(:cod_produto_kit, :cod' +
        '_cor_kit, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_' +
        '6, :q_8, :q_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '         end'
      '         else'
      
        '          execute procedure altera_estoque(:cod_produto_kit, :co' +
        'd_cor, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, ' +
        ':q_8, :q_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '          end'
      '          end'
      '          else'
      
        '            execute procedure altera_estoque(:cod_produto, :cod_' +
        'cor, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q' +
        '_8, :q_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '          end '
      ' end'
      '^')
    TabOrder = 165
    WordWrap = False
  end
  object versao166: TMemo
    Left = 32
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE ATUALIZA_ESTOQUE '
      'as'
      'declare variable q_14 integer;'
      'declare variable q_12 integer;'
      'declare variable q_10 integer;'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'begin'
      ''
      '  for select i.cod_produto, i.cod_cor,'
      
        '       sum(i.qtd_rn) RN, sum(i.qtd_p) P, sum(i.qtd_m) M, sum(i.q' +
        'td_g) G, sum(i.qtd_1) , sum(i.qtd_2) , sum(i.qtd_3),'
      
        '       sum(i.qtd_4) , sum(i.qtd_6) , sum(i.qtd_8) , sum(i.qtd_un' +
        'ica) UNICA  from itens i'
      ''
      '    left join pedidos p             on p.codigo = i.cod_pedido'
      
        '    left join conferencia_pedido cp on cp.codigo_pedido = p.codi' +
        'go'
      
        '    where not (p.cancelado = '#39'S'#39') and not (cp.codigo is null) an' +
        'd (cp.fim > '#39'17.02.2015'#39')'
      '    group by 1, 2'
      '    order by i.cod_produto, i.cod_cor'
      '  into'
      
        '    :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2,' +
        ' :q_3, :q_4, :q_6, :q_8, :q_unica'
      '  do'
      '  begin'
      '    if (:q_rn > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_rn)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 1;'
      '    end'
      ''
      '    if (:q_p > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_p)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 2;'
      '    end'
      '    if (:q_m > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_m)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 3;'
      '    end'
      '    if (:q_g > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_g)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 4;'
      '    end'
      '    if (:q_1 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_1)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 5;'
      '    end'
      '    if (:q_2 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_2)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 6;'
      '    end'
      '    if (:q_3 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_3)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 7;'
      '    end'
      '    if (:q_4 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_4)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 8 ;'
      '    end'
      '    if (:q_6 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_6)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 9;'
      '    end'
      '    if (:q_8 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_8)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 10 ;'
      '    end'
      '    if (:q_10 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_10)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 16 ;'
      '    end'
      '    if (:q_12 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_12)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 17 ;'
      '    end'
      '    if (:q_14 > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_14)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 18 ;'
      '    end'
      '    if (:q_unica > 0) then begin'
      
        '        UPDATE ESTOQUE est set est.quantidade = (est.quantidade ' +
        '- :q_unica)'
      
        '        where est.codigo_produto = :cod_produto and est.codigo_c' +
        'or = :cod_cor and est.codigo_tamanho = 11;'
      '    end'
      ''
      '  end'
      ''
      '  suspend;'
      'end'
      '^'
      'ALTER PROCEDURE CALCULA_SALDO ('
      '    codigo_item integer)'
      'returns ('
      '    qtd_14 integer,'
      '    qtd_12 integer,'
      '    qtd_10 integer,'
      '    qtd_rn integer,'
      '    qtd_p integer,'
      '    qtd_m integer,'
      '    qtd_g integer,'
      '    qtd_1 integer,'
      '    qtd_2 integer,'
      '    qtd_3 integer,'
      '    qtd_4 integer,'
      '    qtd_6 integer,'
      '    qtd_8 integer,'
      '    qtd_unica integer)'
      'as'
      
        'begin   for select CAST( (i.qtd_rn - iif(ci.qtd_rn is null, 0, c' +
        'i.qtd_rn)) as integer) qtd_rn,'
      
        '                   CAST( (i.qtd_p - iif(ci.qtd_p is null, 0, ci.' +
        'qtd_p))  as integer) qtd_p,'
      
        '                   CAST( (i.qtd_m - iif(ci.qtd_m is null, 0, ci.' +
        'qtd_m))  as integer) qtd_m,'
      
        '                   CAST( (i.qtd_g - iif(ci.qtd_g is null, 0, ci.' +
        'qtd_g))  as integer) qtd_g,'
      
        '                   CAST( (i.qtd_1 - iif(ci.qtd_1 is null, 0, ci.' +
        'qtd_1))  as integer) qtd_1,'
      
        '                   CAST( (i.qtd_2 - iif(ci.qtd_2 is null, 0, ci.' +
        'qtd_2))  as integer) qtd_2,'
      
        '                   CAST( (i.qtd_3 - iif(ci.qtd_3 is null, 0, ci.' +
        'qtd_3))  as integer) qtd_3,'
      
        '                   CAST( (i.qtd_4 - iif(ci.qtd_4 is null, 0, ci.' +
        'qtd_4))  as integer) qtd_4,'
      
        '                   CAST( (i.qtd_6 - iif(ci.qtd_6 is null, 0, ci.' +
        'qtd_6))  as integer) qtd_6,'
      
        '                   CAST( (i.qtd_8 - iif(ci.qtd_8 is null, 0, ci.' +
        'qtd_8))  as integer) qtd_8,'
      
        '                   CAST( (i.qtd_10 - iif(ci.qtd_10 is null, 0, c' +
        'i.qtd_10))  as integer) qtd_10,'
      
        '                   CAST( (i.qtd_12 - iif(ci.qtd_12 is null, 0, c' +
        'i.qtd_12))  as integer) qtd_12,'
      
        '                   CAST( (i.qtd_14 - iif(ci.qtd_14 is null, 0, c' +
        'i.qtd_14))  as integer) qtd_12,'
      
        '                   CAST( (trunc(i.qtd_unica) - iif(ci.qtd_unica ' +
        'is null, 0, ci.qtd_unica))  as float) qtd_unica               fr' +
        'om itens i'
      '   left join conferencia_itens ci on ci.codigo_item = i.codigo'
      '   where i.codigo = :codigo_item'
      
        '   into :qtd_rn, :qtd_p, :qtd_m, :qtd_g, :qtd_1, :qtd_2,:qtd_3, ' +
        ':qtd_4, :qtd_6, :qtd_8, :qtd_10, :qtd_12, :qtd_14, :qtd_unica'
      '   do begin'
      '   end'
      '   suspend;'
      '   end'
      '^'
      'ALTER PROCEDURE ESTOQUE_POR_REFERENCIA ('
      '    cod_produto integer,'
      '    cod_cor integer,'
      '    cor_pai char(1))'
      'returns ('
      '    q_14 integer,'
      '    q_12 integer,'
      '    q_10 integer,'
      '    q_rn integer,'
      '    q_p integer,'
      '    q_m integer,'
      '    q_g integer,'
      '    q_1 integer,'
      '    q_2 integer,'
      '    q_3 integer,'
      '    q_4 integer,'
      '    q_6 integer,'
      '    q_8 integer,'
      '    q_unica integer)'
      'as'
      'declare variable quantidade integer;'
      'declare variable cod_tamanho integer;'
      
        'begin   q_rn = 0;   q_p  = 0;   q_m  = 0;   q_g  = 0;    q_1  = ' +
        '0;    q_2  = 0;    q_3  = 0;'
      
        '        q_4  = 0;   q_6  = 0;   q_8  = 0;   q_10  = 0;   q_12  =' +
        ' 0;   q_14  = 0;   q_unica  = 0;'
      '    if (:cor_pai = '#39'S'#39') then begin'
      
        '      FOR SELECT SUM( CAST(E.QUANTIDADE as INTEGER)) quantidade,' +
        ' E.CODIGO_TAMANHO FROM ESTOQUE E'
      
        '        left join cores cor       on cor.codigo = e.codigo_cor  ' +
        '   left join cores_filhas cf on cf.codigo_cor_pai = cor.codigo'
      
        '        WHERE E.CODIGO_PRODUTO = :cod_produto     AND cf.codigo_' +
        'cor_pai = :cod_cor     group by 2'
      '        INTO       :quantidade, :cod_tamanho     DO   BEGIN'
      ''
      '        if (:cod_tamanho = 1) then      q_rn    = :quantidade;'
      
        '        else if (:cod_tamanho = 2) then      q_p     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 3) then      q_m     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 4) then      q_g     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 5) then      q_1     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 6) then      q_2     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 7) then      q_3     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 8) then      q_4     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 9) then      q_6     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 10) then     q_8     = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 11) then     q_unica = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 16) then     q_10    = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 17) then     q_12    = :quantida' +
        'de;'
      
        '        else if (:cod_tamanho = 18) then     q_14    = :quantida' +
        'de;'
      '        END'
      '        end     else begin'
      
        '          FOR SELECT E.QUANTIDADE, E.CODIGO_TAMANHO FROM ESTOQUE' +
        ' E'
      
        '          WHERE E.CODIGO_PRODUTO = :cod_produto        AND E.COD' +
        'IGO_COR = :cod_cor'
      '          INTO     :quantidade, :cod_tamanho'
      '        DO   BEGIN'
      '          if (:cod_tamanho = 1) then      q_rn    = :quantidade;'
      
        '          else if (:cod_tamanho = 2) then      q_p     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 3) then      q_m     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 4) then      q_g     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 5) then      q_1     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 6) then      q_2     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 7) then      q_3     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 8) then      q_4     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 9) then      q_6     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 10) then     q_8     = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 11) then     q_unica = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 16) then     q_10    = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 17) then     q_12    = :quanti' +
        'dade;'
      
        '          else if (:cod_tamanho = 18) then     q_14    = :quanti' +
        'dade;'
      '        END   end     suspend;   end'
      '^')
    TabOrder = 166
    WordWrap = False
  end
  object versao167: TMemo
    Left = 57
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE PERCENT_ESTOQUE_DISPONIVEL ('
      '    codigo_pedido integer)'
      'returns ('
      '    q_caixas integer,'
      '    percent_disponivel numeric(15,2))'
      'as'
      'declare variable q_14 integer;'
      'declare variable q_12 integer;'
      'declare variable q_10 integer;'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica numeric(15,2);'
      'declare variable codigo_produto integer;'
      'declare variable codigo_cor integer;'
      'declare variable q_estoque numeric(15,2);'
      'declare variable percent_negativa numeric(15,2);'
      'declare variable q_negativa numeric(15,2);'
      'declare variable q_total numeric(15,2);'
      'declare variable tipo_produto integer;'
      'declare variable peso numeric(15,2);'
      'declare variable peso_total numeric(15,2);'
      'begin'
      '  q_negativa = 0;'
      '  q_total    = 0;'
      '  peso_total = 0;'
      '  q_caixas   = 0;'
      '  percent_negativa = 0;'
      ''
      
        '  for select i.qtd_rn, i.qtd_p, i.qtd_m, i.qtd_g, i.qtd_1, i.qtd' +
        '_2, i.qtd_3, i.qtd_4, i.qtd_6, i.qtd_8, i.qtd_10, i.qtd_12, i.qt' +
        'd_14, i.qtd_unica,'
      '  i.cod_produto, i.cod_cor, pro.cod_tipo, pro.peso_liq'
      '   from itens i'
      '   left join produtos pro on pro.codigo = i.cod_produto'
      '   where i.cod_pedido = :codigo_pedido'
      '  into'
      
        '    :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2, :q_3, :q_4, :q_6, :q_8,' +
        ' :q_10, :q_12, :q_14, :q_unica, :codigo_produto, :codigo_cor, :t' +
        'ipo_produto, :peso'
      '  do'
      '  begin'
      ''
      '    if ((:tipo_produto = 2) and (:codigo_cor in (55,66))) then'
      '      codigo_cor = 0;'
      ''
      '    if (:q_rn > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 1 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_rn;'
      '      peso_total = peso_total + (:q_rn * :peso);'
      ''
      '      if (:q_rn > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_rn - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_p > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 2 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_p;'
      '      peso_total = peso_total + (:q_p * :peso);'
      ''
      '      if (:q_p > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_p - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_m > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 3 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_m;'
      '      peso_total = peso_total + (:q_m * :peso);'
      ''
      '      if (:q_m > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_m - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_g > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 4 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_g;'
      '      peso_total = peso_total + (:q_g * :peso);'
      ''
      '      if (:q_g > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_g - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_1 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 5 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_1;'
      '      peso_total = peso_total + (:q_1 * :peso);'
      ''
      '      if (:q_1 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_1 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_2 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 6 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_2;'
      '      peso_total = peso_total + (:q_2 * :peso);'
      ''
      '      if (:q_2 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_2 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_3 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 7 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_3;'
      '      peso_total = peso_total + (:q_3 * :peso);'
      ''
      '      if (:q_3 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_3 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_4 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 8 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_4;'
      '      peso_total = peso_total + (:q_4 * :peso);'
      ''
      '      if (:q_4 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_4 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_6 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 9 AND ((:codigo_co' +
        'r = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_6;'
      '      peso_total = peso_total + (:q_6 * :peso);'
      ''
      '      if (:q_6 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_6 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_8 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 10 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_8;'
      '      peso_total = peso_total + (:q_8 * :peso);'
      ''
      '      if (:q_8 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_8 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_unica > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 11 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_unica;'
      '      peso_total = peso_total + (:q_unica * :peso);'
      ''
      '      if (:q_unica > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_unica - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_10 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 16 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_10;'
      '      peso_total = peso_total + (:q_10 * :peso);'
      ''
      '      if (:q_10 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_10 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_12 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 17 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_12;'
      '      peso_total = peso_total + (:q_12 * :peso);'
      ''
      '      if (:q_12 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_12 - :q_estoque);'
      '      end'
      '    end'
      ''
      '    if (:q_14 > 0) then begin'
      
        '      SELECT SUM(E.QUANTIDADE) FROM ESTOQUE E WHERE E.codigo_pro' +
        'duto = :codigo_produto AND E.codigo_tamanho = 18 AND ((:codigo_c' +
        'or = 0) or (E.codigo_cor = :codigo_cor))'
      '      into :q_estoque;'
      ''
      '      if (:q_estoque is null ) then q_estoque = 0;'
      ''
      '      q_total = :q_total + :q_14;'
      '      peso_total = peso_total + (:q_14 * :peso);'
      ''
      '      if (:q_14 > :q_estoque) then begin'
      '        q_negativa = :q_negativa + (:q_14 - :q_estoque);'
      '      end'
      '    end'
      '  end'
      ''
      '  if (:peso_total > 18) then'
      '    q_caixas = TRUNC(peso_total / 18);'
      ''
      '  if (:q_negativa > 0) then'
      '    percent_negativa = (:q_negativa * 100) / :q_total;'
      ''
      '  percent_disponivel = (100 - :percent_negativa);'
      ''
      '  suspend;'
      ''
      'end'
      '^'
      'ALTER PROCEDURE PREVISAO_ESTOQUE ('
      '    codigo_cor integer,'
      '    codigo_produto integer,'
      '    dt_ini date,'
      '    dt_fim date,'
      '    inclui_nfaturado char(1))'
      'returns ('
      '    dias_14 integer,'
      '    dias_12 integer,'
      '    dias_10 integer,'
      '    data_inicial date,'
      '    dias_rn numeric(15,4),'
      '    dias_p numeric(15,4),'
      '    dias_m numeric(15,4),'
      '    dias_g numeric(15,4),'
      '    dias_1 numeric(15,4),'
      '    dias_2 numeric(15,4),'
      '    dias_3 numeric(15,4),'
      '    dias_4 numeric(15,4),'
      '    dias_6 numeric(15,4),'
      '    dias_8 numeric(15,4),'
      '    dias_unica numeric(15,4))'
      'as'
      'declare variable mes_inicial integer;'
      'declare variable codigo_tamanho integer;'
      'declare variable dias_ativo integer;'
      'declare variable quantidade numeric(15,2);'
      
        'begin   for select SUM(it.qtd_rn), SUM(it.qtd_p), SUM(it.qtd_m),' +
        ' SUM(it.qtd_g), SUM(it.qtd_1), SUM(it.qtd_2), SUM(it.qtd_3),'
      
        '                   SUM(it.qtd_4), SUM(it.qtd_6), SUM(it.qtd_8), ' +
        'SUM(it.qtd_unica), SUM(it.qtd_10), SUM(it.qtd_12), SUM(it.qtd_14' +
        '),  MIN(ped.dt_cadastro)'
      
        '  from itens it        left join pedidos  ped on ped.codigo = it' +
        '.cod_pedido'
      
        '  left join pedidos_faturados pf on pf.codigo_pedido = ped.codig' +
        'o'
      
        '  left join notas_fiscais nf on nf.codigo = pf.codigo_nota_fisca' +
        'l'
      
        '  where it.cod_produto = :codigo_produto and it.cod_cor = :codig' +
        'o_cor and'
      
        '       ( (not (pf.codigo is null) or (ped.despachado = '#39'S'#39') ) or' +
        ' ('#39'S'#39' = :inclui_nfaturado)  )'
      
        '       and not (ped.cancelado = '#39'S'#39') and ped.dt_cadastro between' +
        ' :dt_ini and :dt_fim'
      
        '  into     :dias_rn, :dias_p, :dias_m, :dias_g, :dias_1, :dias_2' +
        ', :dias_3, :dias_4, :dias_6, :dias_8, :dias_unica, :dias_10, :di' +
        'as_12, :dias_14, :data_inicial   do'
      '  begin'
      '    dias_ativo = dt_fim - dt_ini;'
      '  for select e.codigo_tamanho, e.quantidade from estoque e'
      
        '      where e.codigo_produto = :codigo_produto and e.codigo_cor ' +
        '= :codigo_cor      into      :codigo_tamanho, :quantidade      d' +
        'o'
      '  begin'
      '    if (:codigo_tamanho = 1) then begin'
      '      if (dias_rn = 0) then           dias_rn = 999999;'
      '      else begin             dias_rn = dias_rn / dias_ativo;'
      '      dias_rn = :quantidade / dias_rn;'
      '      end'
      '    end'
      '    else if (:codigo_tamanho = 2) then begin'
      '      if (dias_p = 0) then           dias_p = 999999;'
      '      else begin'
      '        dias_p  = dias_p  / dias_ativo;'
      '        dias_p = :quantidade / dias_p;'
      '      end'
      '    end'
      '    else if (:codigo_tamanho = 3) then begin'
      '      if (dias_m = 0) then'
      '        dias_m = 999999;'
      '      else begin'
      '        dias_m = dias_m  / dias_ativo;'
      '        dias_m = :quantidade / dias_m;'
      '      end'
      '    end'
      
        '    else if (:codigo_tamanho = 4) then begin         if (dias_g ' +
        '= 0) then           dias_g = 999999;         else begin'
      
        '    dias_g  = dias_g  / dias_ativo;             dias_g = :quanti' +
        'dade / dias_g;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 5) then begin         if (dias_1 ' +
        '= 0) then           dias_1 = 999999;         else begin'
      
        '    dias_1  = dias_1  / dias_ativo;             dias_1 = :quanti' +
        'dade / dias_1;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 6) then begin         if (dias_2 ' +
        '= 0) then           dias_2 = 999999;         else begin'
      
        '    dias_2  = dias_2  / dias_ativo;             dias_2 = :quanti' +
        'dade / dias_2;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 7) then begin         if (dias_3 ' +
        '= 0) then           dias_3 = 999999;         else begin'
      
        '    dias_3  = dias_3  / dias_ativo;             dias_3 = :quanti' +
        'dade / dias_3;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 8) then begin         if (dias_4 ' +
        '= 0) then           dias_4 = 999999;         else begin'
      
        '    dias_4  = dias_4  / dias_ativo;             dias_4 = :quanti' +
        'dade / dias_4;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 9) then begin         if (dias_6 ' +
        '= 0) then           dias_6 = 999999;         else begin'
      
        '    dias_6  = dias_6  / dias_ativo;             dias_6 = :quanti' +
        'dade / dias_6;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 10) then begin         if (dias_8' +
        ' = 0) then           dias_8 = 999999;         else begin'
      
        '    dias_8  = dias_8  / dias_ativo;             dias_8 = :quanti' +
        'dade / dias_8;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 11) then begin         if (dias_u' +
        'nica = 0) then           dias_unica = 999999;          else begi' +
        'n'
      
        '    dias_unica  = dias_unica  / dias_ativo;             dias_uni' +
        'ca = :quantidade / dias_unica;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 16) then begin         if (dias_1' +
        '0 = 0) then           dias_10 = 999999;         else begin'
      
        '    dias_10  = dias_10  / dias_ativo;             dias_10 = :qua' +
        'ntidade / dias_10;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 17) then begin         if (dias_1' +
        '2 = 0) then           dias_12 = 999999;         else begin'
      
        '    dias_12  = dias_12  / dias_ativo;             dias_12 = :qua' +
        'ntidade / dias_12;         end'
      '    end'
      
        '    else if (:codigo_tamanho = 18) then begin         if (dias_1' +
        '4 = 0) then           dias_14 = 999999;         else begin'
      
        '    dias_14  = dias_14  / dias_ativo;             dias_14 = :qua' +
        'ntidade / dias_14;         end'
      '    end'
      '  end'
      'end'
      'suspend;'
      'end'
      '^'
      'ALTER PROCEDURE PROC_ESTOQUE ('
      '    cod_pro integer,'
      '    cod_cor integer)'
      'returns ('
      '    est_14 numeric(15,2),'
      '    est_12 numeric(15,2),'
      '    est_10 numeric(15,2),'
      '    est_rn numeric(15,2),'
      '    est_p numeric(15,2),'
      '    est_m numeric(15,2),'
      '    est_g numeric(15,2),'
      '    est_1 numeric(15,2),'
      '    est_2 numeric(15,2),'
      '    est_3 numeric(15,2),'
      '    est_4 numeric(15,2),'
      '    est_6 numeric(15,2),'
      '    est_8 numeric(15,2),'
      '    est_unica numeric(15,2))'
      'as'
      'declare variable cod_tam integer;'
      'declare variable quantidade numeric(15,2);'
      'begin'
      '      est_rn = 0;'
      '      est_p = 0;'
      '      est_m = 0;'
      '      est_g = 0;'
      '      est_1 = 0;'
      '      est_2 = 0;'
      '      est_3 = 0;'
      '      est_4 = 0;'
      '      est_6 = 0;'
      '      est_8 = 0;'
      '      est_10 = 0;'
      '      est_12 = 0;'
      '      est_14 = 0;'
      '      est_unica = 0;'
      ''
      '  for select e.codigo_tamanho, e.quantidade from estoque e'
      
        '      where e.codigo_produto = :cod_pro and e.codigo_cor = :cod_' +
        'cor'
      '  into'
      '    :cod_tam, :quantidade'
      '  do'
      '  begin'
      ''
      '         if (:cod_tam = 1) then'
      '      est_rn = :quantidade;'
      '    else if (:cod_tam = 2) then'
      '      est_p = :quantidade;'
      '    else if (:cod_tam = 3) then'
      '      est_m = :quantidade;'
      '    else if (:cod_tam = 4) then'
      '      est_g = :quantidade;'
      '    else if (:cod_tam = 5) then'
      '      est_1 = :quantidade;'
      '    else if (:cod_tam = 6) then'
      '      est_2 = :quantidade;'
      '    else if (:cod_tam = 7) then'
      '      est_3 = :quantidade;'
      '    else if (:cod_tam = 8) then'
      '      est_4 = :quantidade;'
      '    else if (:cod_tam = 9) then'
      '      est_6 = :quantidade;'
      '    else if (:cod_tam = 10) then'
      '      est_8 = :quantidade;'
      '    else if (:cod_tam = 16) then'
      '      est_10 = :quantidade;'
      '    else if (:cod_tam = 17) then'
      '      est_12 = :quantidade;'
      '    else if (:cod_tam = 18) then'
      '      est_14 = :quantidade;'
      '    else if (:cod_tam = 11) then'
      '      est_unica = :quantidade;'
      ''
      '  end'
      '  suspend;'
      'end'
      '^')
    TabOrder = 167
    WordWrap = False
  end
  object versao168: TMemo
    Left = 81
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE CAIXAS'
      'ADD QTD_10 INTEGER'
      '^'
      'ALTER TABLE CAIXAS'
      'ADD QTD_12 INTEGER'
      '^'
      'ALTER TABLE CAIXAS'
      'ADD QTD_14 INTEGER'
      '^')
    TabOrder = 168
    WordWrap = False
  end
  object versao169: TMemo
    Left = 105
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PRODUTOS_KIT'
      'ADD CODIGO_COR INTEGER'
      '^'
      'alter table PRODUTOS_KIT'
      'add constraint FK_PRODUTOS_KIT_3'
      'foreign key (CODIGO_COR)'
      'references CORES(CODIGO)'
      '^'
      'ALTER PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer,'
      '    multiplicador integer)'
      'as'
      'declare variable q_14 integer;'
      'declare variable q_12 integer;'
      'declare variable q_10 integer;'
      'declare variable cod_cor_kit integer;'
      'declare variable cod_produto_kit integer;'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'declare variable teste varchar(10);'
      'declare variable prokit char(1);'
      'declare variable corkit char(1);'
      
        'begin for select i.cod_produto, i.cod_cor, ci.qtd_rn, ci.qtd_p, ' +
        'ci.qtd_m, ci.qtd_g, ci.qtd_1, ci.qtd_2, ci.qtd_3, ci.qtd_4,'
      
        '                 ci.qtd_6, ci.qtd_8, ci.qtd_10, ci.qtd_12, ci.qt' +
        'd_14, ci.qtd_unica, pro.kit, cor.kit'
      '  from conferencia_itens ci'
      '  inner join itens i        on ci.codigo_item = i.codigo'
      '  inner join pedidos p      on p.codigo = i.cod_pedido'
      '  inner join produtos pro   on pro.codigo = i.cod_produto'
      '  inner join cores cor      on cor.codigo = i.cod_cor'
      ''
      '  where (p.codigo = :codped)'
      ''
      '  order by i.cod_produto, i.cod_cor'
      '  into'
      
        '  :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2, :' +
        'q_3, :q_4, :q_6, :q_8, :q_10, :q_12, :q_14, :q_unica, :prokit, :' +
        'corkit'
      '  do begin'
      '    if (:prokit = '#39'S'#39') then'
      '    begin'
      
        '      for select pk.codigo_produto, pk.codigo_cor from produtos_' +
        'kit pk'
      '        where pk.codigo_kit = :cod_produto'
      '      into'
      '        :cod_produto_kit, :cod_cor_kit do'
      '      begin'
      
        '         execute procedure altera_estoque(:cod_produto_kit, :cod' +
        '_cor_kit, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_' +
        '6, :q_8, :q_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '      end'
      ''
      '    end'
      '    else'
      
        '      execute procedure altera_estoque(:cod_produto, :cod_cor, :' +
        'q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q_8, :q' +
        '_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '  end'
      'end'
      '^')
    TabOrder = 169
    WordWrap = False
  end
  object versao170: TMemo
    Left = 129
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER PROCEDURE ALTERA_ESTOQUE ('
      '    cod_produto integer,'
      '    cod_cor integer,'
      '    qtd_rn integer,'
      '    qtd_p integer,'
      '    qtd_m integer,'
      '    qtd_g integer,'
      '    qtd_1 integer,'
      '    qtd_2 integer,'
      '    qtd_3 integer,'
      '    qtd_4 integer,'
      '    qtd_6 integer,'
      '    qtd_8 integer,'
      '    qtd_10 integer,'
      '    qtd_12 integer,'
      '    qtd_14 integer,'
      '    qtd_unica integer,'
      '    multiplicador integer)'
      'as'
      'begin'
      
        '  if (:qtd_rn > 0) then begin   UPDATE ESTOQUE est set est.quant' +
        'idade = (est.quantidade + (:qtd_rn * :multiplicador))   where es' +
        't.codigo_produto = :cod_produto and est.codigo_cor = :cod_cor an' +
        'd est.codigo_tamanho = 1;   end'
      
        '  if (:qtd_p > 0) then begin    UPDATE ESTOQUE est set est.quant' +
        'idade = (est.quantidade + (:qtd_p * :multiplicador))    where es' +
        't.codigo_produto = :cod_produto and est.codigo_cor = :cod_cor an' +
        'd est.codigo_tamanho = 2;     end'
      
        '  if (:qtd_m > 0) then begin    UPDATE ESTOQUE est set est.quant' +
        'idade = (est.quantidade + (:qtd_m * :multiplicador))    where es' +
        't.codigo_produto = :cod_produto and est.codigo_cor = :cod_cor an' +
        'd est.codigo_tamanho = 3;     end'
      
        '  if (:qtd_g > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_g * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 4;     end'
      
        '  if (:qtd_1 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_1 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 5;     end'
      
        '  if (:qtd_2 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_2 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 6;     end'
      
        '  if (:qtd_3 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_3 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 7;     end'
      
        '  if (:qtd_4 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_4 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 8 ;     end'
      
        '  if (:qtd_6 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_6 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 9;     end'
      
        '  if (:qtd_8 > 0) then begin       UPDATE ESTOQUE est set est.qu' +
        'antidade = (est.quantidade + (:qtd_8 * :multiplicador))       wh' +
        'ere est.codigo_produto = :cod_produto and est.codigo_cor = :cod_' +
        'cor and est.codigo_tamanho = 10 ;     end'
      ''
      '  if (:qtd_10 > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_10 * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 16 ;     end'
      '  if (:qtd_12 > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_12 * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 17 ;     end'
      '  if (:qtd_14 > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_14 * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 18 ;     end'
      '  if (:qtd_unica > 0) then begin'
      
        '     UPDATE ESTOQUE est set est.quantidade = (est.quantidade + (' +
        ':qtd_unica * :multiplicador))'
      
        '     where est.codigo_produto = :cod_produto and est.codigo_cor ' +
        '= :cod_cor and est.codigo_tamanho = 11;'
      '  end'
      '  suspend;'
      'end'
      '^'
      'ALTER PROCEDURE BAIXA_PEDIDO_ESTOQUE ('
      '    codped integer,'
      '    multiplicador integer)'
      'as'
      'declare variable q_14 integer;'
      'declare variable q_12 integer;'
      'declare variable q_10 integer;'
      'declare variable cod_produto_kit integer;'
      'declare variable q_rn integer;'
      'declare variable q_p integer;'
      'declare variable q_m integer;'
      'declare variable q_g integer;'
      'declare variable q_1 integer;'
      'declare variable q_2 integer;'
      'declare variable q_3 integer;'
      'declare variable q_4 integer;'
      'declare variable q_6 integer;'
      'declare variable q_8 integer;'
      'declare variable q_unica integer;'
      'declare variable cod_produto integer;'
      'declare variable cod_cor integer;'
      'declare variable teste varchar(10);'
      'declare variable prokit char(1);'
      'declare variable corkit char(1);'
      'declare variable cod_cor_kit integer;'
      
        'begin for select i.cod_produto, i.cod_cor, ci.qtd_rn, ci.qtd_p, ' +
        'ci.qtd_m, ci.qtd_g, ci.qtd_1, ci.qtd_2, ci.qtd_3, ci.qtd_4,'
      
        '                 ci.qtd_6, ci.qtd_8, ci.qtd_10, ci.qtd_12, ci.qt' +
        'd_14, ci.qtd_unica, pro.kit, cor.kit'
      '  from conferencia_itens ci'
      '  inner join itens i        on ci.codigo_item = i.codigo'
      '  inner join pedidos p      on p.codigo = i.cod_pedido'
      '  inner join produtos pro   on pro.codigo = i.cod_produto'
      '  inner join cores cor      on cor.codigo = i.cod_cor'
      ''
      '  where (p.codigo = :codped)'
      ''
      '  order by i.cod_produto, i.cod_cor'
      '  into'
      
        '  :cod_produto, :cod_cor, :q_rn, :q_p, :q_m, :q_g, :q_1, :q_2, :' +
        'q_3, :q_4, :q_6, :q_8, :q_10, :q_12, :q_14, :q_unica, :prokit, :' +
        'corkit'
      '  do begin'
      '    if (:prokit = '#39'S'#39') then'
      '    begin'
      
        '      for select ck.codigo_cor from cores_kit ck   where ck.codi' +
        'go_kit = :cod_cor'
      '      into'
      '        :cod_cor_kit do'
      '      begin'
      '        for select pk.codigo_produto from produtos_kit pk'
      
        '         where pk.codigo_kit = :cod_produto and pk.codigo_cor = ' +
        ':cod_cor_kit'
      '        into'
      '          :cod_produto_kit do'
      '        begin'
      
        '          execute procedure altera_estoque(:cod_produto_kit, :co' +
        'd_cor_kit, :q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q' +
        '_6, :q_8, :q_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '        end'
      '      end'
      ''
      '    end'
      '    else'
      
        '      execute procedure altera_estoque(:cod_produto, :cod_cor, :' +
        'q_rn, :q_p, :q_m,  :q_g,  :q_1, :q_2, :q_3, :q_4, :q_6, :q_8, :q' +
        '_10, :q_12, :q_14, :q_unica, :multiplicador);'
      '  end'
      'end'
      '^')
    TabOrder = 170
    WordWrap = False
  end
  object versao171: TMemo
    Left = 153
    Top = 228
    Width = 25
    Height = 25
    Lines.Strings = (
      'ALTER TABLE PRODUTOS'
      'ADD DESC_TIPO_COR VARCHAR(30)'
      '^')
    TabOrder = 171
    WordWrap = False
  end
end
