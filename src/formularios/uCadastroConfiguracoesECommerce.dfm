inherited frmCadastroConfiguracoesECommerce: TfrmCadastroConfiguracoesECommerce
  Caption = 'Configura'#231#245'es E-Commerce'
  ClientHeight = 497
  ClientWidth = 548
  ExplicitWidth = 564
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 455
    Width = 548
    ExplicitTop = 455
    ExplicitWidth = 548
  end
  inherited pgGeral: TPageControl
    Width = 548
    Height = 455
    ActivePage = tsDados
    ExplicitWidth = 548
    ExplicitHeight = 455
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 540
      ExplicitHeight = 425
      inherited gridConsulta: TDBGridCBN
        Width = 522
        Height = 397
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 406
        Width = 540
        ExplicitTop = 406
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 540
      ExplicitHeight = 425
      inherited pnlDados: TPanel
        Width = 540
        Height = 425
        ExplicitWidth = 540
        ExplicitHeight = 425
        inherited lblCamposObrigatorios: TLabel
          Left = 24
          Top = 410
          Visible = False
          ExplicitLeft = 24
          ExplicitTop = 410
        end
        inherited lblAsterisco: TLabel
          Left = 10
          Top = 406
          Visible = False
          ExplicitLeft = 10
          ExplicitTop = 406
        end
        object GroupBox1: TGroupBox
          Left = 11
          Top = 119
          Width = 505
          Height = 285
          Caption = ' Configura'#231#245'es importa'#231#227'o pedido '
          TabOrder = 1
          inline BuscaTabelaPreco: TBuscaTabelaPreco
            Left = 9
            Top = 18
            Width = 489
            Height = 55
            TabOrder = 0
            ExplicitLeft = 9
            ExplicitTop = 18
            ExplicitWidth = 489
            inherited StaticText2: TStaticText
              Left = 87
              Top = 24
              Width = 91
              Height = 18
              Font.Height = -12
              Font.Name = 'Calibri'
              Font.Style = []
              Transparent = True
              Visible = False
              ExplicitLeft = 87
              ExplicitTop = 24
              ExplicitWidth = 91
              ExplicitHeight = 18
            end
            inherited StaticText1: TStaticText
              Width = 92
              Height = 18
              Caption = 'Tabela de pre'#231'o'
              Font.Height = -12
              Font.Name = 'Calibri'
              Font.Style = []
              Transparent = True
              ExplicitWidth = 92
              ExplicitHeight = 18
            end
            inherited edtCodigo: TCurrencyEdit
              Width = 60
              ExplicitWidth = 60
            end
            inherited btnBusca: TBitBtn
              Left = 78
              Width = 27
              ExplicitLeft = 78
              ExplicitWidth = 27
            end
            inherited edtDescricao: TEdit
              Left = 110
              Width = 367
              Height = 23
              ExplicitLeft = 110
              ExplicitWidth = 367
              ExplicitHeight = 23
            end
          end
          inline BuscaEmpresa: TBuscaEmpresa
            Left = 8
            Top = 75
            Width = 486
            Height = 54
            TabOrder = 1
            ExplicitLeft = 8
            ExplicitTop = 75
            ExplicitWidth = 486
            ExplicitHeight = 54
            inherited lblRazao: TStaticText [0]
              Width = 74
              Height = 19
              Visible = False
              ExplicitWidth = 74
              ExplicitHeight = 19
            end
            inherited gpbEmpresa: TGroupBox [1]
              Top = 61
              Width = 486
              Align = alNone
              Visible = False
              ExplicitTop = 61
              ExplicitWidth = 486
            end
            inherited edtRazao: TEdit [2]
              Top = 20
              Height = 23
              ExplicitTop = 20
              ExplicitHeight = 23
            end
            inherited btnBusca: TBitBtn
              Left = 78
              Top = 17
              Width = 27
              ExplicitLeft = 78
              ExplicitTop = 17
              ExplicitWidth = 27
            end
            inherited edtCodigo: TEdit
              Top = 20
              Width = 60
              Height = 23
              Alignment = taRightJustify
              ExplicitTop = 20
              ExplicitWidth = 60
              ExplicitHeight = 23
            end
            inherited lblCodigo: TStaticText
              Top = 1
              Width = 51
              Height = 19
              Caption = 'Empresa'
              ExplicitTop = 1
              ExplicitWidth = 51
              ExplicitHeight = 19
            end
          end
          inline BuscaRepresentante: TBuscaPessoa
            Left = 17
            Top = 130
            Width = 469
            Height = 41
            AutoSize = True
            TabOrder = 2
            ExplicitLeft = 17
            ExplicitTop = 130
            ExplicitWidth = 469
            ExplicitHeight = 41
            inherited StaticText1: TStaticText
              Width = 82
              Height = 19
              Caption = 'Representante'
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ExplicitWidth = 82
              ExplicitHeight = 19
            end
            inherited edtCodigo: TCurrencyEdit
              Top = 18
              Width = 60
              ExplicitTop = 18
              ExplicitWidth = 60
            end
            inherited StaticText2: TStaticText
              Top = 19
              Visible = False
              ExplicitTop = 19
            end
            inherited btnBuscar: TBitBtn
              Left = 68
              Top = 16
              Width = 27
              ExplicitLeft = 68
              ExplicitTop = 16
              ExplicitWidth = 27
            end
            inherited edtRazao: TEdit
              Top = 18
              Width = 368
              Height = 23
              ExplicitTop = 18
              ExplicitWidth = 368
              ExplicitHeight = 23
            end
          end
          inline BuscaFormaPagamento: TBuscaFormaPagamento
            Left = 9
            Top = 177
            Width = 496
            Height = 55
            TabOrder = 3
            ExplicitLeft = 9
            ExplicitTop = 177
            ExplicitWidth = 496
            inherited StaticText2: TStaticText
              Top = 24
              ExplicitTop = 24
            end
            inherited StaticText1: TStaticText
              Top = 6
              Width = 119
              Height = 19
              Caption = 'Forma de pagamento'
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ExplicitTop = 6
              ExplicitWidth = 119
              ExplicitHeight = 19
            end
            inherited edtCodigo: TCurrencyEdit
              Width = 60
              ExplicitWidth = 60
            end
            inherited btnBusca: TBitBtn
              Left = 76
              Width = 27
              ExplicitLeft = 76
              ExplicitWidth = 27
            end
            inherited edtDescricao: TEdit
              Left = 109
              Width = 368
              Height = 23
              ExplicitLeft = 109
              ExplicitWidth = 368
              ExplicitHeight = 23
            end
          end
          object GroupBox3: TGroupBox
            Left = 2
            Top = 241
            Width = 501
            Height = 42
            Align = alBottom
            TabOrder = 4
            object Label3: TLabel
              Left = 16
              Top = 13
              Width = 225
              Height = 15
              Caption = 'Intervalo de verifica'#231#227'o de pedidos (min)'
            end
            object spnIntervalo: TSpinEdit
              Left = 256
              Top = 9
              Width = 81
              Height = 24
              MaxValue = 60
              MinValue = 5
              TabOrder = 0
              Value = 5
            end
          end
        end
        object edtCodigo: TEdit
          Left = 61
          Top = -3
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '0'
          Visible = False
        end
        object GroupBox2: TGroupBox
          Left = 11
          Top = 7
          Width = 505
          Height = 108
          TabOrder = 0
          object Label1: TLabel
            Left = 24
            Top = 8
            Width = 31
            Height = 15
            Caption = 'Token'
          end
          object Label2: TLabel
            Left = 24
            Top = 56
            Width = 50
            Height = 14
            Caption = 'URL Base'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
          end
          object edtToken: TEdit
            Left = 24
            Top = 24
            Width = 393
            Height = 23
            TabOrder = 0
          end
          object edtUrlBase: TEdit
            Left = 24
            Top = 70
            Width = 393
            Height = 23
            TabOrder = 1
          end
          object BitBtn1: TBitBtn
            Left = 423
            Top = 70
            Width = 34
            Height = 25
            Hint = 'Testar comunica'#231#227'o'
            Glyph.Data = {
              36080000424D3608000000000000360000002800000020000000100000000100
              2000000000000008000000000000000000000000000000000000FFFFFF001258
              CB000D5ED9000B58D3000C5DD7000E5DD6000E5AD3000E5AD3000E5CD5000E5C
              D5000E5BD3000E5AD3000E5BD3000E5CD6001256CA00FFFFFF009B9B9B000000
              67000000750000006F00000073000000720000006F0000006F00000071000000
              710000006F0000006F0000006F0000007200000066009B9B9B00105BCE000979
              FF00085EDE00256AD3000A5AD500046EF7000F80FF000E80FF000371FA000069
              F3000C7DFF000E7FFF000B7DFF000074FE000C80FF001059CE0000006A000015
              9B0000007A0000066F0000007100000A9300001C9B00001C9B00000D96000005
              8F0000199B00001B9B0000199B0000109A00001C9B0000006A000D63DE000F64
              D800BECDE600FBFAF900D3DBED002262CC000876F9000B74F200356CCB006288
              CF000C63DD000F80FE001062D800366ECE000E6DE7000F64DD0000007A000000
              74005A698200979695006F778900000068000012950000108E00000867000024
              6B0000007900001C9A0000007400000A6A0000098300000079000B55D400679C
              E300FFFFFF00FFFFFF00FFFFFF0096B3E300066FED000B6BE700C7D7ED00FFFF
              FF002B70D500006CEE005C88D300FAFAFA005D93DD000B58D500000070000338
              7F009B9B9B009B9B9B009B9B9B00324F7F00000B890000078300637389009B9B
              9B00000C710000088A0000246F0096969600002F7900000071000D5FDA005791
              E200FFFFFF00FFFFFF00FFFFFF0089AAE2000D7CF4000B64DD00E0E7F400FFFF
              FC002974DD000775F00085ABE400FFFFFF0074A5E7000B59D60000007600002D
              7E009B9B9B009B9B9B009B9B9B0025467E0000189000000079007C8390009B9B
              98000010790000118C00214780009B9B9B0010418300000072001D75E6000F70
              E600BECDE600ECEFF800BECDE6001F70DF000D82F8004383DE00FFFFFE00D5DF
              F300106CE3001176EB00CEDDF700FFFFFE004D90E5001167E00000118200000C
              82005A698200888B94005A698200000C7B00001E9400001F7A009B9B9A00717B
              8F0000087F00001287006A7993009B9B9A00002C810000037C002077E7002AA1
              FF00167FEE001B77E600197FEC001489F9001065DD00D5DFF300FFFFFF006696
              E1001385F4001C71E200F6F4F900F8F6FA002277E4001F7AE90000138300003D
              9B00001B8A0000138200001B88000025950000017900717B8F009B9B9B000232
              7D0000219000000D7E00929095009492960000138000001685002A81E9003CAF
              FF002497FA001A88F3001679EB00347EE400D5DFF300FFFFFF00D5DFF3001E7C
              E9001083F20071A0E700FFFFFF00CEDDF7002086EF002C85EA00001D8500004B
              9B000033960000248F0000158700001A8000717B8F009B9B9B00717B8F000018
              8500001F8E000D3C83009B9B9B006A79930000228B00002186003E8EEB0067C0
              FE005799E9009BC0EF00D1DFF600FFFEFD00FFFFFF00D5DFF300217BE6001B91
              F9002E7EE600E6EFF900FBFDFE005E9CEA0060BDFE003E8FEC00002A8700035C
              9A0000358500375C8B006D7B92009B9A99009B9B9B00717B8F0000178200002D
              9500001A8200828B950097999A000038860000599A00002B88004192EF0067BD
              FB00A8CBF400FFFFFF00FFFFFE00EAF1FC00D1DFF6003C92EE003BA3F9004095
              EE00E6EFF900FFFFFF00CEDDF70057ACF6007ED1FF003F91EE00002E8B000359
              9700446790009B9B9B009B9B9A00868D98006D7B9200002E8A00003F95000031
              8A00828B95009B9B9B006A799300004892001A6D9B00002D8A004495F00081D0
              FF005FAAF40088C2F70075B7F6005DABF40055B0F90051ACF90077B0F300E6EF
              F900FFFFFF00CEDDF70051A4F3007ACCFF0085D4FF004395F00000318C001D6C
              9B0000469000245E93001153920000479000004C950000489500134C8F00828B
              95009B9B9B006A79930000408F0016689B0021709B0000318C00479AF2008FDB
              FF0075C7FE0057B2FB0057AEF9005EAEF8007EBBF800CEDDF700FFFFFE00FFFF
              FF00CEDDF70051A5F40079CBFE0084D1FF008AD8FF00479AF30000368E002B77
              9B0011639A00004E9700004A9500004A94001A5794006A7993009B9B9A009B9B
              9B006A7993000041900015679A00206D9B0026749B0000368F004AA0F60085D4
              FF0071B3F900D7E8FC00E3EEFC00F4F7FD00FFFFFE00FFFFFF00E7F0FE008FC2
              F90059AEFA0084D4FF008CD7FF0089D5FF0092DCFF004A9FF600003C92002170
              9B000D4F9500738498007F8A9800909399009B9B9A009B9B9B00838C9A002B5E
              9500004A960020709B0028739B0025719B002E789B00003B92004FA6F90086D5
              FF0088C0FC00FFFEFF00FBFCFF00F4F8FF00C9E3FE0089C0FC006CB7FC0070C5
              FD0092DBFF0091D9FF008FD8FF008FD8FF009BE0FF004CA4F900004295002271
              9B00245C98009B9A9B0097989B0090949B00657F9A00255C9800085398000C61
              99002E779B002D759B002B749B002B749B00377C9B00004095003C99FB00A0E5
              FF007BC8FF0076BEFF007FC5FF0068B9FF0074C6FE0085D3FF0097DEFF00A0E3
              FF009BE0FF009BE0FF009BE0FF009CE1FF009EE4FF003F9AFB00003597003C81
              9B0017649B00125A9B001B619B0004559B0010629A00216F9B00337A9B003C7F
              9B00377C9B00377C9B00377C9B00387D9B003A809B0000369700FFFFFF00419E
              FE0054ADFE004AA7FE004EABFE0052ACFE0050ABFE004FA9FE004EA8FE004EA8
              FE004EA8FE004EA8FE004EA8FE0050AAFE00409EFE00FFFFFF009B9B9B00003A
              9A0000499A0000439A0000479A0000489A0000479A0000459A0000449A000044
              9A0000449A0000449A0000449A0000469A00003A9A009B9B9B00}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn1Click
          end
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsTOKEN: TStringField
      FieldName = 'TOKEN'
      Size = 44
    end
  end
end
