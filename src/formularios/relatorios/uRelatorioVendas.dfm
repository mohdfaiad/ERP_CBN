inherited frmRelatorioVendas: TfrmRelatorioVendas
  Left = 155
  Top = 83
  Align = alClient
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 606
  ClientWidth = 1187
  OldCreateOrder = True
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitWidth = 1203
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter3: TSplitter
    Left = 0
    Top = 95
    Width = 8
    Height = 375
    Cursor = crDefault
    ResizeStyle = rsNone
    ExplicitHeight = 484
  end
  object Splitter4: TSplitter
    Left = 1179
    Top = 95
    Width = 8
    Height = 375
    Cursor = crDefault
    Align = alRight
    ResizeStyle = rsNone
    ExplicitLeft = 1285
    ExplicitTop = 98
    ExplicitHeight = 486
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1187
    Height = 95
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 0
      Width = 8
      Height = 95
      Cursor = crDefault
      ResizeStyle = rsNone
    end
    object Splitter2: TSplitter
      Left = 261
      Top = 0
      Width = 8
      Height = 95
      Cursor = crDefault
      ResizeStyle = rsNone
    end
    object Splitter7: TSplitter
      Left = 760
      Top = 0
      Width = 8
      Height = 95
      Cursor = crDefault
      ResizeStyle = rsNone
    end
    object Splitter8: TSplitter
      Left = 1179
      Top = 0
      Width = 8
      Height = 95
      Cursor = crDefault
      Align = alRight
      ResizeStyle = rsNone
      Visible = False
      ExplicitLeft = 1296
    end
    object Splitter9: TSplitter
      Left = 940
      Top = 0
      Width = 8
      Height = 95
      Cursor = crDefault
      ResizeStyle = rsNone
    end
    object Splitter10: TSplitter
      Left = 1076
      Top = 0
      Width = 8
      Height = 95
      Cursor = crDefault
      Align = alRight
      ResizeStyle = rsNone
      Visible = False
      ExplicitLeft = 1193
    end
    object gpbRepresentante: TGroupBox
      Left = 269
      Top = 0
      Width = 491
      Height = 95
      Align = alLeft
      Caption = ' Selecione o Representante '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 2
        Top = 51
        Width = 487
        Height = 42
        Align = alBottom
        AutoSize = False
        Caption = 
          '________________________________________________________________' +
          '______________________________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11645361
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inline BuscaPessoa1: TBuscaPessoa
        Left = 2
        Top = 15
        Width = 487
        Height = 38
        Align = alTop
        AutoSize = True
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 15
        ExplicitWidth = 487
        inherited StaticText1: TStaticText
          Left = 11
          Font.Color = 4737096
          ExplicitLeft = 11
        end
        inherited edtCodigo: TCurrencyEdit
          Left = 12
          Top = 17
          ExplicitLeft = 12
          ExplicitTop = 17
        end
        inherited StaticText2: TStaticText
          Left = 113
          Width = 35
          Caption = 'Raz'#227'o'
          Font.Color = 4737096
          ExplicitLeft = 113
          ExplicitWidth = 35
        end
        inherited btnBuscar: TBitBtn
          Left = 85
          ExplicitLeft = 85
        end
        inherited edtRazao: TEdit
          Left = 113
          Top = 17
          Width = 357
          Anchors = [akLeft, akTop, akRight]
          ExplicitLeft = 113
          ExplicitTop = 17
          ExplicitWidth = 357
        end
      end
      object chkTodos: TCheckBox
        Left = 15
        Top = 71
        Width = 154
        Height = 17
        TabStop = False
        Caption = 'Todos os representantes'
        TabOrder = 1
        OnClick = chkTodosClick
      end
      object chkInternet: TCheckBox
        Left = 389
        Top = 71
        Width = 82
        Height = 17
        TabStop = False
        Caption = 'E-Commerce'
        TabOrder = 2
        OnClick = rgTipoDataClick
      end
      object chkFuncionarios: TCheckBox
        Left = 285
        Top = 70
        Width = 90
        Height = 17
        TabStop = False
        Caption = 'Funcion'#225'rios'
        TabOrder = 3
        OnClick = rgTipoDataClick
      end
    end
    object gbPeriodo: TGroupBox
      Left = 8
      Top = 0
      Width = 253
      Height = 95
      Align = alLeft
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
        Top = 32
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
        Top = 32
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
      object dtpInicio: TDateTimePicker
        Left = 13
        Top = 48
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
        OnChange = dtpInicioChange
      end
      object dtpFim: TDateTimePicker
        Left = 134
        Top = 48
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
        OnChange = dtpFimChange
      end
    end
    object rgTipoPedido: TRadioGroup
      Left = 948
      Top = 0
      Width = 128
      Height = 95
      Align = alClient
      Caption = ' Filtrar por pedidos: '
      ItemIndex = 0
      Items.Strings = (
        'Faturados'
        'N'#227'o Faturados'
        'Todos')
      TabOrder = 3
      OnClick = rgTipoPedidoClick
    end
    object rgTipoData: TRadioGroup
      Left = 768
      Top = 0
      Width = 172
      Height = 95
      Align = alLeft
      Caption = ' Filtrar por data de: '
      ItemIndex = 0
      Items.Strings = (
        'Cadastro'
        'Representante'
        'Recebimento'
        'Limite Entrega'
        'Despacho')
      TabOrder = 2
      OnClick = rgTipoDataClick
    end
    object rgLeiaute: TRadioGroup
      Left = 1084
      Top = 0
      Width = 95
      Height = 95
      Align = alRight
      Caption = ' Leiaute '
      ItemIndex = 0
      Items.Strings = (
        'Sint'#233'tico'
        'Anal'#237'tico')
      TabOrder = 4
      OnClick = rgTipoPedidoClick
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 470
    Width = 1187
    Height = 136
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      1187
      136)
    object Splitter6: TSplitter
      Left = 1
      Top = 1
      Width = 1185
      Height = 5
      Cursor = crDefault
      Align = alTop
      ResizeStyle = rsNone
    end
    object GroupBox2: TGroupBox
      Left = 408
      Top = 55
      Width = 160
      Height = 58
      Caption = ' Status de Faturamento '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Image1: TImage
        Left = 15
        Top = 24
        Width = 20
        Height = 21
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFBBE4C270CF8527B7471EBA401EBA4027B747
          70CF85BBE4C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFA4FB96219C1
          401FCE4C24DC5827DD5C27DD5C24DC581FCE4C19C1404FB962FAFDFAFFFFFFFF
          FFFFFFFFFFFBFDFB21A93A1ED04E21D45420D05304B62A18C4401DCE4A18C844
          20D15121D4541ED04E21A93AFBFDFBFFFFFFFFFFFF4EB15B1ECE4D22D45615C9
          481CAC2F9DD2A137AF4614C13B1FD24E1ECE4B1ECD4A20D2531ECE4D4EB15BFF
          FFFFBDDEBE17BA3F21D85A13C64612A826F2F4ECFFFFFFEAF2E626AA380DC039
          20D24F1ECE491DCD4D20D75817BA3FBDDEBE6ABC7418D15214CB4E0BA01EF2F4
          ECFFFBFFFFFAFFFFFFFFEAF2E623A8350BC03A1ED3591CCF531ED25818CF516A
          BC7430A03F2DE1721BA82DF2F4ECFFF8FFEAF2E6A9D5A4EEF2EBFFFFFFD0EBD3
          23A8340AC24218D66213CF5430E17330A14130A34365EAA158B25CEAF2E6EAF2
          E60EB42F00BF303AB649F2F4ECFFFFFFEAF2E623A83307C13D24D86973F0B130
          A14223953778F4BC49CD7A74BF7F2DB64C24D3672ED87219CC5A48B558EAF2E6
          FFFFFFEAF2E626A73125D06077F6BE23953533933D71F2B561E4A84CDB955BE1
          A561DEA563DDA463E2AB4DDA964FB860EEF2E8FFFFFFEAF2E62AB3436DF0B333
          933D67AB6686E3B562E7A95DE2A460E2A65FE1A65FE1A65EE1A563E5AD4CDA95
          4DB75EEAF0E5FFFFFF61BC6580DFAE67AB66B9D4B94EB068A8FCE15FE1A257E0
          9F5BE0A35DE1A45DE1A45DE1A461E5AB4EDC9748BA605DC27096EABF4EB068B9
          D4B9FFFFFF4589457BDBA7B0FCE876E5B562E3AA5EE0A65EE1A65EE1A65EE0A5
          66E6B06FE3AFA7F9E07ADCA8458945FFFFFFFFFFFFFAFDFA1572156DD6A3B3FD
          F0A4F5DF8CE9C78CE8C48AE7C28DE9C6A5F5DEB3FDF06DD6A3157215FAFDFAFF
          FFFFFFFFFFFFFFFFF9FCF945864538A75E7FE1B8A9FFECB9FFFBB9FFFBA9FFEC
          7FE1B838A75E458645F9FCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CE
          B767A567247D33288738288738247D3367A567B7CEB7FFFFFFFFFFFFFFFFFFFF
          FFFF}
      end
      object Label2: TLabel
        Left = 49
        Top = 25
        Width = 97
        Height = 15
        Caption = 'Pedidos Faturados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 55
      Width = 391
      Height = 58
      Caption = ' Status de Aprova'#231#227'o do Pedido '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Image2: TImage
        Left = 8
        Top = 25
        Width = 20
        Height = 21
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          000086AC8603570303550384AB84E8EFE874A074126312046B07046A07046A07
          046A07046B07046B07046B074C8A4CFFFFFF0468040FA82D0FA82D057E0F447F
          44057C0F18C44218C34118C34118C34116BB3D16BB3D16BB3D16BB3D046004FF
          FFFF046E0B18C34517C344098E1B035A0314BE3F17C24317C24317C24317C243
          089220046D09046D09046D09046304B4CDB404730C18C54717C44708901C035A
          0318C44717C34617C34617C34617C34618C44718C74818C74818C8490FA92F53
          8E5305780E16C64816C64708932105821617C64A17C54917C54917C54917C64A
          089220035A03035B03035B03046204589B583D9D4468EC924CDF7D25A33B0582
          1614C54A15C54A15C54A15C54A14C54A29D15E39D86B4DE07E68EE9389FAAE3C
          9B403AA14683FAAD83FAAC5EC57108922184FAAD83F9AC83F9AC83F9AC83FAAC
          3EA74C1E89241E89241E89241C84221C84223CA54A84FAB283FAB15EC8760892
          2182FAAF81F9AD81F9AD81F9AD81FAAE75E49875E49875E49875E4985BC4701E
          89244EA3542B8E322A8E2F1F88260F7F1778E39983FAB382FAB282FAB282FAB3
          84FAB584FAB684FAB684FAB686FAB83EA74CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF40A14A78E79B86FAB685FAB678ED9F36A4452897322897332897335CB16389
          C58FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31A34082F6B186FAB960D282
          C9E5CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF4FC16685FABD78EBA26ABD77FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C9E3185FAB786FAC2
          2FAC44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF79CB8984FABB86FAC631B24BFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF45BD5F86FAC079F9B2
          6DCD82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB9E9C340CF643FC860FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
      end
      object Label5: TLabel
        Left = 34
        Top = 26
        Width = 52
        Height = 15
        Caption = 'Aprovado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Image3: TImage
        Left = 101
        Top = 25
        Width = 20
        Height = 21
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDE90000B30202AE
          F6F6FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF2C2CBD110DF90E08EC5858CBFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7877D71413F61C1EFF
          0D0DB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0200BD181CFB1E26FF0D0BBFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D1F50C07D6212FFF151AEE
          5E5AD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0800CD1D2EFF2238FF141AE9E0DEF9FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF261ED51C28F5253EFF253DFF1C2BF8
          0C02D70700D00700D00700D03C35DB8883EB2920DE0A00D80A00D80A00D90A00
          D8202EF72C48FF2B45FF2B45FF2B46FF2D49FF2E4CFF2E4CFF2337FF171FF411
          0DE01312E93152FF3151FF1F29F6110BE63050FF2D49FF2D49FF2D49FF2E4AFF
          385AFF4D6FFF607EFF607EFF7692FF0D04E21E1AED3453FF2E4EFF1B25F60E08
          E53454FF324FFF324FFF324FFF3350FF273AFF171FF40D04E20D04E20D04E25B
          55EE423FF893A8FF6E88FF6C73FF0600E34161FF304FFF3050FF3050FF3050FF
          385AFF4D6FFF607EFF607EFF7692FF4541F8403CFC8DA6FF8CA3FF636BFF3023
          FF94ACFF8FA4FF8FA4FF8FA4FF90A6FF7376FF3226F61207F11207F11207F112
          07F1403DFF92A9FF8FA5FF676DFF2C20FF93ABFF8CA1FF8CA1FF8CA1FF8DA2FF
          90A6FF97B0FF99B2FF99B3FF99B3FF0800F54140FF95AEFF92ABFF6871FF2E23
          FF96AEFF8FA6FF8EA5FF8EA5FF8EA6FF8A9CFF3733FF3C39FF3D3BFF3B35FF83
          7DFC4542FF96A9FF94A6FF6D73FF4744FF7174FF9DB7FF99B2FF99B1FF99B2FF
          96AFFF93A5FF94A7FF97A7FF3833FFF7F7FF3E35FF0A00FF0900FF5952FFFFFF
          FF837FFF332AFF4441FF4340FF4340FF4340FF4441FF4441FF4745FF2C25FFFF
          FFFF}
      end
      object Label8: TLabel
        Left = 127
        Top = 26
        Width = 57
        Height = 15
        Caption = 'Reprovado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Image4: TImage
        Left = 195
        Top = 25
        Width = 20
        Height = 21
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC7A47BA6E29C8906DE9D1C5
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD6A78CCB8B30CFE1EAC8BAADB88456B76427CD9678FCF8F5FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F2EDC06200DD911DA3ACC1BED1E8CEDAE8
          D2D8DDCBA784B66A3AB97044E5C8BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC57F
          44D57E00F4BB59D4BB82988A799EA5B4CFD9EAE7F9FFFBFFFFE8DBC8CF9F7BB5
          6627FFFFFFFFFFFFFFFFFFE4C5AECB7000E7A32FFFEDBDFFD76CF6B229DB971D
          AA8652B9AFA2D4DFF3FFFFFFFFFFFFD29F75FFFFFFFFFFFFFEFCFAC26A08DD8B
          02FBDDA2FDD881F2B846F2DCAEEDD098F19A0BD78203BF7E1CC1A576D7D9D9F6
          E9DEFFFFFFFFFFFFD69F67D57B00F3C576FFE7A8F2C04EEFB851F3FFFFDFFCFF
          DD9B31DF8A09E08400D37200C67200CC8233FFFFFFF4E4D5CC7100E8A736FFEA
          B7F7CB60EEB64CEBAB33E8CA8FDDB16CDD8B0CDA8708D88200CE7C00CD7A00DA
          9D5BFFFFFFD07E21DE8D09FBE0A7FAD579F2C158EAA221F0E0C7E5F0FFDE9221
          DB8400DA8303D27E00CB7B00D17F1CFFFDFCE5BA88D67B00F4CA7FFFE398F4C1
          53EDAF3EE69813EADBC5DEEBF9D98F19D98100D67F00CA7900CF7B0BFBF3EBFF
          FFFFDC962AE5A439FFE9B0F8C75CEDB953EBBD6BE48B00E4AD57D7EDFFD49B48
          D97900CA7900CD7B0AF6E3CEFFFFFFFFFFFFE8B257FBD994FAD16AF0B645EDBC
          67FFFFFFEDD2A9DFC18DD0E3FFCEA763D07300CF7B02F0D0A9FFFFFFFFFFFFFF
          FFFFF1CB8FFFE8A9F8D072ECB041E59715EFCC93EFFFFFDCF4FFC7DCFACD8E2C
          D07200E8B56EFFFFFFFFFFFFFFFFFFFFFFFFFCF5EBF7E4C8F1CE95F0C77CEDC2
          75DF9210DA9632D59548CF831BCD7000E5A346FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEBD4F7E1B2F1CA82E7A52BDA8815DF972B
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFBF4FAEAD1F5D497EECC88F4D198FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
      end
      object Label9: TLabel
        Left = 221
        Top = 26
        Width = 56
        Height = 15
        Caption = 'Em estudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Image5: TImage
        Left = 291
        Top = 25
        Width = 20
        Height = 21
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          000010000000010018000000000000030000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDD9C8D18D53C0620DC0620DD18D53
          EDD9C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EFE7D69A
          66C36816BF5F02BF5F01BF5F01BF5F02C36816D69A66F7EFE7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF0DECCC06312BB5300C06000BE5900BF5C00C06102C06002
          C05F00BB5300C06412F0DECCFFFFFFFFFFFFFFFFFFF7F0E8C0640FBD5800C061
          02BE5900CC823CC46F1BBE5900C06102C06002C06102BD5800C0640FF7F0E8FF
          FFFFFFFFFFD69B63BB5300C06102BE5C00C46D1EFFFFFFF3E5D9C06310BD5900
          C06102C06002C06102BB5300D69B63FFFFFFEEDBC9C36811C05F00C06002C05F
          02BD5A04DCA97BFFFFFFF2E3D4C06311BD5900C06102C06002C05F00C36811EE
          DBC9D18D4EC05F00C06002C06002C06002C06001BA5000DBA777FFFFFFF2E3D4
          C06311BE5A00C06002C06002C05F00D18D4EC1630AC06002C06002C06002C060
          02C06002C06001B94F00D9A16DFFFFFFF5EADFC26817BF5D01C06002C06002C1
          630AC1630AC06001C06002C06002C06002C06002BF5E00BB5300DFB38AFFFFFF
          EED7C0C06210BF5E01C06002C06001C1630ACF8D4EBF5F00C06002C06002C060
          02BF5E00BB5200E3BB97FFFFFFEBD1B8BC5801BF5C00C06002C06002BF5F00CF
          8D4EEEDCC9C26810C05F01C06002BF5F01BF5E0AE4BE9BFFFFFFEBD1B7BC5801
          BE5C00C06002C06002C05F01C26810EEDCC9FFFFFFD69B63BB5300C06102BE5C
          00C56F21FEFFFFEDD4BDBC5801BF5C00C06002C06002C06102BB5300D69B63FF
          FFFFFFFFFFF7F0E8C06410BD5900C06102BE5900C77629C1640ABF5C00C06002
          C06002C06102BD5900C06410F7F0E8FFFFFFFFFFFFFFFFFFF0DECCC16313BB53
          00C06000BE5B00BF5E00C06002C06002C05F00BB5300C16313F0DECCFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7EFE7D69A66C36816BF5F02C06002C06002BF5F02
          C36816D69A66F7EFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFEED9C7D08D54C1630FC1630FD08D54EED9C7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
      end
      object Label3: TLabel
        Left = 317
        Top = 26
        Width = 65
        Height = 15
        Caption = 'Despachado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 6
      Width = 1185
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        1185
        38)
      object Shape1: TShape
        Left = -19
        Top = 0
        Width = 1369
        Height = 54
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = 5460819
        Pen.Style = psClear
      end
      object Label13: TLabel
        Left = 127
        Top = 9
        Width = 69
        Height = 17
        Anchors = [akTop]
        Caption = 'Qtd. Pe'#231'as:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 268
        Top = 10
        Width = 65
        Height = 17
        Anchors = [akTop]
        Caption = 'Qtd. Itens:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbInfoSigep: TLabel
        Left = 801
        Top = 3
        Width = 312
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '( Duplo clique seleciona registro para impress'#227'o Sigep Web )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15254133
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 918
      end
      object Label12: TLabel
        Left = 6
        Top = 9
        Width = 84
        Height = 17
        Caption = 'Qtd. Pedidos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbContPedidos: TLabel
        Left = 95
        Top = 9
        Width = 7
        Height = 17
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14737632
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 439
        Top = 3
        Width = 153
        Height = 17
        Anchors = [akTop]
        Caption = 'Total dos Descontos:  R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 446
        Top = 21
        Width = 189
        Height = 13
        Anchors = [akTop]
        Caption = '( Dos Itens + da forma pag. + outro )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 11447982
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edtQuantidadePedidos: TEdit
        Left = 180
        Top = 27
        Width = 185
        Height = 21
        BorderStyle = bsNone
        Color = 5460819
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14922112
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object Panel3: TPanel
        Left = 576
        Top = 0
        Width = 609
        Height = 38
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          609
          38)
        object Label11: TLabel
          Left = 414
          Top = 5
          Width = 123
          Height = 20
          Anchors = [akTop, akRight]
          Caption = 'Total L'#237'quido:  R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11447982
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 196
          Top = 5
          Width = 111
          Height = 20
          Anchors = [akTop, akRight]
          Caption = 'Total Bruto:  R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11447982
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 12
          Top = 6
          Width = 111
          Height = 20
          Anchors = [akTop, akRight]
          Caption = 'Total Custo:  R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11447982
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object DBEdit3: TDBEdit
          Left = 512
          Top = 5
          Width = 91
          Height = 21
          Anchors = [akTop, akRight]
          BorderStyle = bsNone
          Color = 5460819
          DataField = 'TOT_VALOR'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6930274
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 283
          Top = 5
          Width = 91
          Height = 21
          Anchors = [akTop, akRight]
          BorderStyle = bsNone
          Color = 5460819
          DataField = 'TOT_VALOR_BRUTO'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6930274
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 99
          Top = 6
          Width = 74
          Height = 21
          Anchors = [akTop, akRight]
          BorderStyle = bsNone
          Color = 5460819
          DataField = 'TOT_CUSTO'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6930274
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      object DBEdit1: TDBEdit
        Left = 199
        Top = 8
        Width = 68
        Height = 21
        Anchors = [akTop]
        BorderStyle = bsNone
        Color = 5460819
        DataField = 'TOTAL_PECAS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14737632
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 336
        Top = 8
        Width = 71
        Height = 21
        Anchors = [akTop]
        BorderStyle = bsNone
        Color = 5460819
        DataField = 'TOTAL_ITENS'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14737632
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object chkSelecionar: TCheckBox
        Left = 881
        Top = 18
        Width = 129
        Height = 17
        Anchors = [akTop, akRight]
        Caption = ' Selecionar todos'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 4
        OnClick = chkSelecionarClick
      end
      object DBEdit4: TDBEdit
        Left = 597
        Top = 2
        Width = 98
        Height = 21
        Anchors = [akTop]
        BorderStyle = bsNone
        Color = 5460819
        DataField = 'TOT_DESCONTO'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14737632
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object GroupBox1: TGroupBox
      Left = 577
      Top = 55
      Width = 595
      Height = 58
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Op'#231#245'es '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3552822
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        595
        58)
      object btnImprimir: TSpeedButton
        Left = 179
        Top = 17
        Width = 160
        Height = 30
        Caption = '<Ctrl + P>  Imprimir'
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00D7C39B00ECE3D600ECE3D600ECE3D600ECE3D600ECE3
          D600ECE3D600D7C39B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00735F3700887F7200887F7200887F7200887F7200887F
          7200887F7200735F37009B9B9B009B9B9B009B9B9B009B9B9B00B0ACAC00B1AC
          AC00A7A2A200726C7300C4AB7F00EDE1D500EDE1D500EDE1D500EDE1D500EDE1
          D500EDE1D500C4AB7F0076717700A49E9E00A9A4A400ABA5A5004C4848004D48
          4800433E3E000E080F0060471B00897D7100897D7100897D7100897D7100897D
          7100897D710060471B00120D1300403A3A004540400047414100958F8F00C3C0
          BF00C3C0BF00837D8400C6A87400E0CBAE00E0CBAE00E0CBAE00E0CBAE00E0CB
          AE00E0CBAE00C6A87400837D8400C3C0BF00C3C0BF0099929200312B2B005F5C
          5B005F5C5B001F192000624410007C674A007C674A007C674A007C674A007C67
          4A007C674A00624410001F1920005F5C5B005F5C5B00352E2E00A49FA100D1CF
          CE00D1CFCE00D3D2D100D2D2D300D0D0D200D0D0D200D0D0D200D0D0D200D0D0
          D200D0D0D200D2D2D300D3D2D100BACAD7006E9BE300A49FA100403B3D006D6B
          6A006D6B6A006F6E6D006E6E6F006C6C6E006C6C6E006C6C6E006C6C6E006C6C
          6E006C6C6E006E6E6F006F6E6D00566673000A377F00403B3D00AAA7A700D9D7
          D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7
          D700D9D7D700D9D7D700D9D7D7008AC3E900004BFB00ABA8A800464343007573
          7300757373007573730075737300757373007573730075737300757373007573
          7300757373007573730075737300265F85000000970047444400B7B3B300E6E8
          E900D6C5AF00BC6B1000BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A
          0F00BB6A0F00BB6A0F00BC6B1000D6C5AF00E6E8E900B8B5B500534F4F008284
          850072614B005807000057060000570600005706000057060000570600005706
          000057060000570600005807000072614B008284850054515100BCB9BA00EEF2
          F500BA7B3E00E1A94200E1A84200E1A84200E1A84200E1A84200E1A84200E1A8
          4200E1A84200E1A84200E1A94200BA7B3E00EEF2F500BFBBBC00585556008A8E
          9100561700007D4500007D4400007D4400007D4400007D4400007D4400007D44
          00007D4400007D4400007D450000561700008A8E91005B575800CDC8C900F8FC
          FF00CD975300EEC67000EEC77100EEC77100EEC77100EEC77100EEC77100EEC7
          7100EEC77100EEC77100EEC67000CD975300F8FCFF00CECBCC00696465009498
          9B00693300008A620C008A630D008A630D008A630D008A630D008A630D008A63
          0D008A630D008A630D008A620C006933000094989B006A676800D2D0D000FCFF
          FF00D7A55C00EDC97700E9BF6800E9BF6800E9BF6800E9BF6800E9BF6800E9BF
          6800E9BF6800E9BF6800EDC97700D7A55C00FCFFFF00D4D1D0006E6C6C00989B
          9B007341000089651300855B0400855B0400855B0400855B0400855B0400855B
          0400855B0400855B04008965130073410000989B9B00706D6C00DEDCDB00FFFF
          FF00E8C07000E0AC5400B99D6B00D7BD9100D7BD9100D7BD9100D7BD9100D7BD
          9100D7BD9100B99D6B00E0AC5400E8C07000FFFFFF00E3DFDF007A7877009B9B
          9B00845C0C007C4800005539070073592D0073592D0073592D0073592D007359
          2D0073592D00553907007C480000845C0C009B9B9B007F7B7B00D1CBCD00BCBB
          C000DEB67300CF9E5F00C4AB7F00DFCAAD00DFCAAD00DFCAAD00DFCAAD00DFCA
          AD00DFCAAD00C4AB7F00CD995600DDB36E00BEBDC100D1CACC006D6769005857
          5C007A520F006B3A000060471B007B6649007B6649007B6649007B6649007B66
          49007B66490060471B0069350000794F0A005A595D006D666800FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00D0BD9800ECDFD100ECDFD100ECDFD100ECDFD100ECDF
          D100ECDFD100D0BD9800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B006C593400887B6D00887B6D00887B6D00887B6D00887B
          6D00887B6D006C5934009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00D5C4A400EFE4D800EFE4D800EFE4D800EFE4D800EFE4
          D800EFE4D800D5C4A400FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00716040008B8074008B8074008B8074008B8074008B80
          74008B807400716040009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00DED0B800F5EDE400F5EDE400F5EDE400F5EDE400F5ED
          E400F5EDE400DED0B800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B007A6C5400918980009189800091898000918980009189
          8000918980007A6C54009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E2D6C100F8F3EA00F8F3EA00F8F3EA00F8F3EA00F8F3
          EA00F8F3EA00E2D6C100FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B007E725D00948F8600948F8600948F8600948F8600948F
          8600948F86007E725D009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E7DDCD00EFE8DB00EFE8DB00EFE8DB00EFE8DB00EFE8
          DB00EFE8DB00E8DFD000FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00837969008B8477008B8477008B8477008B8477008B84
          77008B847700847B6C009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        OnClick = btnImprimirClick
      end
      object btnConfigEmail: TSpeedButton
        Left = 520
        Top = 17
        Width = 22
        Height = 30
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFEBDCC7A8773B905B1DEBE0CFEBE0CF915C1E955D1DE4D2B7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA77944DF9E51DE9C4B77
          4B16754916DE9B4BDF9E51A47740FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DFCE
          92734A917A5A5D3911E0A255E0A255DC9949DB9746E1A357E0A05258360F9780
          6194754DE9DECDFFFFFFFDFCFA8E6533E9AF68DE9C4BDA9543F3C382FFDEAAFF
          EFC0FFEFC2FFE0ADF5C586DA9544DE9B4BE9AF688E6533FDFCFAEFE9E08A571B
          FAD197FAD197FED79DFFE6B4F6C688E4A85FE4A85FF7CA8DFFE9BAFFD8A2FCD2
          98FAD1978A571BEFE9E0FFFFFFD8CDBECB812AFED79EFFD8A2DF9E50643D119B
          611E9B611E684112E0A255FFDEAAFFD8A2CB812AD8CDBEFFFFFFC7AE89836640
          E2A65AFCD298E7AD64673F12A46720FFFFFFFFFFFFA46720754916E8AE67FCD3
          99E2A65A836640C7AE89D1842CFFDEABFFDAA4F1BE7BD28730905B1DFFFFFFFF
          FFFFFFFFFFFFFFFFA46720D1852DEEB975FFD9A3FFDEABD1842CD58D39FFE4B1
          FFE2AEE8AE67D0842BAB6C23FFFFFFFFFFFFFFFFFFFFFFFFAD6E23C07A27E6AB
          61FFE0ADFFE4B1D58D39D4B78DAB7F4AF3C384EDB671D58D37A568209B611EFF
          FFFFFFFFFF9B611E9B611ECB812AE9B26AF5C586AB7F4AD4B78DFFFFFFEBDBC4
          E6AB61FFDEA7D0842BC47D28C47D289B611E9B611EB77525B47225C07A27FFDE
          A7E6AB61EBDBC4FFFFFFFBF1E3DC9949FFEFC2FFF9D0F7CA8DB27024A66921A2
          661F9E631F9D631FA76A21F6C98AFFF9D0FFEFC2DC9949FBF1E3FFFDFBE0A459
          FFE4B4FDD49CFFE0ACFFE2AFD58D37C67E2AC47D28D48C35FFE2AEFFE0ACFDD4
          9CFFE4B4E0A459FFFDFBFFFFFFFAEBD6E2A963EACB9FE1A75FFFF9D0FFF9D0FF
          F3C6FFF3C6FFF9D0FFF9D0E1A75FEACB9FE2A963FAEBD6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEEC186FFF9D0FFF9CFE5AC66E5AC66FFF9CFFFF9D0EEC187FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE7CBEBB875E9AF68FE
          F8EFFEF8EFE9AF68EDBB7BFAE8CDFFFFFFFFFFFFFFFFFFFFFFFF}
        Visible = False
        OnClick = btnConfigEmailClick
      end
      object btnBuscar: TBitBtn
        Left = 10
        Top = 17
        Width = 160
        Height = 30
        Caption = ' Buscar Pedidos'
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF0094713B0094713B0094713B0096713B0096713B0096713B0096713B009671
          3B0096713B0094713B0094713B005D3E24002F5B91002F5B91009B9B9B009B9B
          9B00300D0000300D0000300D0000320D0000320D0000320D0000320D0000320D
          0000320D0000300D0000300D00000000000000002D0000002D00FFFFFF00FFFF
          FF0094713B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C2D1F6002F5B9100C1FFFF00005FDE009B9B9B009B9B
          9B00300D00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
          9B009B9B9B009B9B9B005E6D920000002D005D9B9B0000007A00FFFFFF00FFFF
          FF00A3845300FAEEEE00B9836100B8816000BC876700C5916F00C8967400BE8B
          6B00CC8F6400714B4B002F5B9100B6FFFF00005FDE00FFFFFF009B9B9B009B9B
          9B003F200000968A8A00551F0000541D000058230300612D0B00643210005A27
          0700682B00000D00000000002D00529B9B0000007A009B9B9B00FFFFFF00FFFF
          FF00A3845300FFFFFF00F8F8F500FFFFFF00ECF1F7009877710098777100925B
          4C00D9E4EB002F5B9100AEFBFF00005FDE00543B2100FFFFFF009B9B9B009B9B
          9B003F2000009B9B9B00949491009B9B9B00888D930034130D0034130D002E00
          00007580870000002D004A979B0000007A00000000009B9B9B00FFFFFF00FFFF
          FF00A3845300F3E3DE00C8906E008F513A0072453500DCD09F00F6F5C500FFFF
          FD00925B4C0059709700005FDE00B8C0C60075460500FFFFFF009B9B9B009B9B
          9B003F2000008F7F7A00642C0A002B0000000E000000786C3B00929161009B9B
          99002E000000000C330000007A00545C6200110000009B9B9B00FFFFFF00FFFF
          FF00AD906000FFFFFF00F3F9F90098777100F8D69E00FBEBC000FFFAD900FFFF
          FD00FFFFFF00A9614B00D2DFEB00FFFBE70075460500FFFFFF009B9B9B009B9B
          9B00492C00009B9B9B008F95950034130D0094723A0097875C009B9675009B9B
          99009B9B9B00450000006E7B87009B978300110000009B9B9B00FFFFFF00FFFF
          FF00AD906000F9E9E1008D5B4A00C4896200F2C69A00ECD2B000FEF8DA00FAF5
          DE00FFFFFF00DBD0CE00BF887500F8F9F20078470600FFFFFF009B9B9B009B9B
          9B00492C000095857D0029000000602500008E623600886E4C009A9476009691
          7A009B9B9B00776C6A005B24110094958E00140000009B9B9B00FFFFFF00FFFF
          FF00AC916700FFFFFF00C3B6B800C4835A00F6D8AC00F0DABE00F8EAD000FEF8
          DE00FFFDE300E9E4D100BEB0B100FAF6EE00784A0800FFFFFF009B9B9B009B9B
          9B00482D03009B9B9B005F525400601F0000927448008C765A0094866C009A94
          7A009B997F0085806D005A4C4D0096928A00140000009B9B9B00FFFFFF00FFFF
          FF00B19F7C00FCEDE700A77D6C00BA745500FCDEAB00FFFFFF00F1DEBF00F2E0
          BB00FFFDD300CCBC9800AC877D00EDE5D7007A4C0B00FFFFFF009B9B9B009B9B
          9B004D3B1800988983004319080056100000987A47009B9B9B008D7A5B008E7C
          57009B996F00685834004823190089817300160000009B9B9B00FFFFFF00FFFF
          FF00BAA18000FFFFFF00FFFFFF00A5766800D6895200FBE0A900F2DAAE00F6D9
          A100F6D9A1008E6A6200DCD1CD00D9CDB5007D501000FFFFFF009B9B9B009B9B
          9B00563D1C009B9B9B009B9B9B004112040072250000977C45008E764A009275
          3D0092753D002A060000786D690075695100190000009B9B9B00FFFFFF00FFFF
          FF00C6B19100F5E8E300C28A6900B98E7B00B0897F00B8714F00CC8C6300D09D
          7700A0786C00874B2D00AD7A5100C0AC880081551800FFFFFF009B9B9B009B9B
          9B00624D2D0091847F005E260500552A17004C251B00540D0000682800006C39
          13003C14080023000000491600005C4824001D0000009B9B9B00FFFFFF00FFFF
          FF00C4B19200FFFFFF00FCFFFF00FFFFFF00F8FBFA00CFC6C200C6B5B600B3A1
          9A00CCBA9E00F9F8F000E5E1D000B3976D00865A1D00FFFFFF009B9B9B009B9B
          9B00604D2E009B9B9B00989B9B009B9B9B00949796006B625E00625152004F3D
          360068563A0095948C00817D6C004F330900220000009B9B9B00FFFFFF00FFFF
          FF00C8B89A00F2E6DF00BD856300BE866400BC856300BB856300BF8463009C62
          3D00CDBA9900E5E1D000CCB69B009C774100FFFFFF00FFFFFF009B9B9B009B9B
          9B00645436008E827B00592100005A22000058210000572100005B2000003800
          000069563500817D6C0068523700381300009B9B9B009B9B9B00FFFFFF00FFFF
          FF00C8B89A00FFFFFF00FFFFFF00FFFFFF00FCFCFA00EDEDEA00EBE5D900D3C0
          A100B9A88300D4C5AF00946D3100FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B00645436009B9B9B009B9B9B009B9B9B009898960089898600878175006F5C
          3D0055441F0070614B00300900009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00C8BA9D00FFFFFF00FFFFFF00F8F6F500F0E5DE00DED5C400D5C2AA00BEA5
          7E009A7B44009D774100FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B00645639009B9B9B009B9B9B00949291008C817A007A716000715E46005A41
          1A0036170000391300009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00C8B89A00CCB89C00C6B49700C3AF9000C2AE9000BFA78000BBA07700A991
          60008D652D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B006454360068543800625033005F4B2C005E4A2C005B431C00573C1300452D
          0000290100009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object btnEnviarEmail: TBitBtn
        Left = 348
        Top = 17
        Width = 171
        Height = 30
        Caption = 'Enviar relat'#243'rio por e-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3552822
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFCF9F7DFC4B0C28C57BA7221C1781DC1771BC0761ABB7C38CDA179F0E3
          D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC3B0BB7221D6901DD38B1EC67E1CBA
          701DBB7329BE741CCC831DD38B1DB87B4AFFFFFFFFFFFFFFFFFFFFFFFFDFC3AF
          CB8726D99426C38A59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6EDE7C57F2BDB9932D8B69CFFFFFFCDA179CB935FD7
          B395FFFFFFCC9E77C8925FD5B194F6EEE8FFFFFFFFFFFFFFFFFFDAB494E2A63C
          D09F75F4EAE2CC8933E4A73EDD9E3AD99A39BC7229DB9B3AE2A23CE2A43CCE8A
          34D6AF8FFFFFFFFFFFFFCB9050DD9F40F2E5DCD0975EE9B04AC88B4EFFFFFFC9
          9059E0A443E9B14BCA935FDAB696DB9D3ED99B3EE0C3AAFEFDFCD4953FD3933A
          FDFAF8D9A04EE0A949EDD9C7FFFFFFFFFFFFCB9153EBB753D3A16EFFFFFFDCB9
          9BE4AC4CD39A57E8CFB8DCAA60DA9D4AFCF7F4DDA354E3AE52EEDAC4FFFFFFFF
          FFFFEAD4BDE4AE52D7A051FFFFFFFFFFFFD49A4EE0A749D1995AE1B472E1B570
          FFFFFFD9A35CE8B557E1BF9BFFFFFFFFFFFFFFFFFFE0AA54E1AC55EFDCCBFFFF
          FFDCAC74E6B867DFAF6FDEAD6DEDCB8FFCF8F3DFB586F8D992D49343FFFFFFFF
          FFFFFFFFFFDCA45AEAB85FEBD1B4FFFFFFE4BE8AECC88BE2BA80E6C39AFAE1AB
          E2B985FFFFFFDFB270FBE6B0DDAF73F7ECDFEDD7B6E2B472F9E2A8E4BE8DFFFF
          FFE4BA83EFCD8FE3B97DF5E6D4EDCC8EEBC789FAF3EBF6EBDDE5BA76FAE5B1EF
          CB8EF4D79DEDC98CF8E1AEE2B574FFFFFFEAC484ECC687E3BA87FFFFFFE4B981
          FAE8B4E5B66EFFFEFCFCF6F0E2B97EEAC68AE7BF86E9C8A0ECCE9FFFFFFFF6E7
          D2FCEAB7E3B879EDD1AEFFFFFFFFFEFDE4B56CFCECBDEBC280EDCFA5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF4E0C0FBE8B9E8BE76ECCEA9FFFFFFFFFFFFFFFFFF
          FEFCF9E9BE7EF6D9A1FAE6B5F2D594EABF77EBC078EFCC87F8E1ADFBE4B1E8BD
          75F5E4CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E3C8EFCD96F1C883F3
          CF8BF3CD89F2CB88EDC584F3DCB6F6E5CCFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 1
        OnClick = btnEnviarEmailClick
      end
      object btnArquivoSigep: TBitBtn
        Left = 454
        Top = 17
        Width = 129
        Height = 30
        Anchors = [akTop, akRight]
        Caption = 'Gerar Sigep Web'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000CDCACC007A72
          76007A7276007A7276007A7276007A7276007A7276007A7276007A7276007A72
          76007A7276007A7276007A7276007A7276007A727600AAA6A80069666800160E
          1200160E1200160E1200160E1200160E1200160E1200160E1200160E1200160E
          1200160E1200160E1200160E1200160E1200160E120046424400AAA4A700BFBC
          BB00AFABAB00B1B1B700B4A79600BD914500B1AFB600B1ADAE00B1ADAE00B1AF
          B600BD914500B4A79600B1B1B700B1ABAC00C0BDBC0091898C00464043005B58
          57004B4747004D4D530050433200592D00004D4B52004D494A004D494A004D4B
          5200592D0000504332004D4D53004D4748005C5958002D252800AEA8AB00EAEC
          EA00D9D8D700DBDEE600DBD2BE00DFB15800DADEE500DBDBDB00DBD9DB00DADE
          E500DEB15800DBD2BE00DBDEE600DAD7D600EEEFED0091898C004A4447008688
          860075747300777A8200776E5A007B4D0000767A81007777770077757700767A
          81007A4D0000776E5A00777A8200767372008A8B89002D252800ABA3A600E1DF
          DB00D0CCCA00D2D2D800D4C8B700D8AE6100D2D3D700D3D0D000D4D1CF00D3D3
          D800D8AE6200D5CAB800D3D4D800D2CFCC00E5E3E00091898B00473F42007D7B
          77006C6866006E6E740070645300744A00006E6F73006F6C6C00706D6B006F6F
          7400744A0000716654006F7074006E6B6800817F7C002D252700A9A9BB00E0B4
          5E00D6AA5B00DBB16D00DEB16900E0A84A00DEBF8300E2C18300E4C38800E5C7
          9300E9BA6600E8CB9100E9D3A000E7D19D00FBE5AE00938E9A00454557007C50
          000072460000774D09007A4D05007C4400007A5B1F007E5D1F00805F24008163
          2F008556020084672D00856F3C00836D390097814A002F2A3600AEAEBF00E9F3
          FF00D9E1F000D9E6FD00DBD9D800DEBC8100D9E3F500D9E0ED00D9DEEB00D9DF
          F200DCB87B00D9D3CF00D7DFF000D6D8E100E9EEF80099949F004A4A5B00858F
          9B00757D8C0075829900777574007A581D00757F9100757C8900757A8700757B
          8E0078541700756F6B00737B8C0072747D00858A940035303B00B5AEB100ECEC
          EA00DCDBD900DEE0E500DFD7CA00E3C08000DDE0E500DEDDDB00DEDDDB00DDE0
          E500E3C08100DFD7CA00DEE0E500DDDBD900EFEFEE00A49D9F00514A4D008888
          8600787775007A7C81007B7366007F5C1C00797C81007A7977007A797700797C
          81007F5C1D007B7366007A7C8100797775008B8B8A0040393B00BAB4BA00EEEF
          EE00E0DFE000E2E4EA00E3DACF00E6C68E00E2E3E900E2E1E100E2E0E100E1E3
          E800E4C68E00E1DBCE00E1E4E800E1DDDD00F1F1F000A9A2A600565056008A8B
          8A007C7B7C007E8086007F766B0082622A007E7F85007E7D7D007E7C7D007D7F
          840080622A007D776A007D8084007D7979008D8D8C00453E4200BDBAC100E1AE
          4D00DBA94F00DEB05F00E0B26100E3AD4F00E4C07900E8C07900E8C38200EBC9
          8C00EEC36F00EECC8E00EED39B00EED49A00FFE5A700ADA6AD0059565D007D4A
          0000774500007A4C00007C4E00007F490000805C1500845C1500845F1E008765
          28008A5F0B008A682A008A6F37008A7036009B81430049424900C1BEC400F5F8
          FB00E8E9EE00E9EDF600E8E4DC00EBD09F00E8EBF400E8EAED00E8E9ED00E8EB
          F200EACF9F00E9E3DA00E8ECF300E7E7E800F5F8FA00B1ABB1005D5A60009194
          970084858A008589920084807800876C3B008487900084868900848589008487
          8E00866B3B00857F760084888F0083838400919496004D474D00C3C1C300FAF9
          FB00EBE9EB00ECEDF400EDE7DF00EED7A500ECEDF400ECEBEE00ECEBEE00ECEB
          F400EED6A400EDE6DE00ECECF300EBE8EA00FBFBFD00B8B0B4005F5D5F009695
          9700878587008889900089837B008A7341008889900088878A0088878A008887
          90008A72400089827A0088888F008784860097979900544C5000D2C5CB00FFFE
          FF00FFEEF900FFF2FF00FFEBEA00FFDCB100FFF2FF00FFF0FB00FFF0FB00FFF2
          FF00FFDCB200FFECEA00FFF3FF00FFF0FA00FFFFFF00C9B6C1006E6167009B9A
          9B009B8A95009B8E9B009B8786009B784D009B8E9B009B8C97009B8C97009B8E
          9B009B784E009B8886009B8F9B009B8C96009B9B9B0065525D00CFC2C80033D5
          71001EC045001FC44E002AC6530099C9640022C4500024C44F0025C44F0020C4
          500068C65E0034C654001EC44D0025C34F001CCB4C00C6B2BD006B5E64000071
          0D00005C00000060000000620000356500000060000000600000006000000060
          0000046200000062000000600000005F000000670000624E5900CFC2C8002CDE
          83001BCA66001ECD6D0024CE6D0094D377001FCE6D0020CD6C0022CD6C001CCD
          6C0063D3730030CE6D001BCD6C0022CD6C0017D56900C6B2BD006B5E6400007A
          1F000066020000690900006A0900306F1300006A090000690800006908000069
          0800006F0F00006A0900006908000069080000710500624E5900CFC2C8008EE3
          C20092DDC10092DDC1008FDDC2008FDDC1008FDDC20091DDC10091DDC10091DD
          C10090DDC20090DDC20092DDC10092DDC10090E2C600C6B2BD006B5E64002A7F
          5E002E795D002E795D002B795E002B795D002B795E002D795D002D795D002D79
          5D002C795E002C795E002E795D002E795D002C7E6200624E5900E5E2E300D8D5
          D800D9D3D600D9D3D500D6D3D500CCD1D600D7D3D500D9D3D500D9D3D500D9D3
          D500D0D3D500D7D3D500D9D3D500D9D3D500DBD7DC00E1DCDD00817E7F007471
          7400756F7200756F7100726F7100686D7200736F7100756F7100756F7100756F
          71006C6F7100736F7100756F7100756F7100777378007D787900}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = btnArquivoSigepClick
      end
    end
    object pnlConfigEmail: TPanel
      Left = 109
      Top = 107
      Width = 1115
      Height = 110
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'pnlConfigEmail'
      TabOrder = 4
      Visible = False
      object Label14: TLabel
        Left = 9
        Top = 6
        Width = 88
        Height = 13
        Caption = 'Nome remetente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 142
        Top = 6
        Width = 43
        Height = 13
        Caption = 'Assunto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 361
        Top = 6
        Width = 29
        Height = 13
        Caption = 'Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 9
        Top = 54
        Width = 109
        Height = 13
        Caption = 'E-mail ( envio c'#243'pia )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 1057
        Top = 6
        Width = 52
        Height = 13
        Cursor = crHandPoint
        Caption = '[X] Fechar'
        Color = clMenuBar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentColor = False
        ParentFont = False
        OnClick = Label18Click
      end
      object edtNome: TEdit
        Left = 9
        Top = 21
        Width = 121
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Text = 'Cristiano'
      end
      object edtAssunto: TEdit
        Left = 142
        Top = 21
        Width = 203
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Text = 'Relat'#243'rio de Vendas'
      end
      object memoTexto: TMemo
        Left = 361
        Top = 21
        Width = 736
        Height = 84
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtEmailCopia: TEdit
        Left = 9
        Top = 69
        Width = 336
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Text = 'cristiano@babyduck.com.br'
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 95
    Width = 1171
    Height = 375
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object Splitter5: TSplitter
      Left = 1
      Top = 60
      Width = 1169
      Height = 8
      Cursor = crDefault
      Align = alTop
      ResizeStyle = rsNone
      ExplicitWidth = 1286
    end
    object gridPedidos: TDBGridCBN
      Left = 1
      Top = 68
      Width = 1169
      Height = 306
      Align = alClient
      Color = 14803425
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = gridPedidosDrawColumnCell
      OnDblClick = gridPedidosDblClick
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
    end
    object grpAnalitico: TGroupBox
      Left = 1
      Top = 1
      Width = 1169
      Height = 59
      Align = alTop
      Caption = ' Filtros [ anal'#237'tico ]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      inline BuscaCor1: TBuscaCor
        Left = 728
        Top = 6
        Width = 427
        Height = 47
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 728
        ExplicitTop = 6
        ExplicitHeight = 47
        inherited edtCodigo: TCurrencyEdit
          Top = 8
          ExplicitTop = 8
        end
        inherited StaticText2: TStaticText
          Width = 20
          Caption = 'Cor'
          Font.Style = []
          ExplicitWidth = 20
        end
        inherited StaticText1: TStaticText
          Width = 56
          Font.Style = []
          ExplicitWidth = 56
        end
        inherited edtDescricao: TEdit
          Font.Name = 'Segoe UI'
          ParentFont = False
        end
        inherited edtReferencia: TEdit
          Font.Name = 'Segoe UI'
          ParentFont = False
        end
      end
      inline BuscaProduto1: TBuscaProduto
        Left = 104
        Top = 6
        Width = 549
        Height = 49
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 104
        ExplicitTop = 6
        ExplicitWidth = 549
        ExplicitHeight = 49
        inherited StaticText3: TStaticText
          Width = 33
          Font.Style = []
          ExplicitWidth = 33
        end
        inherited StaticText1: TStaticText
          Width = 56
          Font.Style = []
          ExplicitWidth = 56
        end
        inherited StaticText2: TStaticText
          Width = 41
          Font.Style = []
          ExplicitWidth = 41
        end
        inherited edtReferencia: TEdit
          Font.Name = 'Segoe UI'
          ParentFont = False
        end
        inherited edtDescricao: TEdit
          Font.Name = 'Segoe UI'
          ParentFont = False
        end
        inherited edtGrade: TEdit
          Font.Name = 'Segoe UI'
          ParentFont = False
        end
      end
    end
    object RLReport1: TRLReport
      Left = 652
      Top = 457
      Width = 1123
      Height = 794
      Margins.LeftMargin = 5.000000000000000000
      Margins.RightMargin = 5.000000000000000000
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      PageSetup.Orientation = poLandscape
      Visible = False
      BeforePrint = RLReport1BeforePrint
      object RLBand1: TRLBand
        Left = 20
        Top = 39
        Width = 1083
        Height = 83
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel12: TRLLabel
          Left = 0
          Top = 13
          Width = 1081
          Height = 24
          Alignment = taCenter
          Caption = 'Relat'#243'rio de Vendas Por Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 8
          Top = 53
          Width = 115
          Height = 16
          Caption = 'Per'#237'odo do Filtro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbPeriodo: TRLLabel
          Left = 126
          Top = 53
          Width = 48
          Height = 16
          Caption = 'Per'#237'odo'
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 885
          Top = 53
          Width = 39
          Height = 16
          Text = ''
        end
        object RLLabel14: TRLLabel
          Left = 846
          Top = 53
          Width = 35
          Height = 16
          Caption = 'Data:'
        end
        object RLLabel15: TRLLabel
          Left = 966
          Top = 53
          Width = 35
          Height = 16
          Caption = 'Hora:'
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 1005
          Top = 53
          Width = 39
          Height = 16
          Info = itHour
          Text = ''
        end
        object RLLabel36: TRLLabel
          Left = 304
          Top = 53
          Width = 134
          Height = 16
          Caption = 'Filtrado por data de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel37: TRLLabel
          Left = 440
          Top = 53
          Width = 46
          Height = 15
          Caption = 'Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel40: TRLLabel
          Left = 612
          Top = 53
          Width = 46
          Height = 15
          Caption = 'Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel41: TRLLabel
          Left = 550
          Top = 53
          Width = 59
          Height = 16
          Caption = 'Pedidos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand6: TRLBand
        Left = 20
        Top = 228
        Width = 1083
        Height = 40
        AlignToBottom = True
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDraw4: TRLDraw
          Left = 711
          Top = 1
          Width = 374
          Height = 38
          Brush.Color = 15461355
          Pen.Style = psClear
        end
        object RLDBResult5: TRLDBResult
          Left = 992
          Top = 21
          Width = 88
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_LIQUIDO'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult6: TRLDBResult
          Left = 809
          Top = 21
          Width = 88
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'TOTAL_DESCONTOS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel18: TRLLabel
          Left = 810
          Top = 3
          Width = 88
          Height = 15
          Caption = 'Total Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel19: TRLLabel
          Left = 1005
          Top = 3
          Width = 75
          Height = 15
          Caption = 'Total L'#237'quido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 725
          Top = 4
          Width = 70
          Height = 15
          Caption = 'Total Pe'#231'as'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult4: TRLDBResult
          Left = 723
          Top = 21
          Width = 70
          Height = 15
          Alignment = taRightJustify
          DataField = 'QTD_PECAS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel43: TRLLabel
          Left = 923
          Top = 3
          Width = 65
          Height = 15
          Caption = 'Total Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult13: TRLDBResult
          Left = 906
          Top = 21
          Width = 82
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL_BRUTO'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
      end
      object RLGroup1: TRLGroup
        Left = 20
        Top = 122
        Width = 1083
        Height = 106
        DataFields = 'COD_REPRES'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 1083
          Height = 45
          BandType = btHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object rlbPercEstoque: TRLLabel
            Left = 930
            Top = 27
            Width = 122
            Height = 15
            Caption = '% Estoque Dispon'#237'vel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw1: TRLDraw
            Left = -2
            Top = 0
            Width = 1087
            Height = 23
            Brush.Color = 15461355
            Pen.Style = psClear
          end
          object RLDBText1: TRLDBText
            Left = 113
            Top = 5
            Width = 41
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'COD_REPRES'
            DataSource = DataSource1
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 164
            Top = 5
            Width = 117
            Height = 16
            DataField = 'REPRESENTANTE'
            DataSource = DataSource1
            Text = ''
          end
          object RLLabel1: TRLLabel
            Left = 155
            Top = 5
            Width = 8
            Height = 16
            Caption = '-'
          end
          object RLLabel2: TRLLabel
            Left = -2
            Top = 5
            Width = 100
            Height = 16
            Caption = 'Representante:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel3: TRLLabel
            Left = 0
            Top = 27
            Width = 57
            Height = 15
            Caption = 'N'#186' Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel4: TRLLabel
            Left = 136
            Top = 27
            Width = 42
            Height = 15
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 472
            Top = 27
            Width = 73
            Height = 15
            Caption = 'Dt. Cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 553
            Top = 27
            Width = 79
            Height = 15
            Caption = 'Dt. Represen.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 641
            Top = 27
            Width = 81
            Height = 15
            Caption = 'Dt. Recebime.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 833
            Top = 27
            Width = 81
            Height = 15
            Caption = 'Tot. Desconto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 1006
            Top = 27
            Width = 75
            Height = 15
            Caption = 'Total L'#237'quido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel10: TRLLabel
            Left = 64
            Top = 27
            Width = 64
            Height = 15
            Caption = 'Aprova'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel11: TRLLabel
            Left = 729
            Top = 27
            Width = 53
            Height = 15
            Caption = 'Faturado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel17: TRLLabel
            Left = 790
            Top = 27
            Width = 39
            Height = 15
            Caption = 'Pe'#231'as'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel42: TRLLabel
            Left = 927
            Top = 27
            Width = 65
            Height = 15
            Caption = 'Total Bruto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 45
          Width = 1083
          Height = 26
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object rldbPercEstoque: TRLDBText
            Left = 939
            Top = 5
            Width = 102
            Height = 15
            Alignment = taCenter
            DataField = 'PERC_ESTOQUE'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 1
            Top = 4
            Width = 57
            Height = 15
            DataField = 'NUMPEDIDO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 136
            Top = 4
            Width = 310
            Height = 15
            DataField = 'CLIENTE'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 553
            Top = 4
            Width = 79
            Height = 15
            Alignment = taCenter
            DataField = 'DT_REPRESENTANTE'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 472
            Top = 4
            Width = 73
            Height = 15
            Alignment = taCenter
            DataField = 'DT_CADASTRO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 642
            Top = 4
            Width = 80
            Height = 15
            Alignment = taCenter
            DataField = 'DT_RECEBIMENTO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 826
            Top = 5
            Width = 88
            Height = 15
            Alignment = taRightJustify
            DataField = 'TOTAL_DESCONTOS'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 1000
            Top = 5
            Width = 80
            Height = 15
            Alignment = taRightJustify
            DataField = 'TOTAL_LIQUIDO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText10: TRLDBText
            Left = 64
            Top = 4
            Width = 64
            Height = 15
            Alignment = taCenter
            DataField = 'STATUS'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText11: TRLDBText
            Left = 729
            Top = 4
            Width = 53
            Height = 15
            Alignment = taCenter
            DataField = 'FATURADO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText12: TRLDBText
            Left = 790
            Top = 4
            Width = 39
            Height = 15
            Alignment = taRightJustify
            DataField = 'QTD_PECAS'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText34: TRLDBText
            Left = 904
            Top = 5
            Width = 90
            Height = 15
            Alignment = taRightJustify
            DataField = 'TOTAL_BRUTO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 71
          Width = 1083
          Height = 26
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Options = [boOptimisticPageBreak]
          object RLDraw2: TRLDraw
            Left = 784
            Top = 0
            Width = 299
            Height = 25
            Brush.Color = 15461355
            Pen.Style = psClear
          end
          object RLDBResult1: TRLDBResult
            Left = 993
            Top = 5
            Width = 88
            Height = 15
            Alignment = taRightJustify
            DataField = 'TOTAL_LIQUIDO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLDBResult2: TRLDBResult
            Left = 826
            Top = 5
            Width = 88
            Height = 15
            Alignment = taRightJustify
            DataField = 'TOTAL_DESCONTOS'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLDBResult3: TRLDBResult
            Left = 790
            Top = 5
            Width = 39
            Height = 15
            Alignment = taRightJustify
            DataField = 'QTD_PECAS'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLDBResult14: TRLDBResult
            Left = 869
            Top = 5
            Width = 125
            Height = 15
            Alignment = taRightJustify
            DataField = 'TOTAL_BRUTO'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
        end
      end
    end
  end
  object RLReport2: TRLReport
    Left = -968
    Top = 570
    Width = 1123
    Height = 794
    Margins.LeftMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Visible = False
    BeforePrint = RLReport2BeforePrint
    object RLBand5: TRLBand
      Left = 20
      Top = 39
      Width = 1083
      Height = 83
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel20: TRLLabel
        Left = 0
        Top = 13
        Width = 1081
        Height = 24
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Vendas Por Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 8
        Top = 53
        Width = 115
        Height = 16
        Caption = 'Per'#237'odo do Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPeriodo2: TRLLabel
        Left = 126
        Top = 53
        Width = 48
        Height = 16
        Caption = 'Per'#237'odo'
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 885
        Top = 53
        Width = 39
        Height = 16
        Text = ''
      end
      object RLLabel23: TRLLabel
        Left = 846
        Top = 53
        Width = 35
        Height = 16
        Caption = 'Data:'
      end
      object RLLabel24: TRLLabel
        Left = 966
        Top = 53
        Width = 35
        Height = 16
        Caption = 'Hora:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 1005
        Top = 53
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel27: TRLLabel
        Left = 438
        Top = 53
        Width = 46
        Height = 15
        Caption = 'Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel35: TRLLabel
        Left = 302
        Top = 53
        Width = 134
        Height = 16
        Caption = 'Filtrado por data de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel38: TRLLabel
        Left = 550
        Top = 53
        Width = 59
        Height = 16
        Caption = 'Pedidos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel39: TRLLabel
        Left = 612
        Top = 53
        Width = 46
        Height = 15
        Caption = 'Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand7: TRLBand
      Left = 20
      Top = 228
      Width = 1083
      Height = 40
      AlignToBottom = True
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDraw3: TRLDraw
        Left = 792
        Top = 1
        Width = 293
        Height = 38
        Brush.Color = 15461355
        Pen.Style = psClear
      end
      object RLLabel28: TRLLabel
        Left = 809
        Top = 3
        Width = 61
        Height = 14
        Caption = 'QTD. ITENS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Left = 897
        Top = 3
        Width = 67
        Height = 14
        Caption = 'QTD. PE'#199'AS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel34: TRLLabel
        Left = 989
        Top = 3
        Width = 81
        Height = 14
        Caption = 'VALOR TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult7: TRLDBResult
        Left = 786
        Top = 21
        Width = 109
        Height = 15
        Alignment = taCenter
        DataField = 'QTD_TOTAL'
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult8: TRLDBResult
        Left = 876
        Top = 21
        Width = 110
        Height = 15
        Alignment = taCenter
        DataField = 'QTD_PECAS'
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult9: TRLDBResult
        Left = 955
        Top = 21
        Width = 125
        Height = 15
        Alignment = taRightJustify
        DataField = 'VALOR_TOTAL'
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
    object RLGroup2: TRLGroup
      Left = 20
      Top = 122
      Width = 1083
      Height = 106
      DataFields = 'REFPRO'
      object RLBand8: TRLBand
        Left = 0
        Top = 0
        Width = 1083
        Height = 45
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDraw20: TRLDraw
          Left = 730
          Top = 18
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLLabel31: TRLLabel
          Left = 3
          Top = 26
          Width = 28
          Height = 15
          Caption = 'COR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw13: TRLDraw
          Left = 388
          Top = 17
          Width = 28
          Height = 27
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw14: TRLDraw
          Left = 449
          Top = 17
          Width = 28
          Height = 27
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw15: TRLDraw
          Left = 506
          Top = 17
          Width = 28
          Height = 27
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw16: TRLDraw
          Left = 563
          Top = 17
          Width = 28
          Height = 27
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw17: TRLDraw
          Left = 616
          Top = 17
          Width = 28
          Height = 27
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw18: TRLDraw
          Left = 672
          Top = 17
          Width = 28
          Height = 27
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLLabel33: TRLLabel
          Left = 392
          Top = 25
          Width = 405
          Height = 14
          Caption = 
            'RN       P       M       G       1       2       3       4      ' +
            ' 6       8       10      12      14    UNICA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel22: TRLLabel
          Left = 809
          Top = 27
          Width = 61
          Height = 14
          Caption = 'QTD. ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel25: TRLLabel
          Left = 897
          Top = 27
          Width = 67
          Height = 14
          Caption = 'QTD. PE'#199'AS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel26: TRLLabel
          Left = 989
          Top = 27
          Width = 81
          Height = 14
          Caption = 'VALOR TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = -2
          Top = 0
          Width = 1087
          Height = 23
          Brush.Color = 15461355
          Pen.Style = psClear
        end
        object RLDBText14: TRLDBText
          Left = 180
          Top = 5
          Width = 67
          Height = 16
          DataField = 'PRODUTO'
          DataSource = DataSource2
          Text = ''
        end
        object RLLabel29: TRLLabel
          Left = 171
          Top = 5
          Width = 8
          Height = 16
          Caption = '-'
        end
        object RLDBText13: TRLDBText
          Left = 73
          Top = 5
          Width = 98
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'REFPRO'
          DataSource = DataSource2
          Text = ''
        end
        object RLLabel30: TRLLabel
          Left = -2
          Top = 5
          Width = 72
          Height = 16
          Caption = 'PRODUTO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 0
        Top = 45
        Width = 1083
        Height = 23
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        BeforePrint = RLBand9BeforePrint
        object RLDBText16: TRLDBText
          Left = 38
          Top = 4
          Width = 43
          Height = 14
          Alignment = taRightJustify
          DataField = 'REFCOR'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText23: TRLDBText
          Left = 84
          Top = 4
          Width = 297
          Height = 14
          AutoSize = False
          DataField = 'COR'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDraw7: TRLDraw
          Left = 672
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw8: TRLDraw
          Left = 616
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw9: TRLDraw
          Left = 563
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw10: TRLDraw
          Left = 506
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDraw11: TRLDraw
          Left = 449
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText15: TRLDBText
          Left = 410
          Top = 3
          Width = 46
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_P'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText17: TRLDBText
          Left = 439
          Top = 3
          Width = 48
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_M'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText18: TRLDBText
          Left = 470
          Top = 3
          Width = 48
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_G'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText19: TRLDBText
          Left = 500
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_1'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText20: TRLDBText
          Left = 526
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_2'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText21: TRLDBText
          Left = 555
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_3'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText22: TRLDBText
          Left = 582
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_4'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText24: TRLDBText
          Left = 608
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_6'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText25: TRLDBText
          Left = 635
          Top = 3
          Width = 44
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_8'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText26: TRLDBText
          Left = 740
          Top = 3
          Width = 76
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_UNICA'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText27: TRLDBText
          Left = 801
          Top = 3
          Width = 78
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText28: TRLDBText
          Left = 890
          Top = 3
          Width = 82
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_PECAS'
          DataSource = DataSource2
          Text = ''
        end
        object RLDraw12: TRLDraw
          Left = 388
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText30: TRLDBText
          Left = 374
          Top = 3
          Width = 56
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_RN'
          DataSource = DataSource2
          Text = ''
          BeforePrint = RLDBText30BeforePrint
        end
        object RLDBText29: TRLDBText
          Left = 984
          Top = 3
          Width = 96
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = DataSource2
          Text = ''
        end
        object RLDraw19: TRLDraw
          Left = 730
          Top = -4
          Width = 28
          Height = 26
          Brush.Style = bsClear
          Color = 15132390
          ParentColor = False
          Pen.Color = 12895428
          Pen.Style = psClear
          Transparent = False
        end
        object RLDBText31: TRLDBText
          Left = 719
          Top = 3
          Width = 52
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_14'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText32: TRLDBText
          Left = 689
          Top = 3
          Width = 52
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_12'
          DataSource = DataSource2
          Text = ''
        end
        object RLDBText33: TRLDBText
          Left = 660
          Top = 3
          Width = 52
          Height = 16
          Alignment = taCenter
          DataField = 'QTD_10'
          DataSource = DataSource2
          Text = ''
        end
      end
      object RLBand10: TRLBand
        Left = 0
        Top = 68
        Width = 1083
        Height = 23
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Options = [boOptimisticPageBreak]
        object RLDraw6: TRLDraw
          Left = 792
          Top = 0
          Width = 293
          Height = 22
          Brush.Color = 15461355
          Pen.Style = psClear
        end
        object RLDBResult10: TRLDBResult
          Left = 955
          Top = 5
          Width = 125
          Height = 15
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult11: TRLDBResult
          Left = 876
          Top = 5
          Width = 110
          Height = 15
          Alignment = taCenter
          DataField = 'QTD_PECAS'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult12: TRLDBResult
          Left = 786
          Top = 5
          Width = 109
          Height = 15
          Alignment = taCenter
          DataField = 'QTD_TOTAL'
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = cds
    Left = 384
    Top = 192
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 456
    Top = 239
  end
  object ImageList1: TImageList
    Left = 495
    Top = 241
    Bitmap = {
      494C010106000900A00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDD9C800D18D5300C0620D00C0620D00D18D5300EDD9C8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7C39B00ECE3D600ECE3D600ECE3D600ECE3D600ECE3D600ECE3D600D7C3
      9B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7EF
      E700D69A6600C3681600BF5F0200BF5F0100BF5F0100BF5F0200C3681600D69A
      6600F7EFE700000000000000000000000000B0ACAC00B1ACAC00A7A2A200726C
      7300C4AB7F00EDE1D500EDE1D500EDE1D500EDE1D500EDE1D500EDE1D500C4AB
      7F0076717700A49E9E00A9A4A400ABA5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0DECC00C063
      1200BB530000C0600000BE590000BF5C0000C0610200C0600200C05F0000BB53
      0000C0641200F0DECC000000000000000000958F8F00C3C0BF00C3C0BF00837D
      8400C6A87400E0CBAE00E0CBAE00E0CBAE00E0CBAE00E0CBAE00E0CBAE00C6A8
      7400837D8400C3C0BF00C3C0BF00999292000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F0E800C0640F00BD58
      0000C0610200BE590000CC823C00C46F1B00BE590000C0610200C0600200C061
      0200BD580000C0640F00F7F0E80000000000A49FA100D1CFCE00D1CFCE00D3D2
      D100D2D2D300D0D0D200D0D0D200D0D0D200D0D0D200D0D0D200D0D0D200D2D2
      D300D3D2D100BACAD7006E9BE300A49FA1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D69B6300BB530000C061
      0200BE5C0000C46D1E0000000000F3E5D900C0631000BD590000C0610200C060
      0200C0610200BB530000D69B630000000000AAA7A700D9D7D700D9D7D700D9D7
      D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7D700D9D7
      D700D9D7D7008AC3E900004BFB00ABA8A8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEDBC900C3681100C05F0000C060
      0200C05F0200BD5A0400DCA97B0000000000F2E3D400C0631100BD590000C061
      0200C0600200C05F0000C3681100EEDBC900B7B3B300E6E8E900D6C5AF00BC6B
      1000BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A0F00BB6A
      0F00BC6B1000D6C5AF00E6E8E900B8B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D18D4E00C05F0000C0600200C060
      0200C0600200C0600100BA500000DBA7770000000000F2E3D400C0631100BE5A
      0000C0600200C0600200C05F0000D18D4E00BCB9BA00EEF2F500BA7B3E00E1A9
      4200E1A84200E1A84200E1A84200E1A84200E1A84200E1A84200E1A84200E1A8
      4200E1A94200BA7B3E00EEF2F500BFBBBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1630A00C0600200C0600200C060
      0200C0600200C0600200C0600100B94F0000D9A16D0000000000F5EADF00C268
      1700BF5D0100C0600200C0600200C1630A00CDC8C900F8FCFF00CD975300EEC6
      7000EEC77100EEC77100EEC77100EEC77100EEC77100EEC77100EEC77100EEC7
      7100EEC67000CD975300F8FCFF00CECBCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1630A00C0600100C0600200C060
      0200C0600200C0600200BF5E0000BB530000DFB38A0000000000EED7C000C062
      1000BF5E0100C0600200C0600100C1630A00D2D0D000FCFFFF00D7A55C00EDC9
      7700E9BF6800E9BF6800E9BF6800E9BF6800E9BF6800E9BF6800E9BF6800E9BF
      6800EDC97700D7A55C00FCFFFF00D4D1D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF8D4E00BF5F0000C0600200C060
      0200C0600200BF5E0000BB520000E3BB970000000000EBD1B800BC580100BF5C
      0000C0600200C0600200BF5F0000CF8D4E00DEDCDB0000000000E8C07000E0AC
      5400B99D6B00D7BD9100D7BD9100D7BD9100D7BD9100D7BD9100D7BD9100B99D
      6B00E0AC5400E8C0700000000000E3DFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEDCC900C2681000C05F0100C060
      0200BF5F0100BF5E0A00E4BE9B0000000000EBD1B700BC580100BE5C0000C060
      0200C0600200C05F0100C2681000EEDCC900D1CBCD00BCBBC000DEB67300CF9E
      5F00C4AB7F00DFCAAD00DFCAAD00DFCAAD00DFCAAD00DFCAAD00DFCAAD00C4AB
      7F00CD995600DDB36E00BEBDC100D1CACC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D69B6300BB530000C061
      0200BE5C0000C56F2100FEFFFF00EDD4BD00BC580100BF5C0000C0600200C060
      0200C0610200BB530000D69B6300000000000000000000000000000000000000
      0000D0BD9800ECDFD100ECDFD100ECDFD100ECDFD100ECDFD100ECDFD100D0BD
      9800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F0E800C0641000BD59
      0000C0610200BE590000C7762900C1640A00BF5C0000C0600200C0600200C061
      0200BD590000C0641000F7F0E800000000000000000000000000000000000000
      0000D5C4A400EFE4D800EFE4D800EFE4D800EFE4D800EFE4D800EFE4D800D5C4
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0DECC00C163
      1300BB530000C0600000BE5B0000BF5E0000C0600200C0600200C05F0000BB53
      0000C1631300F0DECC0000000000000000000000000000000000000000000000
      0000DED0B800F5EDE400F5EDE400F5EDE400F5EDE400F5EDE400F5EDE400DED0
      B800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7EF
      E700D69A6600C3681600BF5F0200C0600200C0600200BF5F0200C3681600D69A
      6600F7EFE7000000000000000000000000000000000000000000000000000000
      0000E2D6C100F8F3EA00F8F3EA00F8F3EA00F8F3EA00F8F3EA00F8F3EA00E2D6
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EED9C700D08D5400C1630F00C1630F00D08D5400EED9C7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7DDCD00EFE8DB00EFE8DB00EFE8DB00EFE8DB00EFE8DB00EFE8DB00E8DF
      D000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBE4C20070CF850027B747001EBA40001EBA400027B7470070CF8500BBE4
      C2000000000000000000000000000000000000000000035703000355030084AB
      8400E8EFE80074A0740012631200046B0700046A0700046A0700046A0700046B
      0700046B0700046B07004C8A4C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000BDBDE9000000B3000202AE00F6F6FD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BC7A4700BA6E2900C8906D00E9D1C500000000000000
      0000000000000000000000000000000000000000000000000000FAFDFA004FB9
      620019C140001FCE4C0024DC580027DD5C0027DD5C0024DC58001FCE4C0019C1
      40004FB96200FAFDFA000000000000000000046804000FA82D000FA82D00057E
      0F00447F4400057C0F0018C4420018C3410018C3410018C3410016BB3D0016BB
      3D0016BB3D0016BB3D0004600400FFFFFF000000000000000000000000000000
      00000000000000000000000000002C2CBD00110DF9000E08EC005858CB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6A78C00CB8B3000CFE1EA00C8BAAD00B8845600B7642700CD96
      7800FCF8F50000000000000000000000000000000000FBFDFB0021A93A001ED0
      4E0021D4540020D0530004B62A0018C440001DCE4A0018C8440020D1510021D4
      54001ED04E0021A93A00FBFDFB0000000000046E0B0018C3450017C34400098E
      1B00035A030014BE3F0017C2430017C2430017C2430017C2430008922000046D
      0900046D0900046D090004630400B4CDB4000000000000000000000000000000
      00000000000000000000000000007877D7001413F6001C1EFF000D0DB7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F2ED00C0620000DD911D00A3ACC100BED1E800CEDAE800D2D8DD00CBA7
      8400B66A3A00B9704400E5C8BD0000000000000000004EB15B001ECE4D0022D4
      560015C948001CAC2F009DD2A10037AF460014C13B001FD24E001ECE4B001ECD
      4A0020D253001ECE4D004EB15B000000000004730C0018C5470017C447000890
      1C00035A030018C4470017C3460017C3460017C3460017C3460018C4470018C7
      480018C7480018C849000FA92F00538E53000000000000000000000000000000
      00000000000000000000000000000200BD00181CFB001E26FF000D0BBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C57F4400D57E0000F4BB5900D4BB8200988A79009EA5B400CFD9EA00E7F9
      FF00FBFFFF00E8DBC800CF9F7B00B5662700BDDEBE0017BA3F0021D85A0013C6
      460012A82600F2F4EC0000000000EAF2E60026AA38000DC0390020D24F001ECE
      49001DCD4D0020D7580017BA3F00BDDEBE0005780E0016C6480016C647000893
      21000582160017C64A0017C5490017C5490017C5490017C64A0008922000035A
      0300035B0300035B030004620400589B58000000000000000000000000000000
      00000000000000000000D3D1F5000C07D600212FFF00151AEE005E5AD9000000
      000000000000000000000000000000000000000000000000000000000000E4C5
      AE00CB700000E7A32F00FFEDBD00FFD76C00F6B22900DB971D00AA865200B9AF
      A200D4DFF3000000000000000000D29F75006ABC740018D1520014CB4E000BA0
      1E00F2F4EC00FFFBFF00FFFAFF0000000000EAF2E60023A835000BC03A001ED3
      59001CCF53001ED2580018CF51006ABC74003D9D440068EC92004CDF7D0025A3
      3B000582160014C54A0015C54A0015C54A0015C54A0014C54A0029D15E0039D8
      6B004DE07E0068EE930089FAAE003C9B40000000000000000000000000000000
      000000000000000000000800CD001D2EFF002238FF00141AE900E0DEF9000000
      0000000000000000000000000000000000000000000000000000FEFCFA00C26A
      0800DD8B0200FBDDA200FDD88100F2B84600F2DCAE00EDD09800F19A0B00D782
      0300BF7E1C00C1A57600D7D9D900F6E9DE0030A03F002DE172001BA82D00F2F4
      EC00FFF8FF00EAF2E600A9D5A400EEF2EB0000000000D0EBD30023A834000AC2
      420018D6620013CF540030E1730030A141003AA1460083FAAD0083FAAC005EC5
      71000892210084FAAD0083F9AC0083F9AC0083F9AC0083FAAC003EA74C001E89
      24001E8924001E8924001C8422001C8422000000000000000000000000000000
      000000000000261ED5001C28F500253EFF00253DFF001C2BF8000C02D7000700
      D0000700D0000700D0003C35DB008883EB000000000000000000D69F6700D57B
      0000F3C57600FFE7A800F2C04E00EFB85100F3FFFF00DFFCFF00DD9B3100DF8A
      0900E0840000D3720000C6720000CC82330030A3430065EAA10058B25C00EAF2
      E600EAF2E6000EB42F0000BF30003AB64900F2F4EC0000000000EAF2E60023A8
      330007C13D0024D8690073F0B10030A142003CA54A0084FAB20083FAB1005EC8
      76000892210082FAAF0081F9AD0081F9AD0081F9AD0081FAAE0075E4980075E4
      980075E4980075E498005BC470001E8924002920DE000A00D8000A00D8000A00
      D9000A00D800202EF7002C48FF002B45FF002B45FF002B46FF002D49FF002E4C
      FF002E4CFF002337FF00171FF400110DE00000000000F4E4D500CC710000E8A7
      3600FFEAB700F7CB6000EEB64C00EBAB3300E8CA8F00DDB16C00DD8B0C00DA87
      0800D8820000CE7C0000CD7A0000DA9D5B002395370078F4BC0049CD7A0074BF
      7F002DB64C0024D367002ED8720019CC5A0048B55800EAF2E60000000000EAF2
      E60026A7310025D0600077F6BE00239535004EA354002B8E32002A8E2F001F88
      26000F7F170078E3990083FAB30082FAB20082FAB20082FAB30084FAB50084FA
      B60084FAB60084FAB60086FAB8003EA74C001312E9003152FF003151FF001F29
      F600110BE6003050FF002D49FF002D49FF002D49FF002E4AFF00385AFF004D6F
      FF00607EFF00607EFF007692FF000D04E20000000000D07E2100DE8D0900FBE0
      A700FAD57900F2C15800EAA22100F0E0C700E5F0FF00DE922100DB840000DA83
      0300D27E0000CB7B0000D17F1C00FFFDFC0033933D0071F2B50061E4A8004CDB
      95005BE1A50061DEA50063DDA40063E2AB004DDA96004FB86000EEF2E8000000
      0000EAF2E6002AB343006DF0B30033933D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0040A14A0078E79B0086FAB60085FAB60078ED9F0036A445002897
      320028973300289733005CB1630089C58F001E1AED003453FF002E4EFF001B25
      F6000E08E5003454FF00324FFF00324FFF00324FFF003350FF00273AFF00171F
      F4000D04E2000D04E2000D04E2005B55EE00E5BA8800D67B0000F4CA7F00FFE3
      9800F4C15300EDAF3E00E6981300EADBC500DEEBF900D98F1900D9810000D67F
      0000CA790000CF7B0B00FBF3EB000000000067AB660086E3B50062E7A9005DE2
      A40060E2A6005FE1A6005FE1A6005EE1A50063E5AD004CDA95004DB75E00EAF0
      E5000000000061BC650080DFAE0067AB6600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031A3400082F6B10086FAB90060D28200C9E5CC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00423FF80093A8FF006E88FF006C73
      FF000600E3004161FF00304FFF003050FF003050FF003050FF00385AFF004D6F
      FF00607EFF00607EFF007692FF004541F800DC962A00E5A43900FFE9B000F8C7
      5C00EDB95300EBBD6B00E48B0000E4AD5700D7EDFF00D49B4800D9790000CA79
      0000CD7B0A00F6E3CE000000000000000000B9D4B9004EB06800A8FCE1005FE1
      A20057E09F005BE0A3005DE1A4005DE1A4005DE1A40061E5AB004EDC970048BA
      60005DC2700096EABF004EB06800B9D4B900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004FC1660085FABD0078EBA2006ABD7700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00403CFC008DA6FF008CA3FF00636B
      FF003023FF0094ACFF008FA4FF008FA4FF008FA4FF0090A6FF007376FF003226
      F6001207F1001207F1001207F1001207F100E8B25700FBD99400FAD16A00F0B6
      4500EDBC670000000000EDD2A900DFC18D00D0E3FF00CEA76300D0730000CF7B
      0200F0D0A90000000000000000000000000000000000458945007BDBA700B0FC
      E80076E5B50062E3AA005EE0A6005EE1A6005EE1A6005EE0A50066E6B0006FE3
      AF00A7F9E0007ADCA8004589450000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001C9E310085FAB70086FAC2002FAC4400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00403DFF0092A9FF008FA5FF00676D
      FF002C20FF0093ABFF008CA1FF008CA1FF008CA1FF008DA2FF0090A6FF0097B0
      FF0099B2FF0099B3FF0099B3FF000800F500F1CB8F00FFE8A900F8D07200ECB0
      4100E5971500EFCC9300EFFFFF00DCF4FF00C7DCFA00CD8E2C00D0720000E8B5
      6E000000000000000000000000000000000000000000FAFDFA00157215006DD6
      A300B3FDF000A4F5DF008CE9C7008CE8C4008AE7C2008DE9C600A5F5DE00B3FD
      F0006DD6A30015721500FAFDFA0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0079CB890084FABB0086FAC60031B24B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004140FF0095AEFF0092ABFF006871
      FF002E23FF0096AEFF008FA6FF008EA5FF008EA5FF008EA6FF008A9CFF003733
      FF003C39FF003D3BFF003B35FF00837DFC00FCF5EB00F7E4C800F1CE9500F0C7
      7C00EDC27500DF921000DA963200D5954800CF831B00CD700000E5A346000000
      0000000000000000000000000000000000000000000000000000F9FCF9004586
      450038A75E007FE1B800A9FFEC00B9FFFB00B9FFFB00A9FFEC007FE1B80038A7
      5E0045864500F9FCF9000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0045BD5F0086FAC00079F9B2006DCD8200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004542FF0096A9FF0094A6FF006D73
      FF004744FF007174FF009DB7FF0099B2FF0099B1FF0099B2FF0096AFFF0093A5
      FF0094A7FF0097A7FF003833FF00F7F7FF000000000000000000000000000000
      0000FAEBD400F7E1B200F1CA8200E7A52B00DA881500DF972B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7CEB70067A56700247D33002887380028873800247D330067A56700B7CE
      B70000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B9E9C30040CF64003FC86000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E35FF000A00FF000900FF005952
      FF0000000000837FFF00332AFF004441FF004340FF004340FF004340FF004441
      FF004441FF004745FF002C25FF00000000000000000000000000000000000000
      000000000000FEFBF400FAEAD100F5D49700EECC8800F4D19800000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F81FF00F00000000E007000000000000
      C003000000000000800100000000000082010000000000000100000000000000
      0080000000000000004000000000000000400000000000000080400200000000
      01000000000000008001F00F000000008001F00F00000000C003F00F00000000
      E007F00F00000000F81FF00F00000000F00F8000FE1FFC3FC0030000FE1FF807
      80010000FE1FF00180010000FE1FF00002000000FC1FE00601000000FC1FC000
      00800000F800C000004000000000800000200000000080000010000000000001
      00080000000000030000000000000407800100000000000F800100000000001F
      C00300000000F03FF00F00000801F83F00000000000000000000000000000000
      000000000000}
  end
  object cds: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterScroll = cdsAfterScroll
    Left = 352
    Top = 192
    object cdsFATURADO: TStringField
      FieldName = 'FATURADO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object cdsNUMPEDIDO: TStringField
      FieldName = 'NUMPEDIDO'
      Size = 22
    end
    object cdsCOD_REPRES: TIntegerField
      FieldName = 'COD_REPRES'
      ReadOnly = True
    end
    object cdsREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      ReadOnly = True
      Size = 60
    end
    object cdsCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ReadOnly = True
      Size = 60
    end
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object cdsDT_DESPACHO: TDateField
      FieldName = 'DT_DESPACHO'
      ReadOnly = True
    end
    object cdsDT_RECEBIMENTO: TDateField
      FieldName = 'DT_RECEBIMENTO'
    end
    object cdsDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object cdsDT_REPRESENTANTE: TDateField
      FieldName = 'DT_REPRESENTANTE'
    end
    object cdsDT_LIMITE_ENTREGA: TDateField
      FieldName = 'DT_LIMITE_ENTREGA'
    end
    object cdsTOTAL_DESCONTOS: TBCDField
      FieldName = 'TOTAL_DESCONTOS'
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object cdsTOTAL_LIQUIDO: TBCDField
      FieldName = 'TOTAL_LIQUIDO'
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object cdsTOTAL_BRUTO: TBCDField
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = ' ,0.00; -,0.00'
      Size = 2
    end
    object cdsSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object cdsQTD_ITENS: TBCDField
      FieldName = 'QTD_ITENS'
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object cdsQTD_PECAS: TBCDField
      FieldName = 'QTD_PECAS'
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object cdsPERC_ESTOQUE: TBCDField
      FieldName = 'PERC_ESTOQUE'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsCODCLI: TIntegerField
      FieldName = 'CODCLI'
      ReadOnly = True
      Visible = False
    end
    object cdsTAG: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TAG'
      Visible = False
      Size = 1
    end
    object cdsCODIGO_NOTA_FISCAL: TIntegerField
      FieldName = 'CODIGO_NOTA_FISCAL'
    end
    object cdsPRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Size = 2
    end
    object cdsTOT_DESCONTO: TAggregateField
      FieldName = 'TOT_DESCONTO'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(TOTAL_DESCONTOS)'
    end
    object cdsTOT_VALOR: TAggregateField
      FieldName = 'TOT_VALOR'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(TOTAL_LIQUIDO)'
    end
    object cdsTOTAL_PECAS: TAggregateField
      FieldName = 'TOTAL_PECAS'
      Active = True
      DisplayName = ''
      DisplayFormat = '0'
      Expression = 'SUM(QTD_PECAS)'
    end
    object cdsTOTAL_ITENS: TAggregateField
      FieldName = 'TOTAL_ITENS'
      Active = True
      DisplayName = ''
      DisplayFormat = '0'
      Expression = 'SUM(QTD_ITENS)'
    end
    object cdsTOT_VALOR_BRUTO: TAggregateField
      FieldName = 'TOT_VALOR_BRUTO'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = ' ,0.00; -,0.00'
      Expression = 'SUM(TOTAL_BRUTO)'
    end
    object cdsTOT_CUSTO: TAggregateField
      FieldName = 'TOT_CUSTO'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PRECO_CUSTO)'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qry
    Left = 320
    Top = 192
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = qry2
    Left = 320
    Top = 240
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider2'
    OnCalcFields = ClientDataSet1CalcFields
    Left = 352
    Top = 240
    object ClientDataSet1REFPRO: TStringField
      FieldName = 'REFPRO'
      ReadOnly = True
      Size = 18
    end
    object ClientDataSet1PRODUTO: TStringField
      FieldName = 'PRODUTO'
      ReadOnly = True
      Size = 200
    end
    object ClientDataSet1REFCOR: TStringField
      FieldName = 'REFCOR'
      ReadOnly = True
    end
    object ClientDataSet1COR: TStringField
      FieldName = 'COR'
      ReadOnly = True
      Size = 100
    end
    object ClientDataSet1QTD_TOTAL: TBCDField
      FieldName = 'QTD_TOTAL'
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object ClientDataSet1QTD_PECAS: TBCDField
      FieldName = 'QTD_PECAS'
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object ClientDataSet1QTD_RN: TLargeintField
      FieldName = 'QTD_RN'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_P: TLargeintField
      FieldName = 'QTD_P'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_M: TLargeintField
      FieldName = 'QTD_M'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_G: TLargeintField
      FieldName = 'QTD_G'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_1: TLargeintField
      FieldName = 'QTD_1'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_2: TLargeintField
      FieldName = 'QTD_2'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_3: TLargeintField
      FieldName = 'QTD_3'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_4: TLargeintField
      FieldName = 'QTD_4'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_6: TLargeintField
      FieldName = 'QTD_6'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_8: TLargeintField
      FieldName = 'QTD_8'
      ReadOnly = True
      DisplayFormat = '0'
    end
    object ClientDataSet1QTD_10: TLargeintField
      FieldName = 'QTD_10'
      ReadOnly = True
    end
    object ClientDataSet1QTD_12: TLargeintField
      FieldName = 'QTD_12'
      ReadOnly = True
    end
    object ClientDataSet1QTD_14: TLargeintField
      FieldName = 'QTD_14'
      ReadOnly = True
    end
    object ClientDataSet1QTD_UNICA: TBCDField
      FieldName = 'QTD_UNICA'
      ReadOnly = True
      DisplayFormat = '0'
      Precision = 18
      Size = 2
    end
    object ClientDataSet1VALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object ClientDataSet1PRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Size = 2
    end
    object ClientDataSet1TOTAL_ITENS: TAggregateField
      FieldName = 'TOTAL_ITENS'
      Active = True
      DisplayName = ''
      DisplayFormat = '0'
      Expression = 'SUM(QTD_TOTAL)'
    end
    object ClientDataSet1TOTAL_PECAS: TAggregateField
      FieldName = 'TOTAL_PECAS'
      Active = True
      DisplayName = ''
      DisplayFormat = '0'
      Expression = 'SUM(QTD_PECAS)'
    end
    object ClientDataSet1TOT_CUSTO: TAggregateField
      FieldName = 'TOT_CUSTO'
      Active = True
      DisplayName = ''
      Expression = 'SUM(PRECO_CUSTO)'
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 384
    Top = 240
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT P.NUMPEDIDO, R.CODIGO COD_REPRES ,SUBSTRING(R.RAZAO from ' +
        '1 for 40) REPRESENTANTE, C.RAZAO CLIENTE, PF.codigo,'
      '   iif( not(PF.codigo is null), iif( not(PF.codigo is null),'
      
        '   CAST( lpad(EXTRACT(DAY FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' ||' +
        ' lpad(EXTRACT(MONTH FROM nf.data_saida), 2, '#39'0'#39') || '#39'.'#39' || EXTRA' +
        'CT(YEAR FROM nf.data_saida) as Date),'
      '   P.dt_despacho) ,P.dt_despacho) DT_Despacho,'
      
        '   P.DT_RECEBIMENTO, P.DT_CADASTRO, P.DT_REPRESENTANTE , P.DT_LI' +
        'MITE_ENTREGA, (P.DESCONTO_FPGTO + P.DESCONTO + P.DESCONTO_ITENS+' +
        ' P.desconto_comiss) TOTAL_DESCONTOS,'
      
        '   (p.valor_total-((p.valor_total*p.desconto_comiss)/100)) total' +
        '_liquido, iif((not (PF.codigo is null) or (P.despachado = '#39'S'#39')),' +
        ' '#39'SIM'#39', '#39'N'#195'O'#39') FATURADO,'
      '   iif(P.DESPACHADO = '#39'S'#39', '#39'DESPACHADO'#39','
      
        '   iif(P.aprovacao = '#39'A'#39','#39'APROVADO'#39',iif(P.aprovacao = '#39'E'#39', '#39'EM E' +
        'STUDO'#39', '#39'REPROVADO'#39'))) STATUS,'
      
        '   sum(itens.QTD_TOTAL * pro.qtd_pecas) as qtd_pecas,  0.1 perc_' +
        'estoque, sum(itens.QTD_TOTAL) as qtd_itens, C.CODIGO CODCLI'
      '   from pedidos P'
      
        '   LEFT JOIN pedidos_faturados      PF  ON PF.CODIGO_PEDIDO = P.' +
        'CODIGO'
      
        '   LEFT JOIN PESSOAS                C   ON C.CODIGO = P.COD_CLIE' +
        'NTE'
      
        '   LEFT JOIN PESSOAS                R   ON R.CODIGO = P.COD_REPR' +
        'ES'
      
        '   LEFT JOIN notas_fiscais          NF  ON NF.codigo = PF.codigo' +
        '_nota_fiscal'
      '   left join ITENS on itens.COD_PEDIDO = p.CODIGO'
      '   left join produtos pro on ITENS.COD_PRODUTO = pro.CODIGO'
      
        '   left join naturezas_operacao nat on nat.codigo = nf.codigo_na' +
        'tureza'
      '   left join clientes cli on cli.codcli = c.codigo'
      '   WHERE not (p.cancelado = '#39'S'#39')'
      '    AND ( P.DT_CADASTRO  BETWEEN :DTI AND :DTF )'
      'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14, 18')
    Left = 288
    Top = 192
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
  object qry2: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT pro.referencia refpro, pro.descricao produto, cor.referen' +
        'cia refcor, cor.descricao cor, SUM(itens.qtd_rn) qtd_rn, SUM(ite' +
        'ns.qtd_p) qtd_p, SUM(itens.qtd_m) qtd_m, SUM(itens.qtd_g) qtd_g,'
      
        '       SUM(itens.qtd_1) qtd_1, SUM(itens.qtd_2) qtd_2, SUM(itens' +
        '.qtd_3) qtd_3, SUM(itens.qtd_4) qtd_4, SUM(itens.qtd_6) qtd_6, S' +
        'UM(itens.qtd_8) qtd_8,'
      
        '       SUM(itens.qtd_10) qtd_10, SUM(itens.qtd_12) qtd_12, SUM(i' +
        'tens.qtd_14) qtd_14,'
      
        '       SUM(itens.qtd_unica) qtd_unica, SUM(itens.qtd_total) qtd_' +
        'total, SUM((itens.qtd_total * pro.qtd_pecas)) qtd_pecas, SUM(ite' +
        'ns.valor_total) valor_total'
      ''
      ' from pedidos P'
      ''
      
        ' LEFT JOIN pedidos_faturados      PF  ON PF.CODIGO_PEDIDO = P.CO' +
        'DIGO'
      
        ' LEFT JOIN PESSOAS                C   ON C.CODIGO = P.COD_CLIENT' +
        'E'
      
        ' LEFT JOIN notas_fiscais          NF  ON NF.codigo = PF.codigo_n' +
        'ota_fiscal'
      ' left join ITENS on itens.COD_PEDIDO = p.CODIGO'
      ' left join produtos pro on ITens.COD_PRODUTO = pro.CODIGO'
      
        ' left join naturezas_operacao nat on nat.codigo = nf.codigo_natu' +
        'reza'
      ' left join cores cor  on cor.codigo = itens.cod_cor'
      ' WHERE not (p.cancelado = '#39'S'#39')'
      
        ' AND ( P.DT_CADASTRO  BETWEEN :DTI AND :DTF )  AND P.COD_REPRES ' +
        '= :COD_REPRES'
      
        ' AND iif((not (PF.codigo is null) or (P.despachado = '#39'S'#39')), '#39'SIM' +
        #39', '#39'N'#195'O'#39') = '#39'SIM'#39
      
        ' and not (iif((select first 1 nat.descricao from itens_notas_fis' +
        'cais it'
      
        '                left join naturezas_operacao nat on nat.codigo =' +
        ' it.codigo_natureza'
      '               where it.codigo_nota_fiscal = NF.codigo) is null,'
      '              '#39#39','
      
        '              (select first 1 nat.descricao from itens_notas_fis' +
        'cais it'
      
        '                left join naturezas_operacao nat on nat.codigo =' +
        ' it.codigo_natureza'
      
        '               where it.codigo_nota_fiscal = NF.codigo))        ' +
        '    ) like '#39'%REMESSA%'#39
      
        '               and not (select pessoas.cpf_cnpj from pessoas whe' +
        're pessoas.codigo = P.cod_cliente)'
      
        '               in (select pessoas.cpf_cnpj from empresas left jo' +
        'in pessoas on pessoas.codigo = empresas.codigo_pessoa)'
      
        '               AND not C.RAZAO like '#39'%MINHA ROUPINHA%'#39' and ( ((n' +
        'ot nat.cfop in ('#39'5910'#39','#39'6910'#39','#39'5916'#39'))'
      
        '               and not(nat.cfop like '#39'1%'#39' or nat.cfop like '#39'2%'#39')' +
        ') or (nat.cfop is null))'
      ''
      
        'group by pro.referencia, pro.descricao, cor.referencia, cor.desc' +
        'ricao'
      'order by 1, 2'
      '')
    Left = 288
    Top = 240
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
      end
      item
        Name = 'COD_REPRES'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 168
    Top = 336
    object ImprimirDanfe1: TMenuItem
      Caption = 'Imprimir Danfe'
      ImageIndex = 5
      OnClick = ImprimirDanfe1Click
    end
  end
end
