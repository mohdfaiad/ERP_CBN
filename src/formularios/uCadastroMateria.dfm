inherited frmCadastroMateria: TfrmCadastroMateria
  Left = 260
  Top = 131
  Caption = 'Cadastro de Mat'#233'rias'
  ClientHeight = 485
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlBotoes: TPanel
    Top = 443
    ExplicitTop = 443
  end
  inherited pgGeral: TPageControl
    Height = 443
    ActivePage = tsDados
    ExplicitHeight = 443
    inherited tsConsulta: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 413
      inherited gridConsulta: TDBGridCBN
        Height = 385
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 580
            Visible = True
          end>
      end
      inherited lblAjudaSelecionar: TStaticText
        Top = 394
        Width = 240
        ExplicitTop = 394
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 696
      ExplicitHeight = 413
      inherited pnlDados: TPanel
        Height = 413
        ExplicitHeight = 413
        inherited lblCamposObrigatorios: TLabel
          Top = 390
          ExplicitTop = 390
        end
        inherited lblAsterisco: TLabel
          Top = 386
          ExplicitTop = 386
        end
        object Label12: TLabel
          Left = 16
          Top = 81
          Width = 76
          Height = 13
          Caption = 'Pre'#231'o de custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 128
          Top = 81
          Width = 80
          Height = 13
          Caption = 'Pre'#231'o de venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 240
          Top = 81
          Width = 74
          Height = 13
          Caption = 'Estoque F'#237'sico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 352
          Top = 81
          Width = 86
          Height = 13
          Caption = 'Estoque M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 16
          Top = 25
          Width = 49
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 480
          Top = 25
          Width = 27
          Height = 13
          Caption = 'NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 480
          Top = 81
          Width = 90
          Height = 13
          Caption = 'Controla estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3355443
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodigo: TEdit
          Left = 169
          Top = 16
          Width = 65
          Height = 21
          TabStop = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          Visible = False
        end
        object edtDescricao: TEdit
          Left = 17
          Top = 41
          Width = 424
          Height = 23
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object edtCodNCM: TEdit
          Left = 481
          Top = 41
          Width = 128
          Height = 23
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 2
          OnKeyPress = edtCodNCMKeyPress
        end
        object edtPrecoCusto: TCurrencyEdit
          Left = 16
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 3
        end
        object edtPrecoVenda: TCurrencyEdit
          Left = 128
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 4
        end
        object edtEstoqueFisico: TCurrencyEdit
          Left = 240
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          Enabled = False
          TabOrder = 5
        end
        object edtEstoqueMinimo: TCurrencyEdit
          Left = 352
          Top = 99
          Width = 89
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 6
        end
        object cbxControlaEstoque: TComboBox
          Left = 480
          Top = 99
          Width = 129
          Height = 23
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 7
          Text = 'N'#195'O'
          Items.Strings = (
            'SIM'
            'N'#195'O')
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 144
          Width = 593
          Height = 240
          Caption = ' Configura'#231#227'o de unidade de entrada e sa'#237'da '
          TabOrder = 8
          object Label8: TLabel
            Left = 255
            Top = 48
            Width = 56
            Height = 13
            Caption = 'Equivale a:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3223857
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 26
            Top = 25
            Width = 87
            Height = 13
            Caption = 'Tipo Movimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3355443
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 5
            Top = 71
            Width = 582
            Height = 14
            Caption = 
              '________________________________________________________________' +
              '_________________________________'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 14079702
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          inline ListaUnidMovimento: TListaCampo
            Left = 140
            Top = 23
            Width = 101
            Height = 50
            TabOrder = 1
            ExplicitLeft = 140
            ExplicitTop = 23
            ExplicitWidth = 101
            ExplicitHeight = 50
            inherited staTitulo: TLabel
              Top = 2
              Font.Color = 3223857
              ExplicitTop = 2
            end
            inherited comListaCampo: TComboBox
              Width = 90
              Height = 23
              ExplicitWidth = 90
              ExplicitHeight = 23
            end
          end
          object edtEquivale: TCurrencyEdit
            Left = 323
            Top = 43
            Width = 78
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00;-,0.00'
            TabOrder = 2
          end
          inline ListaUnidSistema: TListaCampo
            Left = 422
            Top = 23
            Width = 106
            Height = 44
            TabOrder = 3
            ExplicitLeft = 422
            ExplicitTop = 23
            ExplicitWidth = 106
            ExplicitHeight = 44
            inherited staTitulo: TLabel
              Top = 2
              Font.Color = 3355443
              ExplicitTop = 2
            end
            inherited comListaCampo: TComboBox
              Width = 89
              Height = 23
              ExplicitWidth = 89
              ExplicitHeight = 23
            end
          end
          object cbxTipoMovimento: TComboBox
            Left = 26
            Top = 42
            Width = 97
            Height = 23
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbxTipoMovimentoChange
            Items.Strings = (
              'ENTRADA'
              'SA'#205'DA')
          end
          object btnConfirma: TBitBtn
            Left = 536
            Top = 41
            Width = 45
            Height = 26
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF1AA41C1AA41CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22B72B2DCE3D25BE2F21
              B529FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF20B42731D5482DD44123CD3525BD2E22B62AFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EB42431D44A30D74A4ADE636DE48125
              CE3624BF2F21B529FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CB41E
              33D44D35DA5356E06D51E1679BF1B079E78D22CE3524BD2E1AA51EFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF92DD9230D14A39DD5D5FE57838C54011B41322BC27A6
              F5B86CE38121CF3421B5291FAE26FFFFFFFFFFFFFFFFFFFFFFFF30C74141E169
              73E89145CA4E0D9D0BFFFFFF11A3102DC032AFF7C05BDF6F22CF3625BE30169A
              18FFFFFFFFFFFFFFFFFF2BC13580EB9E5BD36B0C9F0AFFFFFFFFFFFFFFFFFF0E
              A70D45C94EB3F8C546DA5C24D03820AD25159814FFFFFFFFFFFFFFFFFF79CA78
              79CA78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CA10B53CE60B3F7C741DA5626D0
              391CA921159A14FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF0DA70C74DC82BFF9D144DC5A24CB3619A41C92DD92FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17B71F68DB79B8F8
              CB4ADF5F22C63318A11BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF1ABA2254D4649DEEAD4FE1671FB52BFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16B8
              1E50D55F7EE6901CB627FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BCF4C92DD92FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 4
            OnClick = btnConfirmaClick
          end
          object gridUnidades: TDBGridCBN
            Left = 26
            Top = 104
            Width = 423
            Height = 120
            Color = 14803425
            DataSource = dsUnidades
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridUnidadesDrawColumnCell
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
                FieldName = 'UND_MOV'
                Title.Caption = 'Unid. Movimento'
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Quantidade'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UND_SIS'
                Title.Caption = 'Unid. Sistema'
                Width = 116
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 73
                Visible = True
              end>
          end
          object edtCodigoUnidade: TCurrencyEdit
            Left = 243
            Top = 19
            Width = 38
            Height = 21
            AutoSize = False
            DisplayFormat = '0'
            TabOrder = 6
            Visible = False
          end
          object btnDeletar: TBitBtn
            Left = 536
            Top = 103
            Width = 45
            Height = 26
            Hint = 'Excluir registro selecionado'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFB6B5DF6563C71C19B5130EBB130EBB1C19B56563C7B6B5DFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6FC4845B90F0BD5130FF41611FF16
              11FF1611FF1611FF130FF40F0BD54845B9F7F6FCFFFFFFFFFFFFFFFFFFF8F8FD
              221FB91512F21816FE1615F41614EF1514EF1514EF1614EF1615F41816FE1512
              F2221FB9F8F8FDFFFFFFFFFFFF4D49C81719F21A1DF9181BF0181BF1181BF118
              1BF1181BF1181BF1181BF1181BF01A1DF91719F24D49C8FFFFFFBAB8EB1417DF
              1C26FB1A22F01B22F11B22F11B22F11B22F11B22F11B22F11B22F11B22F11A22
              F01C26FB1417DFBAB8EC6865DD1E2AF51827F50512F00412F00412F00412F004
              12F00412F00412F00412F00412F00512F01827F51E2AF56B67DD3331DC1328FB
              2125D07573D97171DA6F6FDA6F6FDA6F6FDA6F6FDA6F6FDA6F6FDA7171DA7573
              D92225D01930FC2826D75858E71937F73E3FE1FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4848E10F2FF9191AD95452EC5473F9
              5C5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF4041EC092AF82021D65D58ED5A77F96E71F7D8D6FDD4D6FBC4C3FBB3B4FAB3
              B5FBB4B5FBB4B5FBB4B5FBB6B7FBBEBCFC4347F74460F15D58E08C84F37084FA
              5B7DF7516EF6526EF6536EF64E6AF53E5CF43756F43755F43757F44160F4516C
              F76283FC7287EC8A83EAC9C6F95E5DF480A1FA5D7BF76480F76682F76682F769
              85F76B87F76B87F76B87F76884F75E7CF781A2FF5456D5C9C6F9FFFFFF7169F3
              7D86F887A6FA617FF76783F76B85F76A86F76985F76985F76683F6617FF689A7
              FF707ADE6E66E9FFFFFFFFFFFFFAF9FF4F42F28087F69DBCFB7F9FFB6D8BF86D
              89F86D89F86D8BFA809FFCA0BEFD7984E3473EDCFAF9FFFFFFFFFFFFFFFFFFFF
              F9F9FF6F67F56160F194A3F4A2B9F9A2BBFAA2BCFAA2B8F792A2EF5C5BDF6C65
              ECF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C4FC8680F55F5AEF5B
              58EC5A58EB5C57EB857EF1C7C4FBFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = btnDeletarClick
          end
        end
      end
    end
  end
  inherited cds: TClientDataSet
    Left = 26
    Top = 233
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCONTROLA_ESTOQUE: TStringField
      FieldName = 'CONTROLA_ESTOQUE'
      Size = 1
    end
  end
  inherited ds: TDataSource
    Left = 61
    Top = 233
  end
  object cdsUnidades: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 344
    object cdsUnidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsUnidadesUND_MOV: TStringField
      FieldName = 'UND_MOV'
      Size = 10
    end
    object cdsUnidadesUND_SIS: TStringField
      FieldName = 'UND_SIS'
      Size = 10
    end
    object cdsUnidadesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsUnidadesTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
  end
  object dsUnidades: TDataSource
    DataSet = cdsUnidades
    Left = 288
    Top = 344
  end
  object cdsUnidsDeletadas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 344
    object cdsUnidsDeletadasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
end
