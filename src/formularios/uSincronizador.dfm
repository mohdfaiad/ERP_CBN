inherited frmSincronizador: TfrmSincronizador
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Sincronizador'
  ClientHeight = 629
  ClientWidth = 1193
  ExplicitWidth = 1209
  ExplicitHeight = 667
  PixelsPerInch = 96
  TextHeight = 15
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1193
    Height = 629
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 0
    OnChange = pgcPrincipalChange
    object Produtos: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 0
        Width = 1185
        Height = 9
        Cursor = crArrow
        Align = alTop
        ResizeStyle = rsNone
        ExplicitWidth = 1160
      end
      object pgcProdutos: TPageControl
        Left = 0
        Top = 9
        Width = 1185
        Height = 590
        ActivePage = tsListaProd
        Align = alClient
        TabOrder = 0
        object tsListaProd: TTabSheet
          Caption = 'Lista de produtos'
          object Shape1: TShape
            Left = 652
            Top = 452
            Width = 510
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label1: TLabel
            Left = 734
            Top = 462
            Width = 122
            Height = 15
            Caption = 'Registros selecionados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 950
            Top = 462
            Width = 152
            Height = 15
            Caption = 'Duplo clique para selecionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 897
            Top = 454
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object gridProdutos: TDBGridCBN
            Left = 3
            Top = 3
            Width = 630
            Height = 450
            Color = 14803425
            DataSource = dsProdutos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosDrawColumnCell
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
                FieldName = 'REFERENCIA'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO_COMPLETA'
                Title.Caption = 'PRODUTO'
                Width = 505
                Visible = True
              end>
          end
          object gridCores: TDBGridCBN
            Left = 652
            Top = 3
            Width = 510
            Height = 450
            Color = 14803425
            DataSource = dsCores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridCoresDrawColumnCell
            OnDblClick = gridCoresDblClick
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
                FieldName = 'REFERENCIA'
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COR'
                Width = 392
                Visible = True
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object Shape5: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 15649954
              Pen.Color = 12028956
              Shape = stEllipse
            end
            object Label9: TLabel
              Left = 43
              Top = 13
              Width = 165
              Height = 19
              Caption = 'Produtos j'#225' sincronizados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object btnSepararProdutos: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = '[ F3 ] Separar Selecionado'
              TabOrder = 0
              OnClick = btnSepararProdutosClick
            end
          end
          object edtCoresSelecionadas: TCurrencyEdit
            Left = 692
            Top = 462
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object tsProdSeparados: TTabSheet
          Caption = 'Produtos separados para envio'
          ImageIndex = 1
          object Shape2: TShape
            Left = 3
            Top = 452
            Width = 630
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label4: TLabel
            Left = 85
            Top = 459
            Width = 135
            Height = 19
            Caption = 'Registros separados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 262
            Top = 451
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 306
            Top = 459
            Width = 290
            Height = 19
            Caption = 'Pressione [Delete] para remover o registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Shape3: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 210
              Pen.Color = 157
              Shape = stEllipse
            end
            object Label7: TLabel
              Left = 43
              Top = 13
              Width = 181
              Height = 19
              Caption = 'Registros com erro no envio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 267
              Top = 13
              Width = 210
              Height = 19
              Caption = 'Registros enviados com sucesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Shape4: TShape
              Left = 240
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 7375126
              Pen.Color = 4872975
              Shape = stEllipse
            end
            object btnEnviarProdutos: TBitBtn
              Left = 988
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Enviar produtos'
              TabOrder = 0
              OnClick = btnEnviarProdutosClick
            end
            object btnLimpaListaProdutos: TBitBtn
              Left = 812
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Limpar lista de separados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnLimpaListaTabelasClick
            end
          end
          object DBGrid2: TDBGrid
            Left = 652
            Top = 3
            Width = 510
            Height = 450
            DataSource = dsCor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid1DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'COR'
                Width = 472
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_PRODUTO'
                Visible = False
              end>
          end
          object gridProdutosSeparados: TDBGrid
            Left = 3
            Top = 3
            Width = 630
            Height = 450
            DataSource = dsPro
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosSeparadosDrawColumnCell
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'REFERENCIA'
                Width = 139
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'PRODUTO'
                Width = 453
                Visible = True
              end>
          end
          object edtProdutosSeparados: TCurrencyEdit
            Left = 38
            Top = 459
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'LOG ERROS'
          ImageIndex = 2
          object memLogProdutos: TMemo
            Left = 6
            Top = 6
            Width = 1137
            Height = 540
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tabelas de Pre'#231'o'
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 0
        Width = 1185
        Height = 9
        Cursor = crArrow
        Align = alTop
        ResizeStyle = rsNone
        ExplicitWidth = 1226
      end
      object pgcTabelas: TPageControl
        Left = 0
        Top = 9
        Width = 1185
        Height = 590
        ActivePage = tsListaTabelas
        Align = alClient
        TabOrder = 0
        object tsListaTabelas: TTabSheet
          Caption = 'Lista de Tabelas'
          object DBGridCBN1: TDBGridCBN
            Left = 3
            Top = 3
            Width = 540
            Height = 450
            Color = 14803425
            DataSource = dsTabelas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosDrawColumnCell
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
                FieldName = 'DESCRICAO'
                Title.Caption = 'TABELAS DE PRE'#199'O'
                Width = 504
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Shape7: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 15649954
              Pen.Color = 12028956
              Shape = stEllipse
            end
            object Label15: TLabel
              Left = 43
              Top = 13
              Width = 169
              Height = 19
              Caption = 'Registros j'#225' sincronizados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object btnSepararTabelas: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = '[ F3 ] Separar Selecionado'
              TabOrder = 0
              OnClick = btnSepararTabelasClick
            end
          end
        end
        object TTabSheet
          Caption = 'Tabelas separadas para envio'
          ImageIndex = 1
          object Shape8: TShape
            Left = 3
            Top = 452
            Width = 540
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label16: TLabel
            Left = 51
            Top = 459
            Width = 135
            Height = 19
            Caption = 'Registros separados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 206
            Top = 451
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 234
            Top = 459
            Width = 290
            Height = 19
            Caption = 'Pressione [Delete] para remover o registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel4: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Shape9: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 210
              Pen.Color = 157
              Shape = stEllipse
            end
            object Label19: TLabel
              Left = 43
              Top = 13
              Width = 181
              Height = 19
              Caption = 'Registros com erro no envio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 267
              Top = 13
              Width = 210
              Height = 19
              Caption = 'Registros enviados com sucesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Shape10: TShape
              Left = 240
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 7375126
              Pen.Color = 4872975
              Shape = stEllipse
            end
            object btnEnviarTabelas: TBitBtn
              Left = 993
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Enviar tabelas'
              TabOrder = 0
              OnClick = btnEnviarTabelasClick
            end
            object btnLimpaListaTabelas: TBitBtn
              Left = 813
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Limpar lista de separados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnLimpaListaTabelasClick
            end
          end
          object DBGrid3: TDBGrid
            Left = 3
            Top = 3
            Width = 540
            Height = 450
            DataSource = dsTab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosSeparadosDrawColumnCell
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'TABELA DE PRE'#199'O'
                Width = 506
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_EXTERNO'
                Visible = False
              end>
          end
          object edtTabelasSeparadas: TCurrencyEdit
            Left = 4
            Top = 459
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'LOG ERROS'
          ImageIndex = 2
          object memLogTabelas: TMemo
            Left = 6
            Top = 6
            Width = 1137
            Height = 540
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Tabela Pre'#231'o/Produto'
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 0
        Top = 0
        Width = 1185
        Height = 9
        Cursor = crArrow
        Align = alTop
        ResizeStyle = rsNone
      end
      object pgcTabelasProduto: TPageControl
        Left = 0
        Top = 9
        Width = 1185
        Height = 590
        ActivePage = tsListaTabProduto
        Align = alClient
        TabOrder = 0
        object tsListaTabProduto: TTabSheet
          Caption = 'Lista de tabelas por produto'
          object Shape6: TShape
            Left = 652
            Top = 452
            Width = 510
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label10: TLabel
            Left = 734
            Top = 462
            Width = 122
            Height = 15
            Caption = 'Registros selecionados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 950
            Top = 462
            Width = 152
            Height = 15
            Caption = 'Duplo clique para selecionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 897
            Top = 454
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBGridCBN2: TDBGridCBN
            Left = 3
            Top = 3
            Width = 630
            Height = 450
            Color = 14803425
            DataSource = dsProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
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
                FieldName = 'REFERENCIA'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'PRODUTO'
                Width = 505
                Visible = True
              end>
          end
          object DBGridCBN3: TDBGridCBN
            Left = 654
            Top = 3
            Width = 510
            Height = 450
            Color = 14803425
            DataSource = dsProdTab
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridCoresDrawColumnCell
            OnDblClick = DBGridCBN3DblClick
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
                FieldName = 'DESCRICAO'
                Title.Caption = 'TABELA'
                Width = 324
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECO'
                Title.Caption = 'PRE'#199'O'
                Width = 146
                Visible = True
              end>
          end
          object Panel5: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object Shape11: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 15649954
              Pen.Color = 12028956
              Shape = stEllipse
            end
            object Label13: TLabel
              Left = 43
              Top = 13
              Width = 169
              Height = 19
              Caption = 'Registros j'#225' sincronizados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object btnSepararTabelaProd: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = '[ F3 ] Separar Selecionado'
              TabOrder = 0
              OnClick = btnSepararTabelaProdClick
            end
          end
          object edtTabelasSelecionadas: TCurrencyEdit
            Left = 692
            Top = 462
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object TTabSheet
          Caption = 'Tabelas separados para envio'
          ImageIndex = 1
          object Shape12: TShape
            Left = 3
            Top = 452
            Width = 1086
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label14: TLabel
            Left = 85
            Top = 459
            Width = 135
            Height = 19
            Caption = 'Registros separados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 262
            Top = 451
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 306
            Top = 459
            Width = 290
            Height = 19
            Caption = 'Pressione [Delete] para remover o registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel6: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Shape13: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 210
              Pen.Color = 157
              Shape = stEllipse
            end
            object Label23: TLabel
              Left = 43
              Top = 13
              Width = 181
              Height = 19
              Caption = 'Registros com erro no envio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 267
              Top = 13
              Width = 210
              Height = 19
              Caption = 'Registros enviados com sucesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Shape14: TShape
              Left = 240
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 7375126
              Pen.Color = 4872975
              Shape = stEllipse
            end
            object btnEnviarTabelasProduto: TBitBtn
              Left = 988
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Enviar Tabelas do Produto'
              TabOrder = 0
              OnClick = btnEnviarTabelasProdutoClick
            end
            object btnLimpaListaTabelasProduto: TBitBtn
              Left = 812
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Limpar lista de separados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnLimpaListaTabelasClick
            end
          end
          object DBGrid4: TDBGrid
            Left = 3
            Top = 3
            Width = 1086
            Height = 450
            DataSource = dsProdTab2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosSeparadosDrawColumnCell
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'PRODUTO'
                Width = 471
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'TABELA'
                Width = 452
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECO'
                Width = 119
                Visible = True
              end>
          end
          object edtTabProdutoSeparadas: TCurrencyEdit
            Left = 38
            Top = 459
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'LOG ERROS'
          ImageIndex = 2
          object memLogTabelaProduto: TMemo
            Left = 6
            Top = 6
            Width = 1137
            Height = 540
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 3
      object Splitter4: TSplitter
        Left = 0
        Top = 0
        Width = 1185
        Height = 9
        Cursor = crArrow
        Align = alTop
        ResizeStyle = rsNone
      end
      object pgcClientes: TPageControl
        Left = 0
        Top = 9
        Width = 1185
        Height = 590
        ActivePage = TabSheet4
        Align = alClient
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Lista de clientes'
          object DBGridCBN4: TDBGridCBN
            Left = 3
            Top = 3
            Width = 1085
            Height = 450
            Color = 14803425
            DataSource = dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosDrawColumnCell
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
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAZAO'
                Title.Caption = 'CLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CPF_CNPJ'
                Title.Caption = 'CPF/CNPJ'
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RG_IE'
                Title.Caption = 'RG/IE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SIGLA'
                Title.Caption = 'UF'
                Width = 32
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Shape16: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 15649954
              Pen.Color = 12028956
              Shape = stEllipse
            end
            object Label28: TLabel
              Left = 43
              Top = 13
              Width = 169
              Height = 19
              Caption = 'Registros j'#225' sincronizados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object btnSepararClientes: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = '[ F3 ] Separar Selecionado'
              TabOrder = 0
              OnClick = btnSepararClientesClick
            end
          end
        end
        object TTabSheet
          Caption = 'Clientes separados para envio'
          ImageIndex = 1
          object Shape17: TShape
            Left = 3
            Top = 452
            Width = 1085
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label29: TLabel
            Left = 85
            Top = 459
            Width = 135
            Height = 19
            Caption = 'Registros separados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 262
            Top = 451
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 306
            Top = 459
            Width = 290
            Height = 19
            Caption = 'Pressione [Delete] para remover o registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel8: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Shape18: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 210
              Pen.Color = 157
              Shape = stEllipse
            end
            object Label32: TLabel
              Left = 43
              Top = 13
              Width = 181
              Height = 19
              Caption = 'Registros com erro no envio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 267
              Top = 13
              Width = 210
              Height = 19
              Caption = 'Registros enviados com sucesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Shape19: TShape
              Left = 240
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 7375126
              Pen.Color = 4872975
              Shape = stEllipse
            end
            object btnEnviarClientes: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Enviar Clientes'
              TabOrder = 0
              OnClick = btnEnviarClientesClick
            end
            object btnLimpaListaClientes: TBitBtn
              Left = 812
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Limpar lista de separados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnLimpaListaTabelasClick
            end
          end
          object DBGrid1: TDBGrid
            Left = 3
            Top = 3
            Width = 1085
            Height = 450
            DataSource = dsCli
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosSeparadosDrawColumnCell
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAZAO'
                Title.Caption = 'CLIENTE'
                Width = 364
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CPF_CNPJ'
                Title.Caption = 'CPF/CNPJ'
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RG_IE'
                Title.Caption = 'RG/IE'
                Width = 94
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESTADO'
                Title.Caption = 'UF'
                Width = 31
                Visible = True
              end>
          end
          object edtClientesSeparados: TCurrencyEdit
            Left = 38
            Top = 459
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'LOG ERROS'
          ImageIndex = 2
          object memLogClientes: TMemo
            Left = 6
            Top = 6
            Width = 1137
            Height = 540
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Transportadoras'
      ImageIndex = 4
      object Splitter5: TSplitter
        Left = 0
        Top = 0
        Width = 1185
        Height = 9
        Cursor = crArrow
        Align = alTop
        ResizeStyle = rsNone
      end
      object pgcTransportadoras: TPageControl
        Left = 0
        Top = 9
        Width = 1185
        Height = 590
        ActivePage = TabSheet10
        Align = alClient
        TabOrder = 0
        object TabSheet10: TTabSheet
          Caption = 'Lista de Transportadoras'
          object gridTransportadoras: TDBGridCBN
            Left = 3
            Top = 3
            Width = 1085
            Height = 450
            Color = 14803425
            DataSource = dsTransportadoras
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosDrawColumnCell
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
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAZAO'
                Title.Caption = 'TRANSPORTADORA'
                Width = 476
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Width = 362
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SIGLA'
                Title.Caption = 'UF'
                Width = 32
                Visible = True
              end>
          end
          object Panel9: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Shape15: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 15649954
              Pen.Color = 12028956
              Shape = stEllipse
            end
            object Label25: TLabel
              Left = 43
              Top = 13
              Width = 169
              Height = 19
              Caption = 'Registros j'#225' sincronizados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object btnSepararTransportadoras: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = '[ F3 ] Separar Selecionado'
              TabOrder = 0
              OnClick = btnSepararTransportadorasClick
            end
          end
        end
        object TTabSheet
          Caption = 'Transportadoras separadas para envio'
          ImageIndex = 1
          object Shape20: TShape
            Left = 3
            Top = 452
            Width = 1085
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label26: TLabel
            Left = 85
            Top = 459
            Width = 135
            Height = 19
            Caption = 'Registros separados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 262
            Top = 451
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 306
            Top = 459
            Width = 290
            Height = 19
            Caption = 'Pressione [Delete] para remover o registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel10: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Shape21: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 210
              Pen.Color = 157
              Shape = stEllipse
            end
            object Label35: TLabel
              Left = 43
              Top = 13
              Width = 181
              Height = 19
              Caption = 'Registros com erro no envio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 267
              Top = 13
              Width = 210
              Height = 19
              Caption = 'Registros enviados com sucesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Shape22: TShape
              Left = 240
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 7375126
              Pen.Color = 4872975
              Shape = stEllipse
            end
            object btnEnviarTransportadoras: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Enviar Transportadoras'
              TabOrder = 0
              OnClick = btnEnviarTransportadorasClick
            end
            object btnLimpaListaTransportadoras: TBitBtn
              Left = 812
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Limpar lista de separados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnLimpaListaTabelasClick
            end
          end
          object DBGrid5: TDBGrid
            Left = 3
            Top = 3
            Width = 1085
            Height = 450
            DataSource = dsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosSeparadosDrawColumnCell
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAZAO'
                Title.Caption = 'TRANSPORTADORA'
                Width = 475
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Width = 364
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESTADO'
                Title.Caption = 'UF'
                Width = 31
                Visible = True
              end>
          end
          object edtTransportadorasSeparadas: TCurrencyEdit
            Left = 38
            Top = 459
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'LOG ERROS'
          ImageIndex = 2
          object memLogTransportadoras: TMemo
            Left = 6
            Top = 6
            Width = 1137
            Height = 540
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Formas de Pagamento'
      ImageIndex = 5
      object Splitter6: TSplitter
        Left = 0
        Top = 0
        Width = 1185
        Height = 9
        Cursor = crArrow
        Align = alTop
        ResizeStyle = rsNone
      end
      object pgcFormasPagamento: TPageControl
        Left = 0
        Top = 9
        Width = 1185
        Height = 590
        ActivePage = TabSheet13
        Align = alClient
        TabOrder = 0
        object TabSheet13: TTabSheet
          Caption = 'Lista de Formas de Pagamento'
          object DBGridCBN5: TDBGridCBN
            Left = 3
            Top = 3
            Width = 702
            Height = 450
            Color = 14803425
            DataSource = dsFormasPgto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosDrawColumnCell
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
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'FORMA DE PAGAMENTO'
                Visible = True
              end>
          end
          object Panel11: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Shape23: TShape
              Left = 16
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 15649954
              Pen.Color = 12028956
              Shape = stEllipse
            end
            object Label37: TLabel
              Left = 43
              Top = 13
              Width = 169
              Height = 19
              Caption = 'Registros j'#225' sincronizados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object btnSepararFormaPgto: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = '[ F3 ] Separar Selecionado'
              TabOrder = 0
              OnClick = btnSepararFormaPgtoClick
            end
          end
        end
        object TTabSheet
          Caption = 'Formas de Pagamento separadas para envio'
          ImageIndex = 1
          object Shape24: TShape
            Left = 3
            Top = 452
            Width = 702
            Height = 35
            Brush.Color = 16579573
            Pen.Style = psDot
          end
          object Label38: TLabel
            Left = 85
            Top = 459
            Width = 135
            Height = 19
            Caption = 'Registros separados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 262
            Top = 451
            Width = 8
            Height = 19
            Caption = '_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label40: TLabel
            Left = 306
            Top = 459
            Width = 290
            Height = 19
            Caption = 'Pressione [Delete] para remover o registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5673237
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel12: TPanel
            Left = 0
            Top = 510
            Width = 1177
            Height = 50
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Shape25: TShape
              Left = 22
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 210
              Pen.Color = 157
              Shape = stEllipse
            end
            object Label41: TLabel
              Left = 43
              Top = 13
              Width = 181
              Height = 19
              Caption = 'Registros com erro no envio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Label42: TLabel
              Left = 267
              Top = 13
              Width = 210
              Height = 19
              Caption = 'Registros enviados com sucesso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 5987163
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
            end
            object Shape26: TShape
              Left = 240
              Top = 16
              Width = 15
              Height = 15
              Brush.Color = 7375126
              Pen.Color = 4872975
              Shape = stEllipse
            end
            object btnEnviarFormasPgto: TBitBtn
              Left = 992
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Enviar Formas de Pagamento'
              TabOrder = 0
              OnClick = btnEnviarFormasPgtoClick
            end
            object btnLimpaListaFormasPgto: TBitBtn
              Left = 812
              Top = 8
              Width = 170
              Height = 30
              Caption = 'Limpar lista de separados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnLimpaListaTabelasClick
            end
          end
          object DBGrid6: TDBGrid
            Left = 3
            Top = 3
            Width = 702
            Height = 450
            DataSource = dsFPgto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Calibri'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Calibri'
            TitleFont.Style = []
            OnDrawColumnCell = gridProdutosSeparadosDrawColumnCell
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'FORMA DE PAGAMENTO'
                Visible = True
              end>
          end
          object edtFormasPagamentoSeparadas: TCurrencyEdit
            Left = 38
            Top = 459
            Width = 40
            Height = 24
            BorderStyle = bsNone
            Color = 16579573
            DisplayFormat = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 13335598
            Font.Height = -16
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet14: TTabSheet
          Caption = 'LOG ERROS'
          ImageIndex = 2
          object memLogFormasPagamento: TMemo
            Left = 6
            Top = 6
            Width = 1137
            Height = 540
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object qryCores: TFDQuery
    SQL.Strings = (
      'select pc.codigo, c.referencia, c.descricao cor     '
      ' from cores c                                       '
      ' left join produto_cores pc on c.codigo = pc.codcor '
      
        ' where pc.codproduto = :codpro  and (CHAR_LENGTH(c.descricao_com' +
        'pleta) > 0)')
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'CODPRO'
        ParamType = ptInput
      end>
    object qryCoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryCoresREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 25
    end
    object qryCoresCOR: TStringField
      FieldName = 'COR'
      Size = 100
    end
    object qryCoresSELECIONADO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SELECIONADO'
      Size = 1
    end
  end
  object qryProdutos: TFDQuery
    AfterScroll = qryProdutosAfterScroll
    SQL.Strings = (
      'SELECT PRO.*, RTI.id_externo from produtos pro'
      
        'left join relacao_tab_importacao rti on ((rti.id_erp = pro.codig' +
        'o)and(rti.tabela_erp = '#39'PRODUTOS'#39'))'
      ''
      
        'where (ativo = '#39'S'#39') and not((select first 1 cb.codigo from codig' +
        'o_barras cb where cb.codproduto = pro.codigo) is null)')
    Left = 16
    Top = 104
    object qryProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryProdutosCOD_NCM: TIntegerField
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
    end
    object qryProdutosCOD_TIPO: TIntegerField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
    end
    object qryProdutosCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Origin = 'COD_GRUPO'
    end
    object qryProdutosCOD_COLECAO: TIntegerField
      FieldName = 'COD_COLECAO'
      Origin = 'COD_COLECAO'
    end
    object qryProdutosCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Origin = 'COD_GRADE'
    end
    object qryProdutosLINHA_ANO: TStringField
      FieldName = 'LINHA_ANO'
      Origin = 'LINHA_ANO'
      Size = 4
    end
    object qryProdutosATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryProdutosPRECO_CUSTO: TBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_ATACADO: TBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_MEDIO: TBCDField
      FieldName = 'PRECO_MEDIO'
      Origin = 'PRECO_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryProdutosESTOQUE_FIS: TBCDField
      FieldName = 'ESTOQUE_FIS'
      Origin = 'ESTOQUE_FIS'
      Precision = 18
      Size = 2
    end
    object qryProdutosESTOQUE_MIN: TBCDField
      FieldName = 'ESTOQUE_MIN'
      Origin = 'ESTOQUE_MIN'
      Precision = 18
      Size = 2
    end
    object qryProdutosPESO_LIQ: TBCDField
      FieldName = 'PESO_LIQ'
      Origin = 'PESO_LIQ'
      Precision = 18
      Size = 2
    end
    object qryProdutosPESO_BRU: TBCDField
      FieldName = 'PESO_BRU'
      Origin = 'PESO_BRU'
      Precision = 18
      Size = 2
    end
    object qryProdutosQTD_PECAS: TIntegerField
      FieldName = 'QTD_PECAS'
      Origin = 'QTD_PECAS'
    end
    object qryProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 35
    end
    object qryProdutosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryProdutosUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
      FixedChar = True
      Size = 2
    end
    object qryProdutosKIT: TStringField
      FieldName = 'KIT'
      Origin = 'KIT'
      FixedChar = True
      Size = 1
    end
    object qryProdutosCODIGO_IBPT: TIntegerField
      FieldName = 'CODIGO_IBPT'
      Origin = 'CODIGO_IBPT'
    end
    object qryProdutosDESC_TIPO_COR: TStringField
      FieldName = 'DESC_TIPO_COR'
      Origin = 'DESC_TIPO_COR'
      Size = 30
    end
    object qryProdutosDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Origin = 'DESCRICAO_COMPLETA'
      Size = 250
    end
    object qryProdutosID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 12
    end
  end
  object dsCores: TDataSource
    DataSet = qryCores
    Left = 72
    Top = 152
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 16
    Top = 152
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsProdutosAfterScroll
    Left = 16
    Top = 200
    object cdsProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object cdsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object cdsProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 15
    end
    object cdsProdutosCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object cdsProdutosCOD_NCM: TStringField
      FieldName = 'COD_NCM'
    end
    object cdsProdutosID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
    object cdsProdutosENVIOU: TStringField
      FieldName = 'ENVIOU'
      Size = 1
    end
  end
  object cdsCores: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 200
    object cdsCoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsCoresCOR: TStringField
      FieldName = 'COR'
      Size = 150
    end
    object cdsCoresCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
  end
  object dsPro: TDataSource
    DataSet = cdsProdutos
    Left = 16
    Top = 248
  end
  object dsCor: TDataSource
    DataSet = cdsCores
    Left = 72
    Top = 248
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 480
    Top = 320
  end
  object cdsTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 200
    object cdsTabelasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsTabelasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsTabelasID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
    object cdsTabelasENVIOU: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'ENVIOU'
      Size = 1
    end
  end
  object dsTab: TDataSource
    DataSet = cdsTabelas
    OnDataChange = dsTabDataChange
    Left = 145
    Top = 248
  end
  object qryTabelas: TFDQuery
    SQL.Strings = (
      
        'select tp.codigo, tp.descricao, rti.id_externo from tabelas_prec' +
        'o tp'
      
        '  left join produto_tabela_preco ptp on ptp.codtabela = tp.codig' +
        'o'
      
        '  left join relacao_tab_importacao rti on ((rti.id_erp =tp.codig' +
        'o)and(rti.tabela_erp = '#39'TABELAS_PRECO'#39'))'
      
        'where PTP.codproduto IN ( select r.id_erp from relacao_tab_impor' +
        'tacao r'
      '                          where r.tabela_erp = '#39'PRODUTOS'#39' )'
      '  AND TP.ativa = '#39'S'#39
      'GROUP BY TP.codigo, TP.descricao, rti.id_externo')
    Left = 144
    Top = 104
    object qryTabelasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTabelasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryTabelasID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 144
    Top = 152
  end
  object qryProd: TFDQuery
    AfterScroll = qryProdAfterScroll
    SQL.Strings = (
      
        'select pro.codigo, pro.referencia, pro.descricao from produtos p' +
        'ro'
      
        '  left join relacao_tab_importacao rti on ((rti.id_erp = pro.cod' +
        'igo)and(rti.tabela_erp = '#39'PRODUTOS'#39'))'
      'where not(rti.codigo is null)')
    Left = 232
    Top = 104
    object qryProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 35
    end
    object qryProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
  end
  object dsProd: TDataSource
    DataSet = qryProd
    Left = 232
    Top = 152
  end
  object qryProdTab: TFDQuery
    SQL.Strings = (
      
        'select tp.descricao, ptp.codigo, ptp.codproduto, ptp.codtabela, ' +
        'ptp.preco, rti2.id_externo,'
      
        '       rti.id_externo as id_externo_tabela, rti3.id_externo as i' +
        'd_externo_produto'
      '  from produto_tabela_preco ptp'
      
        '    inner join tabelas_preco         tp   on (tp.codigo = ptp.co' +
        'dtabela)'
      
        '    left join relacao_tab_importacao rti  on ((rti.id_erp = ptp.' +
        'codtabela)and(rti.tabela_erp = '#39'TABELAS_PRECO'#39'))'
      
        '    left join relacao_tab_importacao rti3 on ((rti3.id_erp = ptp' +
        '.codproduto)and(rti3.tabela_erp = '#39'PRODUTOS'#39'))'
      
        '    left join relacao_tab_importacao rti2 on ((rti2.id_erp = ptp' +
        '.codigo)and(rti2.tabela_erp = '#39'PRODUTO_TABELA_PRECO'#39'))'
      'WHERE not (rti.codigo is null) and (ptp.codproduto = :codpro)')
    Left = 288
    Top = 104
    ParamData = <
      item
        Name = 'CODPRO'
        ParamType = ptInput
      end>
    object qryProdTabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryProdTabCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdTabCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
    end
    object qryProdTabCODTABELA: TIntegerField
      FieldName = 'CODTABELA'
      Origin = 'CODTABELA'
    end
    object qryProdTabPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryProdTabID_EXTERNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_EXTERNO'
      Origin = 'ID_EXTERNO'
      ProviderFlags = []
      Size = 12
    end
    object qryProdTabSELECIONADO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object qryProdTabID_EXTERNO_TABELA: TStringField
      FieldName = 'ID_EXTERNO_TABELA'
      Size = 15
    end
    object qryProdTabID_EXTERNO_PRODUTO: TStringField
      FieldName = 'ID_EXTERNO_PRODUTO'
      Size = 15
    end
  end
  object dsProdTab: TDataSource
    DataSet = qryProdTab
    Left = 288
    Top = 152
  end
  object cdsProdTab: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 200
    object cdsProdTabCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsProdTabCODIGO_TABELA: TIntegerField
      FieldName = 'CODIGO_TABELA'
    end
    object cdsProdTabCODIGO_PRODUTO: TIntegerField
      FieldName = 'CODIGO_PRODUTO'
    end
    object cdsProdTabPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 150
    end
    object cdsProdTabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsProdTabPRECO: TFloatField
      FieldName = 'PRECO'
    end
    object cdsProdTabID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
    object cdsProdTabENVIOU: TStringField
      FieldName = 'ENVIOU'
      Size = 1
    end
    object cdsProdTabID_EXTERNO_TABELA: TStringField
      FieldName = 'ID_EXTERNO_TABELA'
      Size = 15
    end
    object cdsProdTabID_EXTERNO_PRODUTO: TStringField
      FieldName = 'ID_EXTERNO_PRODUTO'
      Size = 15
    end
  end
  object dsProdTab2: TDataSource
    DataSet = cdsProdTab
    OnDataChange = dsProdTab2DataChange
    Left = 288
    Top = 248
  end
  object qryClientes: TFDQuery
    SQL.Strings = (
      
        'select p.codigo, p.razao, p.cpf_cnpj, p.rg_ie, e.logradouro||'#39','#39 +
        '||e.numero logradouro, e.complemento, e.cep, e.bairro,'
      
        '       c.nome cidade, est.sigla, p.observacao, p.email, p.fone1,' +
        ' p.fone2, rti.id_externo'
      '    from pessoas p'
      
        '    inner join enderecos             e    on (e.codpessoa = p.co' +
        'digo)'
      
        '    inner join cidades               c    on (c.codibge = e.codc' +
        'idade)'
      
        '    inner join estados               est  on (est.codigo = c.cod' +
        'est)'
      
        '    left join relacao_tab_importacao rti  on ((rti.id_erp = p.co' +
        'digo)and(rti.tabela_erp = '#39'PESSOAS'#39'))'
      'WHERE P.tipo = '#39'C'#39)
    Left = 352
    Top = 104
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 60
    end
    object qryClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 14
    end
    object qryClientesRG_IE: TStringField
      FieldName = 'RG_IE'
      Origin = 'RG_IE'
      Size = 15
    end
    object qryClientesLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryClientesCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryClientesCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryClientesBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryClientesCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 72
    end
    object qryClientesSIGLA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryClientesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 400
    end
    object qryClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 250
    end
    object qryClientesFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 15
    end
    object qryClientesFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 15
    end
    object qryClientesID_EXTERNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_EXTERNO'
      Origin = 'ID_EXTERNO'
      ProviderFlags = []
      Size = 12
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 352
    Top = 152
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 200
    object cdsClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsClientesRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 100
    end
    object cdsClientesCPF_CNPJ: TStringField
      DisplayWidth = 18
      FieldName = 'CPF_CNPJ'
      Size = 18
    end
    object cdsClientesRG_IE: TStringField
      FieldName = 'RG_IE'
      Size = 30
    end
    object cdsClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 100
    end
    object cdsClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsClientesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 500
    end
    object cdsClientesEMAILS: TStringField
      FieldName = 'EMAILS'
      Size = 150
    end
    object cdsClientesFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object cdsClientesFONE2: TStringField
      FieldName = 'FONE2'
      Size = 15
    end
    object cdsClientesID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
    object cdsClientesENVIOU: TStringField
      FieldName = 'ENVIOU'
      Size = 1
    end
  end
  object dsCli: TDataSource
    DataSet = cdsClientes
    OnDataChange = dsCliDataChange
    Left = 352
    Top = 248
  end
  object qryTransportadoras: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select p.codigo, p.razao, c.nome cidade, est.sigla, p.fone1, p.f' +
        'one2, rti.id_externo'
      '    from pessoas p'
      
        '    inner join enderecos             e    on (e.codpessoa = p.co' +
        'digo)'
      
        '    inner join cidades               c    on (c.codibge = e.codc' +
        'idade)'
      
        '    inner join estados               est  on (est.codigo = c.cod' +
        'est)'
      
        '    left join relacao_tab_importacao rti  on ((rti.id_erp = p.co' +
        'digo)and(rti.tabela_erp = '#39'PESSOAS'#39'))'
      'WHERE P.tipo = '#39'T'#39)
    Left = 424
    Top = 104
    object qryTransportadorasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTransportadorasRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 60
    end
    object qryTransportadorasCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 72
    end
    object qryTransportadorasSIGLA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryTransportadorasFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 15
    end
    object qryTransportadorasFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 15
    end
    object qryTransportadorasID_EXTERNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_EXTERNO'
      Origin = 'ID_EXTERNO'
      ProviderFlags = []
      Size = 12
    end
  end
  object dsTransportadoras: TDataSource
    DataSet = qryTransportadoras
    Left = 424
    Top = 152
  end
  object cdsTransportadoras: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 200
    object cdsTransportadorasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsTransportadorasRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 100
    end
    object cdsTransportadorasCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsTransportadorasUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsTransportadorasFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object cdsTransportadorasFONE2: TStringField
      FieldName = 'FONE2'
      Size = 15
    end
    object cdsTransportadorasID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
    object cdsTransportadorasENVIOU: TStringField
      FieldName = 'ENVIOU'
      Size = 1
    end
  end
  object dsTransp: TDataSource
    DataSet = cdsTransportadoras
    OnDataChange = dsTranspDataChange
    Left = 424
    Top = 248
  end
  object qryFormasPgto: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'select fp.codigo, fp.descricao, RTI.id_externo from formas_pgto ' +
        'fp'
      
        '  left join relacao_tab_importacao rti  on ((rti.id_erp = fp.cod' +
        'igo)and(rti.tabela_erp = '#39'FORMAS_PGTO'#39'))')
    Left = 504
    Top = 104
    object qryFormasPgtoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFormasPgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryFormasPgtoID_EXTERNO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_EXTERNO'
      Origin = 'ID_EXTERNO'
      ProviderFlags = []
      Size = 12
    end
  end
  object dsFormasPgto: TDataSource
    DataSet = qryFormasPgto
    Left = 504
    Top = 152
  end
  object cdsFormasPgto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 200
    object cdsFormasPgtoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsFormasPgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsFormasPgtoID_EXTERNO: TStringField
      FieldName = 'ID_EXTERNO'
      Size = 15
    end
    object cdsFormasPgtoENVIOU: TStringField
      FieldName = 'ENVIOU'
      Size = 1
    end
  end
  object dsFPgto: TDataSource
    DataSet = cdsFormasPgto
    OnDataChange = dsFPgtoDataChange
    Left = 504
    Top = 248
  end
end
