inherited frmEntradaSaidaMoeda: TfrmEntradaSaidaMoeda
  Caption = 'Entrada e sa'#237'da de moedas'
  ClientHeight = 314
  ClientWidth = 532
  ExplicitWidth = 548
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  object rgpOpcao: TRadioGroup
    Left = 15
    Top = 8
    Width = 498
    Height = 49
    Caption = ' Op'#231#227'o de movimenta'#231#227'o '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Items.Strings = (
      'Entrada de moeda'
      'Sa'#237'da de moeda')
    ParentFont = False
    TabOrder = 0
    OnClick = rgpOpcaoClick
  end
  object GroupBox1: TGroupBox
    Left = 15
    Top = 71
    Width = 498
    Height = 164
    Caption = 'Dados da movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 24
      Width = 74
      Height = 17
      Caption = 'Tipo Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3684408
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 285
      Top = 23
      Width = 33
      Height = 17
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3684408
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 95
      Width = 173
      Height = 17
      Caption = 'Descri'#231#227'o da movimenta'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3684408
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbMoeda: TComboBox
      Left = 12
      Top = 46
      Width = 200
      Height = 29
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = '<TIPO MOEDA>'
      Items.Strings = (
        '<TIPO MOEDA>'
        'Dinheiro'
        'Conv'#234'nio'
        'Cart'#227'o de Cr'#233'dito'
        'Cart'#227'o de D'#233'bito'
        '')
    end
    object edtValor: TCurrencyEdit
      Left = 285
      Top = 46
      Width = 200
      Height = 29
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtDescricao: TEdit
      Left = 12
      Top = 117
      Width = 473
      Height = 25
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnlbotoes: TPanel
    Left = 0
    Top = 262
    Width = 532
    Height = 52
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      532
      52)
    object btnConfirmar: TBitBtn
      Left = 313
      Top = 9
      Width = 200
      Height = 35
      Anchors = [akTop, akRight]
      Caption = ' [ F6 ] Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00BBE4C20070CF850027B747001EBA40001EBA400027B7
        470070CF8500BBE4C200FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B0057805E000C6B21000053000000560000005600000053
        00000C6B210057805E009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FAFDFA004FB9620019C140001FCE4C0024DC580027DD5C0027DD5C0024DC
        58001FCE4C0019C140004FB96200FAFDFA00FFFFFF00FFFFFF009B9B9B009B9B
        9B009699960000550000005D0000006A00000078000000790000007900000078
        0000006A0000005D000000550000969996009B9B9B009B9B9B00FFFFFF00FBFD
        FB0021A93A001ED04E0021D4540020D0530004B62A0018C440001DCE4A0018C8
        440020D1510021D454001ED04E0021A93A00FBFDFB00FFFFFF009B9B9B009799
        970000450000006C000000700000006C00000052000000600000006A00000064
        0000006D000000700000006C000000450000979997009B9B9B00FFFFFF004EB1
        5B001ECE4D0022D4560015C948001CAC2F009DD2A10037AF460014C13B001FD2
        4E001ECE4B001ECD4A0020D253001ECE4D004EB15B00FFFFFF009B9B9B00004D
        0000006A0000007000000065000000480000396E3D00004B0000005D0000006E
        0000006A000000690000006E0000006A0000004D00009B9B9B00BDDEBE0017BA
        3F0021D85A0013C6460012A82600F2F4EC00FFFFFF00EAF2E60026AA38000DC0
        390020D24F001ECE49001DCD4D0020D7580017BA3F00BDDEBE00597A5A000056
        00000074000000620000004400008E9088009B9B9B00868E820000460000005C
        0000006E0000006A0000006900000073000000560000597A5A006ABC740018D1
        520014CB4E000BA01E00F2F4EC00FFFBFF00FFFAFF00FFFFFF00EAF2E60023A8
        35000BC03A001ED359001CCF53001ED2580018CF51006ABC740006581000006D
        000000670000003C00008E9088009B979B009B969B009B9B9B00868E82000044
        0000005C0000006F0000006B0000006E0000006B00000658100030A03F002DE1
        72001BA82D00F2F4EC00FFF8FF00EAF2E600A9D5A400EEF2EB00FFFFFF00D0EB
        D30023A834000AC2420018D6620013CF540030E1730030A14100003C0000007D
        0E00004400008E9088009B949B00868E8200457140008A8E87009B9B9B006C87
        6F0000440000005E000000720000006B0000007D0F00003D000030A3430065EA
        A10058B25C00EAF2E600EAF2E6000EB42F0000BF30003AB64900F2F4EC00FFFF
        FF00EAF2E60023A8330007C13D0024D8690073F0B10030A14200003F00000186
        3D00004E0000868E8200868E820000500000005B0000005200008E9088009B9B
        9B00868E820000440000005D0000007405000F8C4D00003D00002395370078F4
        BC0049CD7A0074BF7F002DB64C0024D367002ED8720019CC5A0048B55800EAF2
        E600FFFFFF00EAF2E60026A7310025D0600077F6BE0023953500003100001490
        580000691600105B1B0000520000006F030000740E000068000000510000868E
        82009B9B9B00868E820000430000006C000013925A000031000033933D0071F2
        B50061E4A8004CDB95005BE1A50061DEA50063DDA40063E2AB004DDA96004FB8
        6000EEF2E800FFFFFF00EAF2E6002AB343006DF0B30033933D00002F00000D8E
        51000080440000773100007D4100007A410000794000007E4700007632000054
        00008A8E84009B9B9B00868E8200004F0000098C4F00002F000067AB660086E3
        B50062E7A9005DE2A40060E2A6005FE1A6005FE1A6005EE1A50063E5AD004CDA
        95004DB75E00EAF0E500FFFFFF0061BC650080DFAE0067AB660003470200227F
        510000834500007E4000007E4200007D4200007D4200007D4100008149000076
        310000530000868C81009B9B9B00005801001C7B4A0003470200B9D4B9004EB0
        6800A8FCE1005FE1A20057E09F005BE0A3005DE1A4005DE1A4005DE1A40061E5
        AB004EDC970048BA60005DC2700096EABF004EB06800B9D4B90055705500004C
        040044987D00007D3E00007C3B00007C3F00007D4000007D4000007D40000081
        47000078330000560000005E0C0032865B00004C040055705500FFFFFF004589
        45007BDBA700B0FCE80076E5B50062E3AA005EE0A6005EE1A6005EE1A6005EE0
        A50066E6B0006FE3AF00A7F9E0007ADCA80045894500FFFFFF009B9B9B000025
        0000177743004C98840012815100007F4600007C4200007D4200007D4200007C
        410002824C000B7F4B0043957C0016784400002500009B9B9B00FFFFFF00FAFD
        FA00157215006DD6A300B3FDF000A4F5DF008CE9C7008CE8C4008AE7C2008DE9
        C600A5F5DE00B3FDF0006DD6A30015721500FAFDFA00FFFFFF009B9B9B009699
        9600000E000009723F004F998C0040917B00288563002884600026835E002985
        620041917A004F998C0009723F00000E0000969996009B9B9B00FFFFFF00FFFF
        FF00F9FCF9004586450038A75E007FE1B800A9FFEC00B9FFFB00B9FFFB00A9FF
        EC007FE1B80038A75E0045864500F9FCF900FFFFFF00FFFFFF009B9B9B009B9B
        9B009598950000220000004300001B7D5400459B8800559B9700559B9700459B
        88001B7D54000043000000220000959895009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B7CEB70067A56700247D33002887380028873800247D
        330067A56700B7CEB700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00536A5300034103000019000000230000002300000019
        000003410300536A53009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnVoltar: TBitBtn
      Left = 99
      Top = 9
      Width = 200
      Height = 35
      Anchors = [akTop, akRight]
      Caption = ' [ ESC ]  Voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F6DFBE00EFC78100EAB34E00EBB84F00EBB74E00EAB5
        4F00EFC78100F6DFBE00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00927B5A008B631D00864F000087540000875300008651
        00008B631D00927B5A009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FEFBF800E7B05F00EEC35A00F5D77700FCEC8F00FDE88B00F8E28900F7E2
        8600F6DA7900EEC35A00E7B05F00FEFBF800FFFFFF00FFFFFF009B9B9B009B9B
        9B009A979400834C00008A5F00009173130098882B0099842700947E2500937E
        2200927615008A5F0000834C00009A9794009B9B9B009B9B9B00FFFFFF00FEFC
        F800E1A04000F3D37100F6DB8000FAE28400F2CF6300B6510000F5D77500F2D2
        7200F4D47600F6DC8000F3D27100E19F3F00FEFCF800FFFFFF009B9B9B009A98
        94007D3C00008F6F0D0092771C00967E20008E6B000052000000917311008E6E
        0E009070120092781C008F6E0D007D3B00009A9894009B9B9B00FFFFFF00E0A5
        5C00F2CD6800F5D47400F9DB7700EDBE4A00BB672F00BB672F00FFE27200F9DC
        7800F9DB7600F9DA7500FCE48000F3D26B00E0A55B00FFFFFF009B9B9B007C41
        00008E6904009170100095771300895A000057030000570300009B7E0E009578
        1400957712009576110098801C008F6E07007C4100009B9B9B00F0D7BE00E5AE
        4A00F4D36F00F6D66E00E6AB3A00B15B1100FAFEFF00BB672F00D78B2400DB9A
        3500DB983300DA963200DB953600F2CE6900E7B34C00F0D7BE008C735A00814A
        0000906F0B0092720A00824700004D000000969A9B0057030000732700007736
        00007734000076320000773100008E6A0500834F00008C735A00E0AD7300EDC1
        5400F7D36600E19E2A00BD703000F7F2F000FFFFFF00BB672F00CF7B0F00CF7B
        0F00CF7B0F00CF7B0F00CF7B0F00D4923200F7D36000E0AD73007C490F00895D
        0000936F02007D3A0000590C0000938E8C009B9B9B00570300006B1700006B17
        00006B1700006B1700006B170000702E0000936F00007C490F00D28C4100FDDA
        7300E29C2700C7854400FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CF7B0F00FCDB7000D38B41006E2800009976
        0F007E380000632100009A9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B006B17000098770C006F270000D4924600E6BD
        6500C6854B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00CF800F00FFEE9D00D08B4000702E00008259
        0100622100009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B006B1C00009B8A39006C270000C9833800EEC9
        7100C98F5900FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCA64300FAE79500C67E3200651F00008A65
        0D00652B00009A9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B007842000096833100621A0000C2773800FCE1
        8600E2AC4A00CB893F00F8F4F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DFA74100F8DC8100C27838005E130000987D
        22007E4800006725000094908F009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B007B43000094781D005E140000CC936900EACA
        8000EECA6B00E3B04500D0934200F9F8F900FFFFFF00E7B34E00E7B34E00E7B3
        4E00E7B34E00E7B34E00E7B34E00E7B34E00EECE8400CC936900682F05008666
        1C008A6607007F4C00006C2F0000959495009B9B9B00834F0000834F0000834F
        0000834F0000834F0000834F0000834F00008A6A2000682F0500E4C7B700CC90
        4A00F9E39200E7BB5800E2A93700D5984000FFFFFF00DDAA6A00DC9D2300E1A8
        3C00E0A53600DFA32E00DFAB4000F8E49500CD904A00E3C7B70080635300682C
        0000957F2E00835700007E450000713400009B9B9B0079460600783900007D44
        00007C4100007B3F00007B47000094803100692C00007F635300FFFFFF00B56F
        4700E2B66700F7E29300E8C16200E0A42D00DBA75E00DCA46200E1A72C00E4AF
        3F00E4B34900E8BD5F00F7E59600E2B66900B56F4700FFFFFF009B9B9B00510B
        00007E520300937E2F00845D00007C40000077430000784000007D430000804B
        0000804F000084590000938132007E520500510B00009B9B9B00FFFFFF00FCF9
        F800A74F1A00DFAF5A00F8E18900F1D87F00E7C05E00DEA54700E8BF6200E8C5
        6800F0D47C00F8E18A00DFAE5A00A74F1A00FCF9F800FFFFFF009B9B9B009895
        9400430000007B4B0000947D25008D741B00835C00007A410000845B00008461
        04008C701800947D26007B4A000043000000989594009B9B9B00FFFFFF00FFFF
        FF00FCF8F600AD634500C17C2C00E2B85B00F1D27400F8DF7F00F5DB7E00F0D1
        7300E2B85B00C17C2C00AD634500FCF8F600FFFFFF00FFFFFF009B9B9B009B9B
        9B0098949200490000005D1800007E5400008D6E1000947B1B0091771A008C6D
        0F007E5400005D18000049000000989492009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DCC1B700BD836200B05E1A00AE612300AE612300B05E
        1A00BD836200DCC1B700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00785D5300591F00004C0000004A0000004A0000004C00
        0000591F0000785D53009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnVoltarClick
    end
  end
end
