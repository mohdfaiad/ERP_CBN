object frm_impCCE: Tfrm_impCCE
  Left = 314
  Top = 7
  Caption = 'frm_impCCE'
  ClientHeight = 737
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 587
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedLeft = True
      Borders.FixedTop = True
      Borders.FixedRight = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object RLDraw5: TRLDraw
        Left = 1
        Top = 289
        Width = 716
        Height = 22
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Brush.Color = 15066597
        Pen.Style = psClear
      end
      object RLDraw4: TRLDraw
        Left = 1
        Top = 236
        Width = 716
        Height = 22
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Brush.Color = 15066597
        Pen.Style = psClear
      end
      object RLDraw2: TRLDraw
        Left = 1
        Top = 147
        Width = 716
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Brush.Color = 15066597
        Pen.Style = psClear
      end
      object RLLabel7: TRLLabel
        Left = 5
        Top = 150
        Width = 161
        Height = 17
        Caption = 'DADOS DO DESTINAT'#193'RIO'
      end
      object RLDBText1: TRLDBText
        Left = 56
        Top = 66
        Width = 64
        Height = 17
        DataField = 'EMITENTE'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 56
        Top = 84
        Width = 51
        Height = 17
        DataField = 'RUAEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 56
        Top = 102
        Width = 70
        Height = 17
        DataField = 'CIDADEEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 369
        Top = 84
        Width = 44
        Height = 17
        DataField = 'NREMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 347
        Top = 84
        Width = 20
        Height = 17
        Caption = 'N'#186
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 395
        Top = 84
        Width = 70
        Height = 17
        DataField = 'BAIRROEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 347
        Top = 102
        Width = 41
        Height = 17
        DataField = 'UFEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 330
        Top = 102
        Width = 9
        Height = 17
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 410
        Top = 102
        Width = 48
        Height = 17
        DataField = 'CEPEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 378
        Top = 102
        Width = 30
        Height = 17
        Caption = 'Cep:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText8: TRLDBText
        Left = 75
        Top = 120
        Width = 36
        Height = 17
        DataField = 'IEEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 105
        Top = 174
        Width = 91
        Height = 17
        DataField = 'DESTINATARIO'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText10: TRLDBText
        Left = 64
        Top = 210
        Width = 71
        Height = 17
        DataField = 'CIDADEDES'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 264
        Top = 120
        Width = 56
        Height = 17
        DataField = 'CNPJEMI'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 56
        Top = 120
        Width = 17
        Height = 17
        Caption = 'IE:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 224
        Top = 120
        Width = 37
        Height = 17
        Caption = 'CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 2
        Top = 175
        Width = 101
        Height = 15
        Caption = 'Nome/Raz.Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText12: TRLDBText
        Left = 600
        Top = 174
        Width = 57
        Height = 17
        DataField = 'CNPJDES'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 561
        Top = 175
        Width = 37
        Height = 15
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 2
        Top = 193
        Width = 60
        Height = 15
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 362
        Top = 193
        Width = 41
        Height = 15
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 569
        Top = 193
        Width = 29
        Height = 15
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 2
        Top = 211
        Width = 60
        Height = 15
        Caption = 'Munic'#237'pio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 383
        Top = 211
        Width = 20
        Height = 15
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 582
        Top = 211
        Width = 16
        Height = 15
        Caption = 'IE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText13: TRLDBText
        Left = 64
        Top = 192
        Width = 52
        Height = 17
        DataField = 'RUADES'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText14: TRLDBText
        Left = 405
        Top = 192
        Width = 71
        Height = 17
        DataField = 'BAIRRODES'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText15: TRLDBText
        Left = 600
        Top = 192
        Width = 49
        Height = 17
        DataField = 'CEPDES'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText16: TRLDBText
        Left = 405
        Top = 210
        Width = 42
        Height = 17
        DataField = 'UFDES'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText17: TRLDBText
        Left = 600
        Top = 210
        Width = 37
        Height = 17
        DataField = 'IEDES'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel18: TRLLabel
        Left = 6
        Top = 377
        Width = 127
        Height = 14
        Caption = 'Corre'#231#245'es solicitadas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 5
        Top = 238
        Width = 121
        Height = 16
        Caption = 'NOTA REFERENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 8
        Top = 264
        Width = 27
        Height = 17
        Caption = 'N'#186' :'
      end
      object RLDBText18: TRLDBText
        Left = 36
        Top = 264
        Width = 57
        Height = 17
        DataField = 'NRNOTA'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel22: TRLLabel
        Left = 136
        Top = 264
        Width = 86
        Height = 17
        Caption = 'Data emiss'#227'o:'
      end
      object RLDBText19: TRLDBText
        Left = 228
        Top = 264
        Width = 95
        Height = 17
        DataField = 'DATA_EMISSAO'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel23: TRLLabel
        Left = 313
        Top = 264
        Width = 42
        Height = 17
        Caption = 'Chave:'
      end
      object RLDBText20: TRLDBText
        Left = 358
        Top = 264
        Width = 16
        Height = 17
        DataField = 'ID'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel25: TRLLabel
        Left = 5
        Top = 292
        Width = 150
        Height = 16
        Caption = 'DADOS DA CORRE'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel27: TRLLabel
        Left = 7
        Top = 319
        Width = 59
        Height = 15
        Caption = 'C'#243'd. Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel28: TRLLabel
        Left = 153
        Top = 319
        Width = 43
        Height = 15
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel29: TRLLabel
        Left = 268
        Top = 319
        Width = 43
        Height = 15
        Caption = 'Motivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText21: TRLDBText
        Left = 68
        Top = 317
        Width = 66
        Height = 17
        DataField = 'COD_LOTE'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText22: TRLDBText
        Left = 201
        Top = 317
        Width = 49
        Height = 17
        DataField = 'STALOT'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText23: TRLDBText
        Left = 317
        Top = 317
        Width = 56
        Height = 17
        DataField = 'MOTLOT'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel30: TRLLabel
        Left = 7
        Top = 341
        Width = 87
        Height = 15
        Caption = 'Cod. Corre'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel31: TRLLabel
        Left = 154
        Top = 341
        Width = 43
        Height = 15
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Left = 268
        Top = 341
        Width = 43
        Height = 15
        Caption = 'Motivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText24: TRLDBText
        Left = 98
        Top = 339
        Width = 53
        Height = 17
        DataField = 'CODIGO'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText25: TRLDBText
        Left = 201
        Top = 339
        Width = 60
        Height = 17
        DataField = 'STACORR'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText26: TRLDBText
        Left = 316
        Top = 339
        Width = 67
        Height = 17
        DataField = 'MOTCORR'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel33: TRLLabel
        Left = 495
        Top = 292
        Width = 104
        Height = 15
        Caption = 'Data da corre'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText27: TRLDBText
        Left = 605
        Top = 291
        Width = 92
        Height = 17
        DataField = 'DT_CORRECAO'
        DataSource = DataSource1
        Text = ''
      end
      object data: TRLLabel
        Left = 56
        Top = 47
        Width = 30
        Height = 17
      end
      object RLDraw1: TRLDraw
        Left = 8
        Top = 395
        Width = 701
        Height = 182
      end
      object RLDBMemo1: TRLDBMemo
        Left = 14
        Top = 399
        Width = 688
        Height = 15
        Behavior = [beSiteExpander]
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'CORRECAO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw3: TRLDraw
        Left = 1
        Top = 19
        Width = 716
        Height = 22
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Brush.Color = 15066597
        Pen.Style = psClear
      end
      object RLLabel8: TRLLabel
        Left = 5
        Top = 22
        Width = 134
        Height = 17
        Caption = 'DADOS DO EMITENTE'
      end
      object RLLabel6: TRLLabel
        Left = 413
        Top = 1
        Width = 150
        Height = 17
        Caption = 'Data e hora do relat'#243'rio:'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 566
        Top = 1
        Width = 39
        Height = 17
        Info = itNow
        Text = ''
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = qryCCE
    Left = 728
    Top = 40
  end
  object qryCCE: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select first 1 cc.*, rcc.status STACORR, rcc.motivo MOTCORR, rcl' +
        '.status STALOT,'
      
        'rcl.motivo MOTLOT, nfe.chave_acesso ID, nf.numero_nota_fiscal NR' +
        'NOTA, emi.razao EMITENTE, edr_emi.logradouro RUAEMI, edr_emi.num' +
        'ero NREMI,'
      
        'edr_emi.bairro BAIRROEMI, cid_emi.nome CIDADEEMI, est_emi.sigla ' +
        'UFEMI, edr_emi.cep CEPEMI, emi.cpf_cnpj CNPJEMI, emi.rg_ie IEEMI' +
        ','
      ''
      
        'des.razao DESTINATARIO, edr_des.logradouro RUADES, edr_des.numer' +
        'o NRDES, cid_des.nome CIDADEDES, edr_des.bairro BAIRRODES, edr_d' +
        'es.cep CEPDES,'
      
        ' est_des.sigla UFDES, des.cpf_cnpj CNPJDES, des.rg_ie IEDES, nf.' +
        'data_emissao'
      ''
      '  from correcoes_cce cc'
      
        '  left join return_cce_corr   rcc on rcc.cod_correcao = cc.codig' +
        'o'
      '  left join return_cce_lote   rcl on rcl.cod_lote = cc.cod_lote'
      '  left join notas_fiscais     nf  on nf.codigo = cc.codigo_nota'
      
        '  left join notas_fiscais_nfe nfe on nfe.codigo_nota_fiscal = nf' +
        '.codigo'
      
        '  left join pessoas           emi     on emi.codigo = nf.codigo_' +
        'emitente'
      
        '  left join enderecos         edr_emi on edr_emi.codpessoa = emi' +
        '.codigo'
      
        '  left join cidades           cid_emi on cid_emi.codibge = edr_e' +
        'mi.codcidade'
      
        '  left join estados           est_emi on est_emi.codigo = cid_em' +
        'i.codest'
      
        '  left join pessoas           des     on des.codigo = nf.codigo_' +
        'destinatario'
      
        '  left join enderecos         edr_des on edr_des.codpessoa = emi' +
        '.codigo'
      
        '  left join cidades           cid_des on cid_des.codibge = edr_d' +
        'es.codcidade'
      
        '  left join estados           est_des on est_des.codigo = cid_de' +
        's.codest'
      'where cc.codigo = :cod'
      'order by cc.codigo')
    Left = 616
    Top = 40
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCCECODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCCECOD_LOTE: TIntegerField
      FieldName = 'COD_LOTE'
      Origin = 'COD_LOTE'
    end
    object qryCCECODIGO_NOTA: TIntegerField
      FieldName = 'CODIGO_NOTA'
      Origin = 'CODIGO_NOTA'
    end
    object qryCCEDT_CORRECAO: TDateField
      FieldName = 'DT_CORRECAO'
      Origin = 'DT_CORRECAO'
      Required = True
    end
    object qryCCECORRECAO: TStringField
      FieldName = 'CORRECAO'
      Origin = 'CORRECAO'
      Required = True
      Size = 1000
    end
    object qryCCESTACORR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STACORR'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qryCCEMOTCORR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MOTCORR'
      Origin = 'MOTIVO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryCCESTALOT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STALOT'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qryCCEMOTLOT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MOTLOT'
      Origin = 'MOTIVO'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryCCEID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'CHAVE_ACESSO'
      ProviderFlags = []
      ReadOnly = True
      Size = 44
    end
    object qryCCENRNOTA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NRNOTA'
      Origin = 'NUMERO_NOTA_FISCAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCCEEMITENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMITENTE'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryCCERUAEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUAEMI'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryCCENREMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NREMI'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCCEBAIRROEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRROEMI'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCCECIDADEEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADEEMI'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 72
    end
    object qryCCEUFEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UFEMI'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryCCECEPEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEPEMI'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCCECNPJEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJEMI'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryCCEIEEMI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IEEMI'
      Origin = 'RG_IE'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryCCEDESTINATARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTINATARIO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryCCERUADES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUADES'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryCCENRDES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NRDES'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCCECIDADEDES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADEDES'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 72
    end
    object qryCCEBAIRRODES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRODES'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCCECEPDES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEPDES'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCCEUFDES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UFDES'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryCCECNPJDES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJDES'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryCCEIEDES: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IEDES'
      Origin = 'RG_IE'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryCCEDATA_EMISSAO: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
