inherited frmOrcamentos: TfrmOrcamentos
  Caption = 'Destinar or'#231'amentos'
  ClientHeight = 579
  ClientWidth = 1133
  OnShow = FormShow
  ExplicitWidth = 1149
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 133
    Height = 15
    Caption = 'Or'#231'amentos importados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnConfirmaPedido: TSpeedButton
    Left = 960
    Top = 536
    Width = 150
    Height = 30
    Caption = ' Confirma Pedido'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF4EB1456DC066FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56B24F1CC63218
      B9218ECB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF65B96019C33828E95829E34615B1139CD299FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77BF7117C54025EB6A1FDD4C20
      DC3F29E03613A709B8DFB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      70BD6A16C74823EF791AE05B33E86532E4531FD92E2ADE2C0FA004CEE9CCFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF75BF7015CA5220F3891CE56C27EC6B46D15776
      E88333E4491FD7222AD8211FA415E0F1DEFFFFFFFFFFFFFFFFFF6FC06916CF5D
      1CF99B17E87A26F07D43D36060B46036A92E87F59425DB2C23DA1D27D31F2EA7
      24FAFDF9FFFFFFFFFFFF4FB14829D66A1AF99E2EFA9845D7696FBD6AFFFFFFE0
      F1E02AAA2784F98A26D82325DC1E26CF1D2BA221FFFFFFFFFFFFFFFFFF54B04F
      30D76C4ADD7A77C072FFFFFFFFFFFFFFFFFFBFE2BF40BA3E85FC821BD21228DC
      2021C8194AAF42FFFFFFFFFFFFFFFFFF63BA584DB044FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFADD9AD49C24783FF7E1BD2122AE0231FC41860B959FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98CF985ACB5281FF
      7C23DC1D1CBF1454B44CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF6FBC6F6CDC663AC63566BA66FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60BB
      5E8ECE89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = btnConfirmaPedidoClick
  end
  object btnCancelaPedido: TSpeedButton
    Left = 792
    Top = 536
    Width = 150
    Height = 30
    Caption = ' Cancela Pedido'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFF140EAE
      1711B8100BA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100B
      A11711B8140EAEFFFFFF1F1AB52522E92723F11F1BD1130EA6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF130EA61F1BD12723F12522E91F1AB53D3AC84648F6
      2425F12A2BF32121D4140FADFFFFFFFFFFFFFFFFFFFFFFFF140FAD2121D42A2B
      F32425F14648F63D3AC8221CB66262E1444BF3262DEF2C33F22326D71812B3FF
      FFFFFFFFFF1812B32326D72C33F2262DEF474DF46262E1221CB6FFFFFF241DBB
      6566E34853F32934EF2F3BF2262BD91A13BA1A13BA262BD92F3BF22834EF4752
      F35F61DF241DBAFFFFFFFFFFFFFFFFFF2621C2656AE54756F32C3DF03041F12B
      36E42B36E43041F12D3DF04A59F35D5FE02119BFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF2721C66267E64356F23044F03448F23448F23044EF4255F26166E5221A
      C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C23CC4551E9354DF136
      4CEF364CEF354DF04251EA2B23CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF1D14CE3240E63C54F23850F0384FF03B54F23445E91D15CEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D4313EE43E58F13953F045
      5EF2455FF23A53F03E57F0303AE31F15D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      2018D93542E7425FF33D59F1556EF3737FF2737EF2566EF33D59F1425EF3313A
      E41F16D9FFFFFFFFFFFFFFFFFF2018DE3744E94663F2405DF15C77F36E76EF30
      28DF2E25DF7078F05D77F4405DF14562F2333DE82117DDFFFFFF221BE23947EC
      4A69F34462F25F7AF3686EF0271FE2FFFFFFFFFFFF2C23E2717AF1607BF44362
      F24A69F33846EB2019E24144EC5372F44464F26481F46E76F2271EE6FFFFFFFF
      FFFFFFFFFFFFFFFF2D25E7747CF26480F44564F25270F33D41EB4441ED7B8FF5
      7A94F6737BF32D24EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24EA737C
      F37A93F67A8FF64441EDFFFFFF4845F05A59F22D24EDFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24ED5959F24844F0FFFFFF}
    OnClick = btnCancelaPedidoClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 37
    Width = 1109
    Height = 465
    DataSource = dsOrcamentos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Calibri'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IMPORTADO'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPRESENTANTE'
        Width = 395
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Width = 393
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_CNPJ'
        Width = 104
        Visible = True
      end>
  end
  object qryOrcamentos: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select P.CODIGO, p.dt_cadastro IMPORTADO, p.valor_total, r.razao' +
        ' REPRESENTANTE, c.razao CLIENTE, c.cpf_cnpj, rt.id_externo  from' +
        ' pedidos p'
      '  inner join pessoas r on r.codigo = p.cod_repres'
      '  inner join pessoas c on c.codigo = p.cod_cliente'
      
        '  inner join relacao_tab_importacao rt on ((rt.url = '#39'pedidos'#39')a' +
        'nd(rt.id_erp = p.codigo))'
      'where p.tipo = '#39'O'#39'  and not p.cancelado = '#39'S'#39)
    Left = 48
    Top = 80
    object qryOrcamentosIMPORTADO: TDateField
      FieldName = 'IMPORTADO'
      Origin = 'DT_CADASTRO'
    end
    object qryOrcamentosVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryOrcamentosREPRESENTANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPRESENTANTE'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryOrcamentosCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryOrcamentosCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryOrcamentosID_EXTERNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_EXTERNO'
      Origin = 'ID_EXTERNO'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryOrcamentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsOrcamentos: TDataSource
    DataSet = qryOrcamentos
    Left = 48
    Top = 128
  end
end
