inherited frmBuscaPedidos: TfrmBuscaPedidos
  Caption = 'Busca de Pedidos'
  ClientHeight = 595
  ClientWidth = 941
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 957
  ExplicitHeight = 633
  PixelsPerInch = 96
  TextHeight = 13
  object gbPeriodo: TGroupBox
    Left = 5
    Top = 0
    Width = 253
    Height = 90
    Caption = ' Per'#237'odo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label6: TLabel
      Left = 13
      Top = 19
      Width = 57
      Height = 13
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 134
      Top = 19
      Width = 52
      Height = 13
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 53
      Width = 245
      Height = 13
      Caption = '_________________________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15325901
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object dtpInicio: TDateTimePicker
      Left = 13
      Top = 35
      Width = 105
      Height = 21
      Date = 41523.559567326390000000
      Time = 41523.559567326390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dtpFim: TDateTimePicker
      Left = 134
      Top = 35
      Width = 105
      Height = 21
      Date = 41523.559567326390000000
      Time = 41523.559567326390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object chkPeriodoGeral: TCheckBox
      Left = 72
      Top = 69
      Width = 97
      Height = 17
      TabStop = False
      Caption = 'Per'#237'odo geral'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = chkPeriodoGeralClick
    end
  end
  object DBGridCBN1: TDBGridCBN
    Left = 0
    Top = 96
    Width = 941
    Height = 472
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 14803425
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridCBN1DrawColumnCell
    OnDblClick = DBGridCBN1DblClick
    BuscaHabilitada = True
    ConfCores.Normal.CorFonte = clWindowText
    ConfCores.Normal.CorFundo = 14803425
    ConfCores.Normal.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Normal.Tipo.Color = clWindowText
    ConfCores.Normal.Tipo.Height = -11
    ConfCores.Normal.Tipo.Name = 'MS Sans Serif'
    ConfCores.Normal.Tipo.Style = []
    ConfCores.Zebrada.CorFonte = clWindowText
    ConfCores.Zebrada.CorFundo = clWhite
    ConfCores.Zebrada.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Zebrada.Tipo.Color = clWindowText
    ConfCores.Zebrada.Tipo.Height = -11
    ConfCores.Zebrada.Tipo.Name = 'MS Sans Serif'
    ConfCores.Zebrada.Tipo.Style = []
    ConfCores.Selecao.CorFonte = clWindowText
    ConfCores.Selecao.CorFundo = 16037533
    ConfCores.Selecao.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Selecao.Tipo.Color = clWindowText
    ConfCores.Selecao.Tipo.Height = -11
    ConfCores.Selecao.Tipo.Name = 'MS Sans Serif'
    ConfCores.Selecao.Tipo.Style = []
    ConfCores.Destacado.CorFonte = 8650884
    ConfCores.Destacado.CorFundo = clWhite
    ConfCores.Destacado.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Destacado.Tipo.Color = 8650884
    ConfCores.Destacado.Tipo.Height = -11
    ConfCores.Destacado.Tipo.Name = 'Lucida Console'
    ConfCores.Destacado.Tipo.Style = [fsBold]
    ConfCores.Titulo.CorFonte = clWindowText
    ConfCores.Titulo.CorFundo = clBtnFace
    ConfCores.Titulo.Tipo.Charset = DEFAULT_CHARSET
    ConfCores.Titulo.Tipo.Color = clWindowText
    ConfCores.Titulo.Tipo.Height = -11
    ConfCores.Titulo.Tipo.Name = 'MS Sans Serif'
    ConfCores.Titulo.Tipo.Style = []
    Ordenavel = True
    TipoBusca.ListarApenasEncontrados = True
    TipoBusca.QualquerParte = True
    SalvaConfiguracoes = False
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMPEDIDO'
        Title.Caption = 'N'#186' PEDIDO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_LIMITE_ENTREGA'
        Title.Caption = 'LIMITE ENTREGA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = 'VALOR TOTAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PONTOS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 568
    Width = 941
    Height = 27
    Align = alBottom
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 219
      Height = 15
      Caption = 'Selecione o(s) registro(s) desejado(s) com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 232
      Top = 6
      Width = 67
      Height = 15
      Caption = 'duplo clique'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 352
      Top = 6
      Width = 198
      Height = 15
      Caption = 'Para cancelar sele'#231#227'o e sair, pressione'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 554
      Top = 6
      Width = 20
      Height = 15
      Caption = 'ESC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 623
      Top = 6
      Width = 235
      Height = 15
      Caption = 'Para confirmar selecionados e sair, pressione'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 864
      Top = 6
      Width = 36
      Height = 15
      Caption = 'ENTER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnFiltrar: TBitBtn
    Left = 268
    Top = 6
    Width = 100
    Height = 30
    Caption = ' [ F2 ] Filtrar'
    TabOrder = 1
    OnClick = btnFiltrarClick
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT PED.CODIGO, PED.numpedido, PED.dt_limite_entrega, PED.val' +
        'or_total, CLI.razao CLIENTE,'
      
        '       (sum((coalesce(it.qtd_rn,0) - coalesce(ci.qtd_rn, 0)) + (' +
        'coalesce(it.qtd_p,0) - coalesce(ci.qtd_p, 0)) + '
      
        '       (coalesce(it.qtd_m,0) - coalesce(ci.qtd_m, 0))   + (coale' +
        'sce(it.qtd_g,0) - coalesce(ci.qtd_g, 0)) +'
      
        '       (coalesce(it.qtd_1,0) - coalesce(ci.qtd_1, 0))   + (coale' +
        'sce(it.qtd_2,0) - coalesce(ci.qtd_2, 0)) +'
      
        '       (coalesce(it.qtd_3,0) - coalesce(ci.qtd_3, 0))   + (coale' +
        'sce(it.qtd_4,0) - coalesce(ci.qtd_4, 0)) +'
      
        '       (coalesce(it.qtd_6,0) - coalesce(ci.qtd_6, 0))   + (coale' +
        'sce(it.qtd_8,0) - coalesce(ci.qtd_8, 0)) +'
      
        '       (coalesce(it.qtd_10,0) - coalesce(ci.qtd_10, 0)) + (coale' +
        'sce(it.qtd_12,0) - coalesce(ci.qtd_12, 0)) +'
      
        '       (coalesce(it.qtd_14,0) - coalesce(ci.qtd_14, 0)) + (coale' +
        'sce(it.qtd_unica,0) - coalesce(ci.qtd_unica, 0)))'
      
        '       * 2 * count(distinct it.cod_produto) * (ped.dt_limite_ent' +
        'rega - current_date) * 20 * 1) / 1000 as PONTOS'
      ''
      '  FROM PEDIDOS PED'
      ''
      
        '  INNER JOIN PESSOAS          CLI on CLI.codigo = PED.cod_client' +
        'e'
      
        '  LEFT JOIN PEDIDOS_FATURADOS PF ON PF.CODIGO_PEDIDO = PED.CODIG' +
        'O  LEFT JOIN NFCE ON NFCE.CODIGO_PEDIDO = PED.CODIGO'
      '  LEFT JOIN PEDIDOS_MAPA PM ON PM.CODIGO_PEDIDO = PEd.CODIGO'
      '  inner join itens              it on it.cod_pedido = PED.codigo'
      
        '  left  join conferencia_itens   ci on ci.codigo_item = it.codig' +
        'o'
      ''
      ''
      
        '  WHERE ( (PF.CODIGO IS NULL) AND ((PED.DESPACHADO IS NULL) OR (' +
        'PED.DESPACHADO <> '#39'S'#39')) )'
      
        '    AND ((PED.CANCELADO IS NULL) OR (PED.CANCELADO <> '#39'S'#39'))  AND' +
        ' (PM.CODIGO IS NULL)'
      '    AND (PED.dt_limite_entrega between :dti and :dtf)'
      ''
      
        ' group by ped.numpedido, ped.codigo, ped.dt_limite_entrega, PED.' +
        'valor_total, CLI.razao'
      ' order by PONTOS')
    Left = 208
    Top = 152
    ParamData = <
      item
        Name = 'DTI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DTF'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object ds: TDataSource
    DataSet = cds
    Left = 352
    Top = 152
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 304
    Top = 152
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Size = 22
    end
    object cdsDT_LIMITE_ENTREGA: TDateField
      FieldName = 'DT_LIMITE_ENTREGA'
    end
    object cdsVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object cdsCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ReadOnly = True
      Size = 60
    end
    object cdsPONTOS: TBCDField
      FieldName = 'PONTOS'
      ReadOnly = True
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 2
    end
    object cdsTAG: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TAG'
      Size = 1
    end
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Left = 256
    Top = 152
  end
end
