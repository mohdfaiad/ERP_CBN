inherited frmBackup: TfrmBackup
  Left = 379
  Top = 270
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Backup'
  ClientHeight = 344
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pg: TPageControl
    Left = 0
    Top = 0
    Width = 589
    Height = 344
    ActivePage = pageBackup
    Align = alClient
    TabOrder = 0
    object pageBackup: TTabSheet
      Caption = 'Backup'
      object gbLog: TGroupBox
        Left = 0
        Top = 0
        Width = 581
        Height = 273
        Align = alTop
        Caption = 'Log'
        TabOrder = 0
        object memoLog: TMemo
          Left = 2
          Top = 15
          Width = 577
          Height = 256
          TabStop = False
          Align = alClient
          ReadOnly = True
          TabOrder = 0
        end
      end
      object btnIniciarBackup: TBitBtn
        Left = 253
        Top = 283
        Width = 116
        Height = 25
        Caption = '&Iniciar Backup'
        TabOrder = 1
        TabStop = False
        OnClick = btnIniciarBackupClick
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000FFFFFF00F6E3
          C100E4B05200E4AE5D00E0AC6300DDA86500D89E5A00D4984D00D0914700CC8B
          4200C5843C00C37B3500BD732E00B6661C00BC7F5000E3CBBB009B9B9B00927F
          5D00804C0000804A00007C48000079440100743A0000703400006C2D00006827
          0000612000005F170000590F000052020000581B00007F675700FFFFFF00E7B4
          5800FAE8B300FDEDC300FFFBEF00FFFFFF00FFF4DE00F8E5AC00F9E08D00F9DB
          8300F2CC6900EBBC4E00E4AB3400E6A01C00C5771300B26C38009B9B9B008350
          000096844F0099895F009B978B009B9B9B009B907A0094814800957C29009577
          1F008E6805008758000080470000823C0000611300004E080000FFFFFF00E8B5
          5D00F8E3AD00F6DBA400F8E8CD00FAEFE300F5DFBE00EFD19400EFCC7900EEC7
          7200E7B95C00E1AB4600DB9D3100DB931C00C4781300B57442009B9B9B008451
          0000947F49009277400094846900968B7F00917B5A008B6D30008B6815008A63
          0E00835500007D47000077390000772F00006014000051100000FFFFFF00E7B7
          5F00FBE9BB00F9E0AB00FBEED900FCF5F000F8E5C800F2D69A00F3D17F00F1CC
          7600EBBE5E00E5AF4500DC9E2F00DE951900C5791400B57442009B9B9B008353
          000097855700957C4700978A750098918C00948164008E7236008F6D1B008D68
          1200875A0000814B0000783A00007A3100006115000051100000FFFFFF00E7B2
          5600F4DBA700F5DEB100F5E5C800F7E9D800F2DDBA00EED29D00EDCC8A00ECCA
          8100E6BF7100E3B66000DCAA4D00DEA73900BD731D00B36D3A009B9B9B00834E
          000090774300917A4D0091816400938574008E7956008A6E3900896826008866
          1D00825B0D007F520000784600007A430000590F00004F090000FFFFFF00F7E7
          CA00E5B55700E6B96400E2B66B00E0B77600DAAA5D00D69E4B00D3984400CE90
          3F00CA873800C37C3200BD712B00BA6E2300B7784C00E8D4C8009B9B9B009383
          660081510000825500007E5207007C53120076460000723A00006F3400006A2C
          0000662300005F180000590D0000560A00005314000084706400FFFFFF00EDC8
          7F00FAE7B500F7E0AC00FBEED900FDF6F100F8E4C700F1D69C00F3D17F00F1CD
          7500EBBE5F00E3AD4600DD9D2E00DC941700C87D1200C18349009B9B9B008964
          1B0096835100937C4800978A750099928D00948063008D7238008F6D1B008D69
          1100875A00007F4900007939000078300000641900005D1F0000FFFFFF00EDC6
          7700F8E1A800F7DEAA00F9EAD200FBF1E900F6E1C200EFD39800F0CE7D00EFCA
          7600E8BB5F00E2AF4800DCA03200D9921C00C67A1400BF7C40009B9B9B008962
          1300947D4400937A460095866E00978D8500927D5E008B6F34008C6A19008B66
          1200845700007E4B0000783C0000752E0000621600005B180000FFFFFF00EDC6
          7800F8E2AB00F7DDA200F9EAD000FBF1E700F6E1BF00EFD29300F0CC7500EFC8
          6F00E8B95800E0AA4000DA9A2A00D88E1400C6770E00BF7C3E009B9B9B008962
          1400947E470093793E0095866C00978D8300927D5B008B6E2F008C6811008B64
          0B00845500007C46000076360000742A0000621300005B180000FFFFFF00EECA
          8000FAEBCB00F8E5BE00FAEDDC00FBF5EF00F9E8CF00F5DCAC00F3D79900F2D5
          8F00ECCA7C00E8BE6700E1B15000E1AC3A00CD8D2600C3874C009B9B9B008A66
          1C009687670094815A009689780097918B0095846B00917848008F7335008E71
          2B0088661800845A03007D4D00007D480000692900005F230000FFFFFF00F8E9
          CC00E7BB6500E9BF7A00E6C28500E4C28F00DEB37100D9A65B00D69F5400D29B
          4D00CD904500C8893E00C37D3500C07D2D00C1875500EAD7C9009B9B9B009485
          680083570100855B1600825E2100805E2B007A4F0D0075420000723B00006E37
          0000692C0000642500005F1900005C1900005D23000086736500FFFFFF00EABF
          6C00F7E1A400F7DEA400F8E9CF00FAF1E700F6E1BD00F1D39300F1CE7800F0C9
          6F00E9BA5A00E3AB4300DD9A2D00DA901700C2731100B8753A009B9B9B00865B
          0800937D4000937A400094856B00968D8300927D59008D6F2F008D6A14008C65
          0B00855600007F47000079360000762C00005E0F000054110000FFFFFF00EEC9
          7A00F8E3AD00F7E0AC00FBEBD500FCF3EB00F9E3C500F0D59A00F0D07F00F0CB
          7800EABD6000E4AF4900DEA03300DB951C00C87D1400C18041009B9B9B008A65
          1600947F4900937C480097877100988F8700957F61008C7136008C6C1B008C67
          140086590000804B00007A3C000077310000641900005D1C0000FFFFFF00EDC7
          7800F8DFA600F7DCA100F8E7CC00FAEFE200F7DFBC00EFD18F00EDCB7400EDC6
          6D00E6B75600E0A83F00DA982900D78C1400C5760E00BF7D40009B9B9B008963
          1400947B420093783D0094836800968B7E00937B58008B6D2B00896710008962
          0900825300007C4400007634000073280000611200005B190000FFFFFF00ECC5
          7500FCF1CF00FCEBC600FFF8EE00FFFFFF00FEF1DF00F7E5B700F7E09C00F6DC
          9400F1D07D00EBC46400E6B34C00E6AC3400CF8B2100BE7939009B9B9B008861
          1100988D6B00988762009B948A009B9B9B009A8D7B0093815300937C38009278
          30008D6C190087600000824F0000824800006B2700005A150000FFFFFF00F7E6
          C500EBC37600EAC68500E8C38700E6C38B00E3B97E00E0B47400DCAE6C00D8A9
          6900D5A26200D29C5C00CD955200C8904000C7925E00E6CEBC009B9B9B009382
          6100875F120086622100845F2300825F27007F551A007C501000784A08007445
          0500713E00006E38000069310000642C0000632E0000826A5800}
        NumGlyphs = 2
      end
    end
    object pageConfiguracao: TTabSheet
      Hint = 'Clique com o lado direito no grid para ver as op'#231#245'es'
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object gbDiretoriosBackup: TGroupBox
        Left = 0
        Top = 33
        Width = 579
        Height = 217
        Hint = 'Clique com o lado direito no grid para ver as op'#231#245'es'
        Caption = 'Diret'#243'rios de Backup de '
        TabOrder = 0
        object gridDiretoriosBackup: TDBGridCBN
          Left = 2
          Top = 15
          Width = 575
          Height = 200
          Hint = 'Clique com o lado direito no grid para ver as op'#231#245'es'
          TabStop = False
          Align = alClient
          Color = 14803425
          DataSource = dsDiretoriosBackup
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = pmOpcoesGrid
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnKeyDown = gridDiretoriosBackupKeyDown
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
          SalvaConfiguracoes = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CAMINHO'
              Width = 400
              Visible = True
            end>
        end
      end
      object pnlLegenda: TPanel
        Left = 0
        Top = 256
        Width = 581
        Height = 60
        Align = alBottom
        Caption = 'Clique com o lado direito no grid para ver as op'#231#245'es'
        TabOrder = 1
      end
    end
  end
  object cdsDiretoriosBackup: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CAMINHO'
    Params = <>
    Left = 204
    Top = 128
    object cdsDiretoriosBackupCAMINHO: TStringField
      DisplayLabel = 'Caminho'
      FieldName = 'CAMINHO'
      Size = 1000
    end
    object cdsDiretoriosBackupCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object dsDiretoriosBackup: TDataSource
    DataSet = cdsDiretoriosBackup
    Left = 308
    Top = 128
  end
  object pmOpcoesGrid: TPopupMenu
    Left = 404
    Top = 129
    object mnuAdicionar: TMenuItem
      Caption = 'Adicionar'
      OnClick = mnuAdicionarClick
    end
    object mnuRemover: TMenuItem
      Caption = 'Remover'
      OnClick = mnuRemoverClick
    end
  end
end
