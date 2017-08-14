object frmRelatorioTabelasPreco: TfrmRelatorioTabelasPreco
  Left = 0
  Top = 0
  Caption = 'Relatorio de Tabela de Precos'
  ClientHeight = 144
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 25
    Top = 109
    Width = 794
    Height = 1123
    Margins.LeftMargin = 6.000000000000000000
    Margins.RightMargin = 6.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = True
    Borders.DrawTop = True
    Borders.DrawRight = True
    Borders.DrawBottom = True
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 24
      Top = 39
      Width = 746
      Height = 65
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object rlbTitulo: TRLLabel
        Left = 275
        Top = 16
        Width = 168
        Height = 24
        Alignment = taCenter
        Caption = 'Tabela de pre'#231'os'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 24
      Top = 104
      Width = 746
      Height = 80
      DataFields = 'GRUPO'
      object RLBTituloItens: TRLBand
        Left = 0
        Top = 0
        Width = 746
        Height = 19
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLDBText1: TRLDBText
          Left = 4
          Top = 2
          Width = 51
          Height = 16
          DataField = 'GRUPO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLBItens: TRLBand
        Left = 0
        Top = 39
        Width = 746
        Height = 20
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText9: TRLDBText
          Left = 2
          Top = 2
          Width = 80
          Height = 15
          Alignment = taCenter
          DataField = 'REFERENCIA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 85
          Top = 2
          Width = 352
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 473
          Top = 2
          Width = 61
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'GRADE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel6
          ParentFont = False
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 547
          Top = 2
          Width = 105
          Height = 15
          DataField = 'DESC_TIPO_COR'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel4
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 698
          Top = 2
          Width = 46
          Height = 15
          Alignment = taRightJustify
          DataField = 'PRECO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 669
          Top = 2
          Width = 19
          Height = 15
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 19
        Width = 746
        Height = 20
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLLabel4: TRLLabel
          Left = 547
          Top = 3
          Width = 105
          Height = 15
          AutoSize = False
          Caption = 'CORES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 669
          Top = 3
          Width = 75
          Height = 15
          AutoSize = False
          Caption = 'PRE'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 473
          Top = 3
          Width = 61
          Height = 15
          Caption = 'TAMANHO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 4
          Top = 3
          Width = 77
          Height = 15
          AutoSize = False
          Caption = 'REF.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 85
          Top = 3
          Width = 352
          Height = 15
          AutoSize = False
          Caption = 'DESCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inline BuscaTabelaPreco1: TBuscaTabelaPreco
    Left = 32
    Top = 24
    Width = 425
    Height = 55
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 24
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 492
    Height = 39
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 116
    ExplicitWidth = 490
    DesignSize = (
      492
      39)
    object btnImprimir: TSpeedButton
      Left = 312
      Top = 5
      Width = 169
      Height = 30
      Anchors = [akTop, akRight]
      Caption = 'Gerar plan'#237'lha'
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
      OnClick = btnImprimirClick
      ExplicitLeft = 314
    end
    object btnSair: TSpeedButton
      Left = 131
      Top = 5
      Width = 169
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '<ESC> Sair'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD6B2C00E1A5
        3C00E7C69000F3E1C400F9F1E300FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00490700007D41
        000083622C008F7D6000958D7F009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5CEBB00B6B7BA00975C1A00DF9C
        1F00CC891B00CD8A1B00CD8A1B00D7A24A00E6BF7400E5CEB8009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00816A570052535600330000007B38
        0000682500006926000069260000733E0000825B1000816A5400FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B366240012101900804A0900E39C
        2000CB891C00CD8A1C00CD8A1C00CC891C00D6941C00AC641D009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B004F020000000000001C0000007F38
        0000672500006926000069260000682500007230000048000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C77C2D0013111A00864F0900E49A
        2100CD8A1D00CF8B1D00CF8B1D00CE8A1D00D8941B00B4702B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B006318000000000000220000008036
        0000692600006B2700006B2700006A26000074300000500C0000FFFFFF00FFFF
        FF00FFFFFF00FEFEFF002121CB00FFFFFF00D792410014111B008A530B00E69E
        2200CE8C1F00CF8D1F00CF8D1F00CE8C1F00D6941D00B77430009B9B9B009B9B
        9B009B9B9B009A9A9B00000067009B9B9B00732E00000000000026000000823A
        00006A2800006B2900006B2900006A2800007230000053100000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF001614D900242AF500AE6E4100251A00008E530E00D892
        2000CF8C1F00D08F2300D08F2200CF8E2200D7962000BB7934009B9B9B009B9B
        9B009B9B9B009B9B9B0000007500000091004A0A0000000000002A000000742E
        00006B2800006C2B00006C2B00006B2A000073320000571500003039E8001D2A
        E800232CE800222EEB002430EF002032FF001B25F90000002F00AA6F0600E4EA
        F100BC741800D6932400D2922700D2912700D8992500BF7E3600000084000000
        8400000084000000870000008B0000009B000000950000000000460B00008086
        8D0058100000722F00006E2E00006E2D0000743500005B1A0000616EF000152E
        F400223AF4002137F4002338F200273AEF00213CFF002B3FFF0089564500FAD2
        7300D29A3D00D6982E00D3922900D4932B00DA9C2D00C3833900000A8C000000
        9000000090000000900000008E0000008B0000009B0000009B0025000000966E
        0F006E360000723400006F2E0000702F0000763800005F1F00006B7BF5004565
        F7004A67F6004E69F600425CF3001F3CF2005E7FFF001F28B900A4682000F0BA
        4D00DEAE5600DFAF5800DBA74900D59A3600DB9F3100C6893E00071791000001
        9300000392000005920000008F0000008E00001B9B0000005500400400008C56
        00007A4A00007B4B00007743000071360000773B0000622500005A61F000656F
        F100636DF1006670F000495FF100638AFF008667B4000D030000AA762800F2C4
        6D00E0B05D00E0B25E00E2B46200E2B26100E1AE4B00CB8C3F0000008C00010B
        8D0000098D00020C8C0000008D0000269B002203500000000000461200008E60
        09007C4C00007C4E00007E5000007E4E00007D4A000067280000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF003B40F0005461FF00EAA94F0022180B00A8793A00F5CA
        7700E2B76800E3B86900E3B86900E4B86A00EAC37700D2994D009B9B9B009B9B
        9B009B9B9B009B9B9B0000008C0000009B008645000000000000441500009166
        13007E5304007F5405007F54050080540600865F13006E350000FFFFFF00FFFF
        FF00FFFFFF00FBFBFF002222FF00FFFFFF00F7B64D001C101400B2803F00F8D2
        8400E6BF7300E7C07400E7C07400E7BF7300ECCB8000D69E53009B9B9B009B9B
        9B009B9B9B0097979B0000009B009B9B9B0093520000000000004E1C0000946E
        2000825B0F00835C1000835C1000835B0F0088671C00723A0000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6B245001D121200B9894900FDD9
        9100EAC68100EAC58100EAC58100EAC58100F0D08F00D9A458009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00924E000000000000552500009975
        2D0086621D0086611D0086611D0086611D008C6C2B0075400000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7AC5C00180D0E00C4995700FFF2
        AF00FFE09D00FFE4A000F8DB9A00F3D49500F5DEA300DEAC5D009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B008348000000000000603500009B8E
        4B009B7C39009B803C00947736008F703100917A3F007A480000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECB15C00301F1B00231F20006E5A
        44009E866300BBA77C00DDC18C00F1D39900FEEBBA00E3B265009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00884D000000000000000000000A00
        00003A22000057431800795D28008D6F35009A8756007F4E0100FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAB96800DCA85100D09D4E00C594
        4700BA8A4100B3823900CF9A4800DFAC5400E9B96400E4B360009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B0086550400784400006C3900006130
        0000562600004F1E00006B3600007B48000085550000804F0000}
      NumGlyphs = 2
      OnClick = btnSairClick
      ExplicitLeft = 133
    end
  end
  object qry: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select tp.codigo codtabela, pro.referencia, pro.descricao, gra.d' +
        'escricao grade,'
      '       pro.desc_tipo_cor, ptp.preco, col.descricao "COLECAO",'
      
        '       grp.descricao ||'#39' '#39'|| iif(( select first 1 count( distinc' +
        't col2.codigo)'
      '                                from colecao col2'
      
        '                              left join produtos pro2 on col2.co' +
        'digo = pro2.cod_colecao'
      
        '                              left join grupo grp2 on grp2.codig' +
        'o = pro2.cod_grupo'
      ''
      
        '                                where pro2.cod_grupo = pro.cod_g' +
        'rupo and col2.descricao <> '#39'UNICA'#39
      '                              group by grp2.codigo'
      
        '                              order by grp2.codigo) > 1, col.des' +
        'cricao, '#39#39') "GRUPO",'
      'iif(position('#39'1/1'#39' in  grp.descricao) > 0, 2, 1)  ordemGrupo'
      ''
      'from tabelas_preco tp'
      ' left join produto_tabela_preco ptp on ptp.codtabela = tp.codigo'
      ' left join produtos pro on pro.codigo = ptp.codproduto'
      ' left join grades gra on gra.codigo = pro.cod_grade'
      ' left join colecao col on col.codigo = pro.cod_colecao'
      ' left join grupo grp on grp.codigo = pro.cod_grupo'
      ''
      
        'where tp.codigo = :codigoTabela and pro.ativo = '#39'S'#39' and pro.kit ' +
        '<> '#39'S'#39' and pro.ativo = '#39'S'#39' and position('#39'KIT'#39' in grp.descricao) ' +
        '= 0'
      'order by ordemGrupo, col.descricao, grp.codigo')
    Left = 168
    Top = 64
    ParamData = <
      item
        Name = 'CODIGOTABELA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCODTABELA: TIntegerField
      FieldName = 'CODTABELA'
      Origin = 'CODIGO'
      Required = True
    end
    object qryREFERENCIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryGRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRADE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryDESC_TIPO_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_TIPO_COR'
      Origin = 'DESC_TIPO_COR'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryPRECO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO'
      Origin = 'PRECO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ' ,0.00; -,0.00'
      Precision = 18
      Size = 2
    end
    object qryCOLECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COLECAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 131
    end
    object qryORDEMGRUPO: TIntegerField
      FieldName = 'ORDEMGRUPO'
    end
  end
  object ds: TDataSource
    DataSet = qry
    Left = 216
    Top = 64
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 288
    Top = 72
  end
  object RLRichFilter1: TRLRichFilter
    DisplayName = 'Formato RichText'
    Left = 96
    Top = 80
  end
end
