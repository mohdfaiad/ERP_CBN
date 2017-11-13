inherited frmDevolucao: TfrmDevolucao
  Caption = 'Devolu'#231#227'o'
  ClientHeight = 666
  ClientWidth = 1102
  OnShow = FormShow
  ExplicitWidth = 1118
  ExplicitHeight = 704
  PixelsPerInch = 96
  TextHeight = 15
  object pgcDevolucoes: TPageControl
    Left = 0
    Top = 0
    Width = 1102
    Height = 666
    ActivePage = Devolucao
    Align = alClient
    TabOrder = 0
    OnChange = pgcDevolucoesChange
    object TabSheet1: TTabSheet
      Caption = 'Devolucoes'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 14
        Top = 93
        Width = 71
        Height = 17
        Caption = 'Devolu'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGridCBN3: TDBGridCBN
        Left = 13
        Top = 114
        Width = 1065
        Height = 511
        Color = 14803425
        DataSource = dsDevolucoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridCBN1Enter
        OnExit = DBGridCBN1Exit
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
        TipoBusca.ListarApenasEncontrados = False
        TipoBusca.QualquerParte = False
        SalvaConfiguracoes = False
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODIGO_PEDIDO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMPEDIDO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOTIVO'
            Width = 832
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PARCIAL_TOTAL'
            Visible = False
          end>
      end
      object GroupBox2: TGroupBox
        Left = 264
        Top = 8
        Width = 813
        Height = 75
        TabOrder = 1
        object btnBuscar: TBitBtn
          Left = 533
          Top = 25
          Width = 121
          Height = 25
          Caption = 'Buscar'
          TabOrder = 0
          OnClick = btnBuscarClick
        end
        object btnCriar: TBitBtn
          Left = 669
          Top = 25
          Width = 121
          Height = 25
          Caption = 'Criar'
          TabOrder = 1
          OnClick = btnCriarClick
        end
      end
      object gpbPeriodo: TGroupBox
        Left = 13
        Top = 2
        Width = 257
        Height = 81
        Caption = ' Per'#237'odo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label6: TLabel
          Left = 15
          Top = 16
          Width = 57
          Height = 13
          Caption = 'Data Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 136
          Top = 16
          Width = 52
          Height = 13
          Caption = 'Data Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 1
          Top = 46
          Width = 254
          Height = 14
          AutoSize = False
          Caption = '___________________________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13487565
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object dtpInicio: TDateTimePicker
          Left = 15
          Top = 31
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
          Left = 136
          Top = 31
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
          Left = 48
          Top = 62
          Width = 161
          Height = 17
          Caption = 'Considerar per'#237'odo geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object Devolucao: TTabSheet
      Caption = 'Devolucao'
      ImageIndex = 1
      OnEnter = DevolucaoEnter
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 14
        Top = 537
        Width = 44
        Height = 17
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 14
        Top = 305
        Width = 101
        Height = 17
        Caption = 'Itens devolvidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 14
        Top = 69
        Width = 97
        Height = 17
        Caption = 'Itens do pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnMarcar: TSpeedButton
        Left = 904
        Top = 62
        Width = 174
        Height = 25
        Caption = ' Marcar como devolvido'
        Enabled = False
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5600D00C9651100FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0061000000650100009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0B00DD963B00EDBD6500C763
          1200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B006000000079320000895901006300
          00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C45D0D00DE922C00F5D67500F6BF2900D27C
          1600C9681700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B00600000007A2E000091721100925B00006E18
          0000650400009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C2580900E3931F00FCDC6E00F2B62B00E68A0000EF9B
          0000CE720C00C9681800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B005E0000007F2F000098780A008E520000822600008B37
          00006A0E0000650400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00C1570700E59F2E00FEE68C00F2BD3800EFA71B00EDA41800E68F
          0200ED9E0200D0730A00C9681900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B005D000000813B00009A8228008E5900008B43000089400000822B
          0000893A00006C0F0000650400009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00C1560500E5A54000FFF3B100F7D47400F5BD3600F3B53400EFA92100EC9C
          0E00E48C0000F0A90E00D4760800C9681A00FFFFFF00FFFFFF009B9B9B009B9B
          9B005D000000814100009B8F4D0093701000915900008F5100008B4500008838
          0000802800008C45000070120000650400009B9B9B009B9B9B00FFFFFF00C155
          0500E5A63F00FFFCCC00FDE9A200F8C94700F6C95100F4BD3C00F1B02C00EEA4
          1A00E9950500E18B0000F0AD1500D5770800C0550000FFFFFF009B9B9B005D00
          0000814200009B98680099853E009465000092650000905900008D4C00008A40
          0000853100007D2700008C490000711300005C0000009B9B9B00C1570800E4A5
          4100FFFEC800FFFBC800FDDE6700FBD46300F7CD5500F5C54700F3B63500EFA8
          2400ED9F1200E9930000E6910100F4BA2300D47A0B00C05500005D0000008041
          00009B9A64009B976400997A03009770000093690000916100008F5200008B44
          0000893B0000852F0000822D000090560000701600005C000000DA8A2600F8BE
          3300F3B83B00ECA01A00E7A33B00FFF7C700FAD26100F7C84E00F5BF4000F2B3
          2F00F3AB1C00CA670900BE510000BE510000BF540000C055000076260000945A
          00008F540000883C0000833F00009B936300966E000093640000915B00008E4F
          00008F470000660300005A0000005A0000005B0000005C000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E8A03700FFFDD900FBD76900F8CB5500F6C74900F4BD
          3900F5B42700C5610B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00843C00009B9975009773050094670000926300009059
          000091500000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EAA83D00FFFCD800FBDC7100F9D26000F7C95200F6C4
          4300F8BC3300C5600A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00864400009B98740097780D00956E0000936500009260
          000094580000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EBA83C00FFFEDD00FDE07A00FBD76900F9CF5C00F7CA
          4D00FCC63E00C5600900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00874400009B9A7900997C160097730500956B00009366
          000098620000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00ECAA3D00FFFFE000FEE38000FCDC7200F9D36500F8CD
          5600FDCD4700C55F0800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00884600009B9B7C009A7F1C0098780E00956F01009469
          000099690000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EDAB3E00FFFFE300FEE78900FDE17A00FBDA6F00FAD0
          6300FFD55500C45E0700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00894700009B9B7F009A832500997D160097760B00966C
          00009B710000600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EEB14400FFFFFA00FFF49D00FFF08E00FFEB8300FFE6
          7600FFE76700C45E0600FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008A4D00009B9B96009B9039009B8C2A009B871F009B82
          12009B830300600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EEA42A00F1BC5A00EDAC3800E9A23100E3982E00DE91
          2800DC8C2500CA671300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008A4000008D58000089480000853E00007F3400007A2D
          000078280000660300009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        OnClick = btnMarcarClick
      end
      object btnDesmarcar: TSpeedButton
        Left = 904
        Top = 297
        Width = 174
        Height = 25
        Caption = ' Voltar como item normal'
        Enabled = False
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00DF640F00D9620900DA600900D6590800D0540600CE4E
          0200CB4B0000D3500800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B007B0000007500000076000000720000006C0000006A00
          0000670000006F0000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EC8A2100F6C34E00F09F2000F0971800EF911500EE8B
          0F00E37D0A00DA680A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B0088260000925F00008C3B00008C3300008B2D00008A27
          00007F190000760400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EC882100F6D47F00EFA53200ED951D00ED941C00EF92
          1700E2821100DA6B0F00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008824000092701B008B41000089310000893000008B2E
          00007E1E0000760700009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00ED912500F6D88A00F0AE3D00EF9F2600EE9D2600F09A
          1F00E4891900DB721300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00892D0000927426008C4A00008B3B00008A3900008C36
          000080250000770E00009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EF9A2B00F8DE9C00F2B44700F0A63200F0A53000F1A3
          2900E7932100DC781900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008B360000947A38008E5000008C4200008C4100008D3F
          0000832F0000781400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F0A03100F9E2AB00F3BB5300F2AF3B00F1AC3900F3AA
          3300E89E2B00DC781F00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008C3C0000957E47008F5700008E4B00008D4800008F46
          0000843A0000781400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F1A13700FAEABE00F4C26100F3B54400F2B64500F4B3
          3E00E7A53500E0822500FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008D3D000096865A00905E00008F5100008E520000904F
          0000834100007C1E00009B9B9B009B9B9B009B9B9B009B9B9B00ED820B00ED95
          2500ED8F1B00EA780300F3A94300FBE7B600F6C56A00F4BD5400F4BB5100F6BA
          4A00EAAA4100D7782100DC700E00E26E1000E5781600E46A0C00891E00008931
          0000892B0000861400008F450000978352009261060090590000905700009256
          00008646000073140000780C00007E0A00008114000080060000EF830700EEA0
          3100FAE39F00F9D59300F8D17C00F8CC7000F7C86800F6C56300F5C15B00F6C0
          5500EDAF4A00DF973700E99B3600F0B03E00E5801A00E56508008B1F00008A3C
          0000967F3B0095712F00946D180094680C009364040092610000915D0000925C
          0000894B00007B330000853700008C4C0000811C000081010000FFFFFF00ED71
          0400F1AA5500FEFDF100FCE7BF00F9CE7000F8CF7A00F7CB7200F7C86900F6C3
          6100F6C05900F7C05400F8CB5D00ED9A2E00E6670A00FFFFFF009B9B9B00890D
          00008D4600009A998D0098835B00956A0C00946B160093670E0093640500925F
          0000925C0000935C00009467000089360000820300009B9B9B00FFFFFF00FFFF
          FF00ED6F0000F1AC5000FEF8E400FBE1AD00F9D17D00F8D27F00F8CF7700F7CA
          6D00F7C76500F9D06F00EEA13900E7690700FFFFFF00FFFFFF009B9B9B009B9B
          9B00890B00008D4800009A948000977D4900956D1900946E1B00946B13009366
          090093630100956C0B008A3D0000830500009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00EE700000F2B35C00FFFAEB00FCE2AD00F9D58300F9D38300F9CE
          7A00FAD88500EFAE4A00E96F0800FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B008A0C00008E4F00009B968700987E490095711F00956F1F00956A
          1600967421008B4A0000850B00009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EF780000F5BB6800FFFAEC00FCE1AC00FAD78800FCE1
          9F00F4BB5F00ED770900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008B140000915704009B968800987D480096732400987D
          3B0090570000891300009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00F17D0000F5C17000FFF9EC00FEEFD000F6C6
          7100EE7F0A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B008D190000915D0C009B9588009A8B6C009262
          0D008A1B00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3860100F8CF8700F9DC9B00F188
          0C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B008F220000946B2300957837008D24
          00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2950E00F3971400FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B008E3100008F3300009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        OnClick = btnDesmarcarClick
      end
      object btnVoltarTodo: TSpeedButton
        Left = 720
        Top = 297
        Width = 174
        Height = 25
        Caption = ' Voltar todo o pedido'
        Enabled = False
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00DF640F00D9620900DA600900D6590800D0540600CE4E
          0200CB4B0000D3500800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B007B0000007500000076000000720000006C0000006A00
          0000670000006F0000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EC8A2100F6C34E00F09F2000F0971800EF911500EE8B
          0F00E37D0A00DA680A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B0088260000925F00008C3B00008C3300008B2D00008A27
          00007F190000760400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EC882100F6D47F00EFA53200ED951D00ED941C00EF92
          1700E2821100DA6B0F00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008824000092701B008B41000089310000893000008B2E
          00007E1E0000760700009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00ED912500F6D88A00F0AE3D00EF9F2600EE9D2600F09A
          1F00E4891900DB721300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00892D0000927426008C4A00008B3B00008A3900008C36
          000080250000770E00009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EF9A2B00F8DE9C00F2B44700F0A63200F0A53000F1A3
          2900E7932100DC781900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008B360000947A38008E5000008C4200008C4100008D3F
          0000832F0000781400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F0A03100F9E2AB00F3BB5300F2AF3B00F1AC3900F3AA
          3300E89E2B00DC781F00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008C3C0000957E47008F5700008E4B00008D4800008F46
          0000843A0000781400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F1A13700FAEABE00F4C26100F3B54400F2B64500F4B3
          3E00E7A53500E0822500FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008D3D000096865A00905E00008F5100008E520000904F
          0000834100007C1E00009B9B9B009B9B9B009B9B9B009B9B9B00ED820B00ED95
          2500ED8F1B00EA780300F3A94300FBE7B600F6C56A00F4BD5400F4BB5100F6BA
          4A00EAAA4100D7782100DC700E00E26E1000E5781600E46A0C00891E00008931
          0000892B0000861400008F450000978352009261060090590000905700009256
          00008646000073140000780C00007E0A00008114000080060000EF830700EEA0
          3100FAE39F00F9D59300F8D17C00F8CC7000F7C86800F6C56300F5C15B00F6C0
          5500EDAF4A00DF973700E99B3600F0B03E00E5801A00E56508008B1F00008A3C
          0000967F3B0095712F00946D180094680C009364040092610000915D0000925C
          0000894B00007B330000853700008C4C0000811C000081010000FFFFFF00ED71
          0400F1AA5500FEFDF100FCE7BF00F9CE7000F8CF7A00F7CB7200F7C86900F6C3
          6100F6C05900F7C05400F8CB5D00ED9A2E00E6670A00FFFFFF009B9B9B00890D
          00008D4600009A998D0098835B00956A0C00946B160093670E0093640500925F
          0000925C0000935C00009467000089360000820300009B9B9B00FFFFFF00FFFF
          FF00ED6F0000F1AC5000FEF8E400FBE1AD00F9D17D00F8D27F00F8CF7700F7CA
          6D00F7C76500F9D06F00EEA13900E7690700FFFFFF00FFFFFF009B9B9B009B9B
          9B00890B00008D4800009A948000977D4900956D1900946E1B00946B13009366
          090093630100956C0B008A3D0000830500009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00EE700000F2B35C00FFFAEB00FCE2AD00F9D58300F9D38300F9CE
          7A00FAD88500EFAE4A00E96F0800FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B008A0C00008E4F00009B968700987E490095711F00956F1F00956A
          1600967421008B4A0000850B00009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EF780000F5BB6800FFFAEC00FCE1AC00FAD78800FCE1
          9F00F4BB5F00ED770900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008B140000915704009B968800987D480096732400987D
          3B0090570000891300009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00F17D0000F5C17000FFF9EC00FEEFD000F6C6
          7100EE7F0A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B008D190000915D0C009B9588009A8B6C009262
          0D008A1B00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3860100F8CF8700F9DC9B00F188
          0C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B008F220000946B2300957837008D24
          00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2950E00F3971400FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B008E3100008F3300009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        OnClick = btnVoltarTodoClick
      end
      object btnDevolverTodo: TSpeedButton
        Left = 720
        Top = 62
        Width = 174
        Height = 25
        Caption = ' Devolver todo o pedido'
        Enabled = False
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5600D00C9651100FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0061000000650100009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0B00DD963B00EDBD6500C763
          1200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B009B9B9B006000000079320000895901006300
          00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00C45D0D00DE922C00F5D67500F6BF2900D27C
          1600C9681700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B009B9B9B00600000007A2E000091721100925B00006E18
          0000650400009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00C2580900E3931F00FCDC6E00F2B62B00E68A0000EF9B
          0000CE720C00C9681800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B005E0000007F2F000098780A008E520000822600008B37
          00006A0E0000650400009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00C1570700E59F2E00FEE68C00F2BD3800EFA71B00EDA41800E68F
          0200ED9E0200D0730A00C9681900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B005D000000813B00009A8228008E5900008B43000089400000822B
          0000893A00006C0F0000650400009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00C1560500E5A54000FFF3B100F7D47400F5BD3600F3B53400EFA92100EC9C
          0E00E48C0000F0A90E00D4760800C9681A00FFFFFF00FFFFFF009B9B9B009B9B
          9B005D000000814100009B8F4D0093701000915900008F5100008B4500008838
          0000802800008C45000070120000650400009B9B9B009B9B9B00FFFFFF00C155
          0500E5A63F00FFFCCC00FDE9A200F8C94700F6C95100F4BD3C00F1B02C00EEA4
          1A00E9950500E18B0000F0AD1500D5770800C0550000FFFFFF009B9B9B005D00
          0000814200009B98680099853E009465000092650000905900008D4C00008A40
          0000853100007D2700008C490000711300005C0000009B9B9B00C1570800E4A5
          4100FFFEC800FFFBC800FDDE6700FBD46300F7CD5500F5C54700F3B63500EFA8
          2400ED9F1200E9930000E6910100F4BA2300D47A0B00C05500005D0000008041
          00009B9A64009B976400997A03009770000093690000916100008F5200008B44
          0000893B0000852F0000822D000090560000701600005C000000DA8A2600F8BE
          3300F3B83B00ECA01A00E7A33B00FFF7C700FAD26100F7C84E00F5BF4000F2B3
          2F00F3AB1C00CA670900BE510000BE510000BF540000C055000076260000945A
          00008F540000883C0000833F00009B936300966E000093640000915B00008E4F
          00008F470000660300005A0000005A0000005B0000005C000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00E8A03700FFFDD900FBD76900F8CB5500F6C74900F4BD
          3900F5B42700C5610B00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00843C00009B9975009773050094670000926300009059
          000091500000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EAA83D00FFFCD800FBDC7100F9D26000F7C95200F6C4
          4300F8BC3300C5600A00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00864400009B98740097780D00956E0000936500009260
          000094580000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EBA83C00FFFEDD00FDE07A00FBD76900F9CF5C00F7CA
          4D00FCC63E00C5600900FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00874400009B9A7900997C160097730500956B00009366
          000098620000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00ECAA3D00FFFFE000FEE38000FCDC7200F9D36500F8CD
          5600FDCD4700C55F0800FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00884600009B9B7C009A7F1C0098780E00956F01009469
          000099690000610000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EDAB3E00FFFFE300FEE78900FDE17A00FBDA6F00FAD0
          6300FFD55500C45E0700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B00894700009B9B7F009A832500997D160097760B00966C
          00009B710000600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EEB14400FFFFFA00FFF49D00FFF08E00FFEB8300FFE6
          7600FFE76700C45E0600FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008A4D00009B9B96009B9039009B8C2A009B871F009B82
          12009B830300600000009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00EEA42A00F1BC5A00EDAC3800E9A23100E3982E00DE91
          2800DC8C2500CA671300FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
          9B009B9B9B009B9B9B008A4000008D58000089480000853E00007F3400007A2D
          000078280000660300009B9B9B009B9B9B009B9B9B009B9B9B00}
        NumGlyphs = 2
        OnClick = btnDevolverTodoClick
      end
      object DBGridCBN1: TDBGridCBN
        Left = 13
        Top = 90
        Width = 1065
        Height = 201
        Color = 14803425
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridCBN1Enter
        OnExit = DBGridCBN1Exit
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
        TipoBusca.ListarApenasEncontrados = False
        TipoBusca.QualquerParte = False
        SalvaConfiguracoes = False
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Width = 344
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COR'
            Width = 287
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_RN'
            Title.Caption = 'RN'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_P'
            Title.Caption = 'P'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_M'
            Title.Caption = 'M'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_G'
            Title.Caption = 'G'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_1'
            Title.Caption = '1'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_2'
            Title.Caption = '2'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_3'
            Title.Caption = '3'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_4'
            Title.Caption = '4'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_6'
            Title.Caption = '6'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_8'
            Title.Caption = '8'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_10'
            Title.Caption = '10'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_12'
            Title.Caption = '12'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_14'
            Title.Caption = '14'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_UNICA'
            Title.Caption = 'UNICA'
            Width = 44
            Visible = True
          end>
      end
      object edtMotivo: TEdit
        Left = 13
        Top = 556
        Width = 1065
        Height = 21
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 15
        Top = -2
        Width = 1064
        Height = 58
        Caption = ' Selecione o pedido '
        TabOrder = 0
        object Label17: TLabel
          Left = 604
          Top = 11
          Width = 58
          Height = 17
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 500
          Top = 11
          Width = 70
          Height = 17
          Caption = 'Total bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 708
          Top = 11
          Width = 85
          Height = 17
          Caption = 'Desconto F.P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 812
          Top = 11
          Width = 80
          Height = 17
          Caption = 'Total l'#237'quido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDesconto: TCurrencyEdit
          Left = 604
          Top = 29
          Width = 89
          Height = 21
          TabStop = False
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 0
        end
        object edtTotBruto: TCurrencyEdit
          Left = 500
          Top = 29
          Width = 89
          Height = 21
          TabStop = False
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 1
        end
        object edtDescontoFP: TCurrencyEdit
          Left = 708
          Top = 29
          Width = 89
          Height = 21
          TabStop = False
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 3
        end
        object edtTotLiquido: TCurrencyEdit
          Left = 812
          Top = 29
          Width = 89
          Height = 21
          TabStop = False
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          ReadOnly = True
          TabOrder = 2
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 593
        Width = 1094
        Height = 43
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 4
        ExplicitTop = 595
        object btnCancelar: TSpeedButton
          Left = 727
          Top = 8
          Width = 170
          Height = 25
          Caption = 'Cancelar'
          OnClick = btnCancelarClick
        end
        object btnSalvar: TSpeedButton
          Left = 907
          Top = 8
          Width = 170
          Height = 25
          Caption = 'Salvar'
          OnClick = btnSalvarClick
        end
      end
      object DBGridCBN2: TDBGridCBN
        Left = 13
        Top = 328
        Width = 1065
        Height = 201
        Color = 14803425
        DataSource = dsDevolvidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridCBN2Enter
        OnExit = DBGridCBN2Exit
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
        TipoBusca.ListarApenasEncontrados = False
        TipoBusca.QualquerParte = False
        SalvaConfiguracoes = False
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Width = 344
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COR'
            Width = 287
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_RN'
            Title.Caption = 'RN'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_P'
            Title.Caption = 'P'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_M'
            Title.Caption = 'M'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_G'
            Title.Caption = 'G'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_1'
            Title.Caption = '1'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_2'
            Title.Caption = '2'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_3'
            Title.Caption = '3'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_4'
            Title.Caption = '4'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_6'
            Title.Caption = '6'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_8'
            Title.Caption = '8'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_10'
            Title.Caption = '10'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_12'
            Title.Caption = '12'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_14'
            Title.Caption = '14'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_UNICA'
            Title.Caption = 'UNICA'
            Width = 44
            Visible = True
          end>
      end
    end
  end
  object cdsDevolvidos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterDelete = cdsDevolvidosAfterDelete
    Left = 344
    Top = 320
    object cdsDevolvidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsDevolvidosQTD_RN: TFloatField
      FieldName = 'QTD_RN'
    end
    object cdsDevolvidosQTD_P: TFloatField
      FieldName = 'QTD_P'
    end
    object cdsDevolvidosQTD_M: TFloatField
      FieldName = 'QTD_M'
    end
    object cdsDevolvidosQTD_G: TFloatField
      FieldName = 'QTD_G'
    end
    object cdsDevolvidosQTD_1: TFloatField
      FieldName = 'QTD_1'
    end
    object cdsDevolvidosQTD_2: TFloatField
      FieldName = 'QTD_2'
    end
    object cdsDevolvidosQTD_3: TFloatField
      FieldName = 'QTD_3'
    end
    object cdsDevolvidosQTD_4: TFloatField
      FieldName = 'QTD_4'
    end
    object cdsDevolvidosQTD_6: TFloatField
      FieldName = 'QTD_6'
    end
    object cdsDevolvidosQTD_8: TFloatField
      FieldName = 'QTD_8'
    end
    object cdsDevolvidosQTD_10: TFloatField
      FieldName = 'QTD_10'
    end
    object cdsDevolvidosQTD_12: TFloatField
      FieldName = 'QTD_12'
    end
    object cdsDevolvidosQTD_14: TFloatField
      FieldName = 'QTD_14'
    end
    object cdsDevolvidosQTD_UNICA: TFloatField
      FieldName = 'QTD_UNICA'
    end
    object cdsDevolvidosCOR: TStringField
      FieldName = 'COR'
    end
    object cdsDevolvidosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 30
    end
    object cdsDevolvidosDEVOLVIDO: TStringField
      FieldName = 'DEVOLVIDO'
      Size = 1
    end
  end
  object ds: TDataSource
    DataSet = cdsNormais
    Left = 432
    Top = 249
  end
  object cdsNormais: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterDelete = cdsNormaisAfterDelete
    Left = 344
    Top = 248
    object cdsNormaisCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsNormaisQTD_RN: TFloatField
      FieldName = 'QTD_RN'
    end
    object cdsNormaisQTD_P: TFloatField
      FieldName = 'QTD_P'
    end
    object cdsNormaisQTD_M: TFloatField
      FieldName = 'QTD_M'
    end
    object cdsNormaisQTD_G: TFloatField
      FieldName = 'QTD_G'
    end
    object cdsNormaisQTD_1: TFloatField
      FieldName = 'QTD_1'
    end
    object cdsNormaisQTD_2: TFloatField
      FieldName = 'QTD_2'
    end
    object cdsNormaisQTD_3: TFloatField
      FieldName = 'QTD_3'
    end
    object cdsNormaisQTD_4: TFloatField
      FieldName = 'QTD_4'
    end
    object cdsNormaisQTD_6: TFloatField
      FieldName = 'QTD_6'
    end
    object cdsNormaisQTD_8: TFloatField
      FieldName = 'QTD_8'
    end
    object cdsNormaisQTD_10: TFloatField
      FieldName = 'QTD_10'
    end
    object cdsNormaisQTD_12: TFloatField
      FieldName = 'QTD_12'
    end
    object cdsNormaisQTD_14: TFloatField
      FieldName = 'QTD_14'
    end
    object cdsNormaisQTD_UNICA: TFloatField
      FieldName = 'QTD_UNICA'
    end
    object cdsNormaisCOR: TStringField
      FieldName = 'COR'
    end
    object cdsNormaisPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 30
    end
    object cdsNormaisDEVOLVIDO: TStringField
      FieldName = 'DEVOLVIDO'
      Size = 1
    end
  end
  object dsDevolvidos: TDataSource
    DataSet = cdsDevolvidos
    Left = 432
    Top = 321
  end
  object dsDevolucoes: TDataSource
    DataSet = qryDevolucoes
    Left = 152
    Top = 297
  end
  object qryDevolucoes: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      'select d.*, p.numpedido from devolucoes d        '
      'left join pedidos p on p.codigo = d.codigo_pedido')
    Left = 152
    Top = 240
    object qryDevolucoesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDevolucoesCODIGO_PEDIDO: TIntegerField
      FieldName = 'CODIGO_PEDIDO'
      Origin = 'CODIGO_PEDIDO'
    end
    object qryDevolucoesDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryDevolucoesMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
      Size = 150
    end
    object qryDevolucoesPARCIAL_TOTAL: TStringField
      FieldName = 'PARCIAL_TOTAL'
      Origin = 'PARCIAL_TOTAL'
      FixedChar = True
      Size = 1
    end
    object qryDevolucoesNUMPEDIDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      ProviderFlags = []
      ReadOnly = True
      Size = 22
    end
  end
end
