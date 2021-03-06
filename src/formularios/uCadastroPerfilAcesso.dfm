inherited frmCadastroPerfilAcesso: TfrmCadastroPerfilAcesso
  Left = 247
  Top = 61
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Perfis de Acesso'
  ClientHeight = 561
  ClientWidth = 822
  OldCreateOrder = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitWidth = 828
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 15
  object pagPerfis: TPageControl
    Left = 0
    Top = 0
    Width = 822
    Height = 518
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = '[ F1 ] Perfis Cadastrados'
      OnExit = TabSheet1Exit
      DesignSize = (
        814
        488)
      object gridPerfis: TDBGridCBN
        Left = 16
        Top = 16
        Width = 781
        Height = 454
        Hint = 
          'Pressione Ctrl + Alt + F2 para configurar as colunas'#13'Pressione C' +
          'trl + Alt + F3 para configurar as cores'#13'Pressione Ctrl + Alt + F' +
          '4 para configurar o tipo de busca'#13'Pressione Ctrl + Alt + F5 para' +
          ' recarregar o grid'
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 14803425
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
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
        TipoBusca.ListarApenasEncontrados = True
        TipoBusca.QualquerParte = True
        SalvaConfiguracoes = False
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 698
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = '[ F2 ] Permiss'#245'es do Perfil'
      ImageIndex = 2
      OnEnter = TabSheet4Enter
      object panBusca: TPanel
        Left = 0
        Top = 0
        Width = 814
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        OnClick = edtBuscaClick
        object Shape1: TShape
          Left = -8
          Top = 2
          Width = 681
          Height = 24
          Cursor = crHandPoint
          Brush.Color = 15000804
          Pen.Style = psClear
          OnMouseDown = Shape1MouseDown
        end
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 91
          Height = 13
          Caption = 'Buscando por >>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          OnClick = edtBuscaClick
        end
        object Label2: TLabel
          Left = 441
          Top = 4
          Width = 125
          Height = 13
          Caption = 'Resultados encontrados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          OnClick = edtBuscaClick
        end
        object edtBusca: TEdit
          Left = 106
          Top = 3
          Width = 319
          Height = 21
          Cursor = crHandPoint
          BorderStyle = bsNone
          Color = 15000804
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = edtBuscaClick
        end
        object edtEncontrados: TEdit
          Left = 571
          Top = 3
          Width = 43
          Height = 21
          BorderStyle = bsNone
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13369344
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object btProximo: TBitBtn
          Left = 616
          Top = 0
          Width = 73
          Height = 25
          Caption = 'Pr'#243'ximo'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFF9EBD5EEC67DE9B24CEAB54AEAB54AE9B24CEEC67DF7E6CAFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF8E7B05EEEC255F6D675F8E082F8
            DF83F8E084F9E183F6D776EEC255E7B05EFFFDFAFFFFFFFFFFFFFFFFFFFEFCF9
            EBC283F2D26DF7DC7ECD8015CD8015E2AC43F2D06EF3D06EF5D473F7DC7DF2D2
            6DE6B160FFFDFCFFFFFFFFFFFFDFA258F1CD64F4D470F6D46FD28926ECD2AACD
            8015FDE176F0CD6AF1CB66F1CB67F4D471F1CD64DFA258FFFFFFF3DDC8E4AD46
            F5D36BEEC55DF6D469D28926E9D9C4ECD2AACD8015FCDD6BF0C961EFC55DEFC5
            5DF5D36BE4AD46F1D9C2DFAB70EEC050F0C359ECBF54F3CC5DD38B1FF3E7D3FF
            FFFFECD2AAC26700F6CE5AF0C75BECC054F0C359EEC050DFAB70D28B3FF2CB62
            E9B245EAB74BEFC053D4881EEFDFC8FFFFFFFFFFFFECD2AAC66F03E8AE3BEDBD
            52E9B144F2CB62D28B41D0893DF8E190E8B041E8AA36ECB543D6881BF0E1CAFF
            FFFFFFFFFFFFFFFFF1E9E3C4732AE3A128EAB343F8E190CF873CC67C30F6DD88
            EBC876E8B84EE7AD33D47E0AF0E1C8FFFFFFFFFFFFFFFFFFF9F0E6CA7C2EE5AC
            3EEDCA76F5DD88C67C30C17637F4D477E9BF65EAC571ECC363DC9C32F3E6D3FF
            FFFFFFFFFFECD2AAD28C1FE7B753EECB75E8BF65F4D477C17637CC9167EBC97C
            ECC05EE7B754EABF60DC9C32F7EEE1FFFFFFECD1A5D9982BEABE5BEAC264E6B7
            54ECC05EEBC97CCC9167ECD8CDCB8E47F8E290E6B54FE3AE41E4AF44F9F6F3F0
            D4A6E0A52EE7B952E5B34BE4AF44E6B54EF8E290CB8E47ECD6CBFFFFFFB46B45
            E0B462F5E190E5B957E5B34AF0D4A6DFA127E1A731E1A936E3AE42E6BB5AF5E1
            8FE0B462B46B45FFFFFFFFFFFFFDFAF9C48A68DDAC56F7E186EED376E8C360E6
            BD5CE6BF5DE7C365EFD479F7E186DDAC56BB7A53FEFCFCFFFFFFFFFFFFFFFFFF
            FEFDFCAC6246BF782AE2B757F2D370F4D979F4D978F2D36FE2B757BF782AAC62
            46FEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEADAD4BC8162A45723AA
            5E22AA5E22A45723BC8162E2CBC4FFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 2
          OnClick = btProximoClick
        end
      end
      object panNomePerfil: TPanel
        Left = 0
        Top = 25
        Width = 814
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        OnClick = edtBuscaClick
        object Label3: TLabel
          Left = 8
          Top = 10
          Width = 82
          Height = 13
          Caption = 'Nome do perfil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtNomePerfil: TEdit
          Left = 98
          Top = 6
          Width = 319
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 11893790
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object pagFuncionalidades: TPageControl
        Left = 0
        Top = 56
        Width = 814
        Height = 417
        ActivePage = TabSheet2
        TabOrder = 2
        object TabSheet3: TTabSheet
          Caption = 'Permiss'#245'es B'#225'sicas'
          Enabled = False
          object chk1: TCheckBox
            Left = 8
            Top = 8
            Width = 129
            Height = 17
            Caption = 'Logar no sistema'
            TabOrder = 0
          end
          object chk3: TCheckBox
            Left = 8
            Top = 368
            Width = 136
            Height = 17
            Caption = 'Cadastrar usu'#225'rio'
            TabOrder = 1
          end
          object chk4: TCheckBox
            Left = 8
            Top = 32
            Width = 129
            Height = 17
            Caption = 'Cadastrar cliente'
            TabOrder = 2
          end
          object chk5: TCheckBox
            Left = 8
            Top = 56
            Width = 121
            Height = 17
            Caption = 'Cadastrar cor'
            TabOrder = 3
          end
          object chk6: TCheckBox
            Left = 8
            Top = 80
            Width = 145
            Height = 17
            Caption = 'Cadastrar empresa'
            TabOrder = 4
          end
          object chk7: TCheckBox
            Left = 8
            Top = 104
            Width = 209
            Height = 17
            Caption = 'Cadastrar forma de pagamento'
            TabOrder = 5
          end
          object chk8: TCheckBox
            Left = 8
            Top = 128
            Width = 161
            Height = 17
            Caption = 'Cadastrar fornecedor'
            TabOrder = 6
          end
          object chk9: TCheckBox
            Left = 8
            Top = 152
            Width = 145
            Height = 17
            Caption = 'Cadastrar grade'
            TabOrder = 7
          end
          object chk2: TCheckBox
            Left = 8
            Top = 224
            Width = 180
            Height = 17
            Caption = 'Cadastrar perfil de acesso'
            TabOrder = 8
          end
          object chk10: TCheckBox
            Left = 8
            Top = 248
            Width = 153
            Height = 17
            Caption = 'Cadastrar produto'
            TabOrder = 9
          end
          object chk11: TCheckBox
            Left = 8
            Top = 272
            Width = 172
            Height = 17
            Caption = 'Cadastrar representante'
            TabOrder = 10
          end
          object chk12: TCheckBox
            Left = 8
            Top = 296
            Width = 178
            Height = 17
            Caption = 'Cadastrar tabela de pre'#231'o'
            TabOrder = 11
          end
          object chk13: TCheckBox
            Left = 8
            Top = 320
            Width = 153
            Height = 17
            Caption = 'Cadastrar tamanho'
            TabOrder = 12
          end
          object chk14: TCheckBox
            Left = 8
            Top = 344
            Width = 180
            Height = 17
            Caption = 'Cadastrar transportadora'
            TabOrder = 13
          end
          object chk20: TCheckBox
            Left = 8
            Top = 176
            Width = 185
            Height = 17
            Caption = 'Cadastrar natureza de opera'#231#227'o'
            TabOrder = 14
          end
          object chk27: TCheckBox
            Left = 8
            Top = 200
            Width = 185
            Height = 17
            Caption = 'Cadastrar mat'#233'rias'
            TabOrder = 15
          end
          object chk28: TCheckBox
            Left = 272
            Top = 8
            Width = 136
            Height = 17
            Caption = 'Cadastrar contador'
            TabOrder = 16
          end
          object chk29: TCheckBox
            Left = 272
            Top = 32
            Width = 186
            Height = 17
            Caption = 'Cadastrar CFOP correspondente'
            TabOrder = 17
          end
          object chk54: TCheckBox
            Left = 272
            Top = 56
            Width = 186
            Height = 17
            Caption = 'Cadastrar cole'#231#227'o'
            TabOrder = 18
          end
          object chk55: TCheckBox
            Left = 272
            Top = 80
            Width = 186
            Height = 17
            Caption = 'Cadastrar Intervalo de produ'#231#227'o'
            TabOrder = 19
          end
          object chk64: TCheckBox
            Left = 272
            Top = 104
            Width = 186
            Height = 17
            Caption = 'Cadastrar contas banc'#225'rias'
            TabOrder = 20
          end
          object chk71: TCheckBox
            Left = 272
            Top = 128
            Width = 186
            Height = 17
            Caption = 'Cadastrar grupo do produto'
            TabOrder = 21
          end
          object chk72: TCheckBox
            Left = 272
            Top = 152
            Width = 186
            Height = 17
            Caption = 'Cadastrar cidade'
            TabOrder = 22
          end
          object chk73: TCheckBox
            Left = 272
            Top = 176
            Width = 186
            Height = 17
            Caption = 'Cadastrar NCM'
            TabOrder = 23
          end
          object chk76: TCheckBox
            Left = 272
            Top = 200
            Width = 186
            Height = 17
            Caption = 'Cadastrar Mapa Pedidos'
            TabOrder = 24
          end
          object chk82: TCheckBox
            Left = 272
            Top = 224
            Width = 226
            Height = 17
            Caption = 'Cadastrar configura'#231#245'es E-commerce'
            TabOrder = 25
          end
          object chk86: TCheckBox
            Left = 272
            Top = 248
            Width = 226
            Height = 17
            Caption = 'Cadastrar plano de contas cont'#225'beis'
            TabOrder = 26
          end
          object chk87: TCheckBox
            Left = 272
            Top = 272
            Width = 226
            Height = 17
            Caption = 'Cadastrar configura'#231#245'es Integra'#231#227'o'
            TabOrder = 27
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Permiss'#245'es Altera'#231#227'o/Cadastro'
          ImageIndex = 4
          object chk23: TCheckBox
            Left = 8
            Top = 8
            Width = 169
            Height = 17
            Caption = 'Alterar dados de usu'#225'rios'
            TabOrder = 0
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Permiss'#245'es Compra'
          ImageIndex = 5
          object chk30: TCheckBox
            Left = 8
            Top = 8
            Width = 169
            Height = 17
            Caption = 'Importar XML'
            TabOrder = 0
          end
          object chk46: TCheckBox
            Left = 8
            Top = 32
            Width = 206
            Height = 17
            Caption = 'Entrada manual estoque (Produto)'
            TabOrder = 1
          end
          object chk52: TCheckBox
            Left = 8
            Top = 56
            Width = 201
            Height = 17
            Caption = 'Sa'#237'da manual estoque (Produto)'
            TabOrder = 2
          end
          object chk58: TCheckBox
            Left = 8
            Top = 80
            Width = 185
            Height = 17
            Caption = 'Contas a pagar'
            TabOrder = 3
          end
          object chk63: TCheckBox
            Left = 8
            Top = 104
            Width = 185
            Height = 17
            Caption = 'Transfer'#234'ncia Estoque'
            TabOrder = 4
          end
          object chk77: TCheckBox
            Left = 8
            Top = 128
            Width = 185
            Height = 17
            Caption = 'Direcionar entradas produ'#231#227'o'
            TabOrder = 5
          end
          object chk79: TCheckBox
            Left = 8
            Top = 176
            Width = 201
            Height = 17
            Caption = 'Sa'#237'da manual estoque (Mat'#233'ria)'
            TabOrder = 6
          end
          object chk78: TCheckBox
            Left = 8
            Top = 152
            Width = 207
            Height = 17
            Caption = 'Entrada manual estoque (Mat'#233'ria)'
            TabOrder = 7
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Permiss'#245'es Venda'
          ImageIndex = 2
          object chk18: TCheckBox
            Left = 8
            Top = 8
            Width = 153
            Height = 17
            Caption = 'Criar pedido'
            TabOrder = 0
          end
          object chk19: TCheckBox
            Left = 8
            Top = 32
            Width = 185
            Height = 17
            Caption = 'Alterar pedido'
            TabOrder = 1
          end
          object chk21: TCheckBox
            Left = 8
            Top = 56
            Width = 209
            Height = 17
            Caption = 'Altera status aprova'#231#227'o pedido'
            TabOrder = 2
          end
          object chk26: TCheckBox
            Left = 8
            Top = 80
            Width = 209
            Height = 17
            Caption = 'Conferir pedido'
            TabOrder = 3
          end
          object chk31: TCheckBox
            Left = 8
            Top = 104
            Width = 209
            Height = 17
            Caption = 'Tela faturamento'
            TabOrder = 4
          end
          object chk32: TCheckBox
            Left = 8
            Top = 128
            Width = 209
            Height = 17
            Caption = 'Tela monitor controle NF-e'
            TabOrder = 5
          end
          object chk44: TCheckBox
            Left = 8
            Top = 152
            Width = 209
            Height = 17
            Caption = 'Tela configura'#231#227'o nota fiscal'
            TabOrder = 6
          end
          object chk47: TCheckBox
            Left = 8
            Top = 176
            Width = 185
            Height = 17
            Caption = 'Tela carta de corre'#231#227'o eletr'#244'nica'
            TabOrder = 7
          end
          object chk60: TCheckBox
            Left = 8
            Top = 200
            Width = 193
            Height = 17
            Caption = 'Visualizar confer'#234'ncia ( produ'#231#227'o )'
            TabOrder = 8
          end
          object chk62: TCheckBox
            Left = 8
            Top = 224
            Width = 193
            Height = 17
            Caption = 'Pedido consumidor final'
            TabOrder = 9
          end
          object chk67: TCheckBox
            Left = 8
            Top = 248
            Width = 209
            Height = 17
            Caption = 'Tela do caixa (Loja)'
            TabOrder = 10
          end
          object chk68: TCheckBox
            Left = 8
            Top = 272
            Width = 209
            Height = 17
            Caption = 'Entrada e saida de moeda'
            TabOrder = 11
          end
          object chk74: TCheckBox
            Left = 8
            Top = 296
            Width = 209
            Height = 17
            Caption = 'Tela de parcelamento'
            TabOrder = 12
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Permiss'#245'es Utilit'#225'rios'
          ImageIndex = 1
          object chk15: TCheckBox
            Left = 8
            Top = 8
            Width = 121
            Height = 17
            Caption = 'Fazer backup'
            TabOrder = 0
          end
          object chk16: TCheckBox
            Left = 8
            Top = 32
            Width = 178
            Height = 17
            Caption = 'Imprimir c'#243'digo de barras'
            TabOrder = 1
          end
          object chk17: TCheckBox
            Left = 8
            Top = 56
            Width = 212
            Height = 17
            Caption = 'Colocar sistema em manuten'#231#227'o'
            TabOrder = 2
          end
          object chk33: TCheckBox
            Left = 8
            Top = 80
            Width = 212
            Height = 17
            Caption = 'Impress'#227'o etiquetas caixa'
            TabOrder = 3
          end
          object chk34: TCheckBox
            Left = 8
            Top = 104
            Width = 212
            Height = 17
            Caption = 'Impress'#227'o etiquetas Coppel'
            TabOrder = 4
          end
          object chk35: TCheckBox
            Left = 8
            Top = 128
            Width = 212
            Height = 17
            Caption = 'Impress'#227'o etiquetas Picorrucho'
            TabOrder = 5
          end
          object chk36: TCheckBox
            Left = 8
            Top = 152
            Width = 212
            Height = 17
            Caption = 'Gerar sintegra'
            TabOrder = 6
          end
          object chk37: TCheckBox
            Left = 8
            Top = 176
            Width = 212
            Height = 17
            Caption = 'Gerar EFD Contribui'#231#245'es'
            TabOrder = 7
          end
          object chk38: TCheckBox
            Left = 8
            Top = 200
            Width = 212
            Height = 17
            Caption = 'Gerar EFD Fiscal'
            TabOrder = 8
          end
          object chk57: TCheckBox
            Left = 8
            Top = 224
            Width = 212
            Height = 17
            Caption = 'Importar Clientes Tricae'
            TabOrder = 9
          end
          object chk66: TCheckBox
            Left = 8
            Top = 248
            Width = 212
            Height = 17
            Caption = 'Importar Ordens de Servi'#231'o'
            TabOrder = 10
          end
          object chk83: TCheckBox
            Left = 8
            Top = 272
            Width = 212
            Height = 17
            Caption = 'Sincronizador pedidos Shoopub'
            TabOrder = 11
          end
          object chk84: TCheckBox
            Left = 8
            Top = 296
            Width = 212
            Height = 17
            Caption = 'Verificar erros importa'#231#227'o pedido'
            TabOrder = 12
          end
          object chk88: TCheckBox
            Left = 8
            Top = 320
            Width = 212
            Height = 17
            Caption = 'Sincronizador'
            TabOrder = 13
          end
          object ch89: TCheckBox
            Left = 8
            Top = 344
            Width = 212
            Height = 17
            Caption = 'Verificar or'#231'amentos pendentes'
            TabOrder = 14
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Permiss'#245'es Relat'#243'rios'
          ImageIndex = 3
          object chk22: TCheckBox
            Left = 8
            Top = 8
            Width = 209
            Height = 17
            Caption = 'Visualizar Raio X do representante'
            TabOrder = 0
          end
          object chk24: TCheckBox
            Left = 8
            Top = 32
            Width = 249
            Height = 17
            Caption = 'Visualizar Fecha Comiss'#227'o do Representante'
            TabOrder = 1
          end
          object chk25: TCheckBox
            Left = 8
            Top = 56
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Notas Fiscais de Venda'
            TabOrder = 2
          end
          object chk39: TCheckBox
            Left = 8
            Top = 80
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Clientes'
            TabOrder = 3
          end
          object chk40: TCheckBox
            Left = 8
            Top = 104
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Notas Fiscais de Entrada'
            TabOrder = 4
          end
          object chk41: TCheckBox
            Left = 8
            Top = 128
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Pedidos para Produ'#231#227'o'
            TabOrder = 5
          end
          object chk42: TCheckBox
            Left = 8
            Top = 152
            Width = 265
            Height = 17
            Caption = 'Visualizar Relat'#243'rio C'#243'd. Barras p/ Refer'#234'ncias'
            TabOrder = 6
          end
          object chk43: TCheckBox
            Left = 8
            Top = 176
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Vendas'
            TabOrder = 7
          end
          object chk45: TCheckBox
            Left = 8
            Top = 200
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Mapa de Refer'#234'ncias'
            TabOrder = 8
          end
          object chk48: TCheckBox
            Left = 8
            Top = 223
            Width = 249
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Totalizar Estoque'
            TabOrder = 9
          end
          object chk49: TCheckBox
            Left = 8
            Top = 246
            Width = 313
            Height = 17
            Caption = 'Informar Tabela de Pre'#231'o no Relat'#243'rio Totalizar Estoque'
            TabOrder = 10
          end
          object chk50: TCheckBox
            Left = 8
            Top = 270
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Pedidos N'#227'o Faturados'
            TabOrder = 11
          end
          object chk51: TCheckBox
            Left = 9
            Top = 294
            Width = 313
            Height = 17
            Caption = 'Buscar e Imprimir Romaneios'
            TabOrder = 12
          end
          object chk53: TCheckBox
            Left = 9
            Top = 318
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Previs'#227'o de Estoque'
            TabOrder = 13
          end
          object chk56: TCheckBox
            Left = 9
            Top = 342
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Entradas'
            TabOrder = 14
          end
          object chk59: TCheckBox
            Left = 9
            Top = 366
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Contas a Pagar'
            TabOrder = 15
          end
          object chk61: TCheckBox
            Left = 385
            Top = 8
            Width = 313
            Height = 17
            Caption = 'Visualizar Pedidos e NF-es do Cliente'
            TabOrder = 16
          end
          object chk65: TCheckBox
            Left = 385
            Top = 32
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio de Pedidos (Loja)'
            TabOrder = 17
          end
          object chk69: TCheckBox
            Left = 385
            Top = 56
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio de Caixa (Loja)'
            TabOrder = 18
          end
          object chk70: TCheckBox
            Left = 385
            Top = 79
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio de Tabela'
            TabOrder = 19
          end
          object chk75: TCheckBox
            Left = 385
            Top = 103
            Width = 313
            Height = 17
            Caption = 'Visualizar Fecha Comiss'#227'o E-commerce'
            TabOrder = 20
          end
          object chk80: TCheckBox
            Left = 385
            Top = 127
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Entrada Sa'#237'da Mat'#233'ria'
            TabOrder = 21
          end
          object chk81: TCheckBox
            Left = 385
            Top = 151
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Estoque Mat'#233'ria'
            TabOrder = 22
          end
          object chk85: TCheckBox
            Left = 385
            Top = 175
            Width = 313
            Height = 17
            Caption = 'Visualizar Relat'#243'rio Pedidos Em Aberto'
            TabOrder = 23
          end
        end
      end
    end
  end
  object panBotoes: TPanel
    Left = 0
    Top = 518
    Width = 822
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnAlterar: TSpeedButton
      Left = 152
      Top = 7
      Width = 120
      Height = 30
      Caption = 'F4 - Alterar'
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00102F
        940026368C00C2D8F400BDD6F600E6E9F700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B000000
        3000000028005E74900059729200828593009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF008A92
        C300273984006BCEF90046AEF100215FC900B8BEE400FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B00262E
        5F0000002000076A9500004A8D0000006500545A80009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00C0C9
        E700B4D8F300E0FFFF0074E3FF001591E600054EC400B1BCE400FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B005C65
        830050748F007C9B9B00107F9B00002D8200000060004D5880009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00D0DB
        F100A7BAE500E1FFFF0014C3FB000189E4001279DC000E64CF00B7C2E800FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B006C77
        8D00435681007D9B9B00005F9700002580000015780000006B00535E84009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FBFB
        FB004966C50054FAFC0000EBFE0004C4FC001292E6001176DB00156AD200B0BB
        E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009797
        9700000261000096980000879A0000609800002E82000012770000066E004C57
        82009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FCFC
        FD00B1B7E300177BCE0024FFFF0000EAFC0002C5FC001192E6001077D900186E
        D200B3BFE800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009898
        99004D537F0000176A00009B9B000086980000619800002E820000137500000A
        6E004F5B84009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00AEAFE1002D84D30024FCFD0000E8FC0001C5FB001193E6001076
        D800196FD700B1BFEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B004A4B7D0000206F00009899000084980000619700002F82000012
        7400000B73004D5B86009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00AAA8E1003386D40024FAFB0000E7FB0002C5FB001191
        E6001073D8001771D600AFC6F100FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B0046447D0000227000009697000083970000619700002D
        8200000F7400000D72004B628D009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00ABABE2004B9EDD002CFFFC0000E5F90002C4
        FB001394E7000978E2000350BF00BBCBEA00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B0047477E00003A7900009B9800008195000060
        97000030830000147E0000005B00576786009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFADE50057A8E1002CFFFD0000E8
        FA0002D3FF000065C5008F95A0008EA1C300AFC1E900FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B004B49810000447D00009B99000084
        9600006F9B00000161002B313C002A3D5F004B5D85009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAB7E90056ABE30029FF
        FF0000BFD50087ABBC00F7EBD2005751C5000527DC00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B005653850000477F00009B
        9B00005B71002347580093876E0000006100000078009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9BCEE003C9A
        D50097E2CA00F4E7DA00423EBD000000EE000B21F100FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0055588A000036
        7100337E6600908376000000590000008A0000008D009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7C1
        EF008DA4D400649CCA000044F0000A21F800A7AFF600FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00535D
        8B00294070000038660000008C0000009400434B92009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00B0BDEB002988E3003096F600B3C7F800FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B004C59870000247F00003292004F6394009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      OnClick = btnAlterarClick
    end
    object btnIncluir: TSpeedButton
      Left = 15
      Top = 7
      Width = 120
      Height = 30
      Caption = 'F3 - Incluir'
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
        FB0021A93A001ED04E0022D5550021D3550003B82C0000A7120000A7120003B8
        2C0021D3550022D555001ED04E0021A93A00FBFDFB00FFFFFF009B9B9B009799
        970000450000006C000000710000006F00000054000000430000004300000054
        0000006F000000710000006C000000450000979997009B9B9B00FFFFFF004EB1
        5B001ECE4D0021D354001FCC4D000FCC450000AD1300FFFFFF00FFFFFF0000AD
        13000FCC45001FCC4D0021D354001ECE4D004EB15B00FFFFFF009B9B9B00004D
        0000006A0000006F00000068000000680000004900009B9B9B009B9B9B000049
        00000068000000680000006F0000006A0000004D00009B9B9B00BDDEBE0017BA
        3F0021DA5A001ECC510020D053000DC7420000BE2500FFFFFF00FFFFFF0000BE
        25000DC7420020D053001ECC510021DA5A0017BA3F00BDDEBE00597A5A000056
        00000076000000680000006C000000630000005A00009B9B9B009B9B9B00005A
        000000630000006C0000006800000076000000560000597A5A006ABC740017D1
        510020D45F000BCC4A0004CA430000C1330000BC2200FFFFFF00FFFFFF0000BD
        270000C23B0010CA4B000ECC4C0020D45F0017D151006ABC740006581000006D
        0000007000000068000000660000005D0000005800009B9B9B009B9B9B000059
        0000005E0000006600000068000000700000006D00000658100030A03F0033E6
        7A0000B62D0000AD130000AD130000AD130000AD1300FFFFFF00FFFFFF0000AD
        130000BD270000BD230000AD130000B62D0033E67A0030A14100003C00000082
        160000520000004900000049000000490000004900009B9B9B009B9B9B000049
        00000059000000590000004900000052000000821600003D000030A3430081FC
        C30000AF2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000AF210081FCC40030A14200003F00001D98
        5F00004B00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00004B00001D986000003D00002395370085FD
        CC002AC26200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF002AC2620085FDCC0023953500003100002199
        6800005E00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00005E0000219968000031000033933D007BFA
        C3003CD07D0071C780001EBF590021C05B000ABA4D00FFFFFF00FFFFFF0010BC
        510022C05C001EBF590071C780003CD07D007BFAC30033933D00002F00001796
        5F00006C19000D631C00005B0000005C0000005600009B9B9B009B9B9B000058
        0000005C0000005B00000D631C00006C190017965F00002F000067AB66008AE5
        B90065EAB00050DF970056DF9C0041DB8D0022C05C00FFFFFF00FFFFFF0022C0
        5C0049DC930056DF9C0050DF970065EAB0008AE5B90067AB6600034702002681
        550001864C00007B3300007B380000772900005C00009B9B9B009B9B9B00005C
        000000782F00007B3800007B330001864C002681550003470200B9D4B9004EB0
        6800AFFFEA005EE0A10056E19F0045DE970066D58900FFFFFF00FFFFFF0023C0
        5B0050E09E0056E19F005EE0A100AFFFEA004EB06800B9D4B90055705500004C
        04004B9B8600007C3D00007D3B00007A3300027125009B9B9B009B9B9B00005C
        0000007C3A00007D3B00007C3D004B9B8600004C040055705500FFFFFF004589
        45007BDCA800B6FFEF0076E5B50051DFA30066D58900FFFFFF00FFFFFF0024BF
        590056E2A80076E5B500B6FFEF007BDCA80045894500FFFFFF009B9B9B000025
        000017784400529B8B0012815100007B3F00027125009B9B9B009B9B9B00005B
        0000007E440012815100529B8B0017784400002500009B9B9B00FFFFFF00FAFD
        FA00157215006DD6A300B7FFF500AAF7E30070E0B00022C05C0022C05C0074E2
        B300ABF7E400B7FFF5006DD6A30015721500FAFDFA00FFFFFF009B9B9B009699
        9600000E000009723F00539B910046937F000C7C4C00005C0000005C0000107E
        4F0047938000539B910009723F00000E0000969996009B9B9B00FFFFFF00FFFF
        FF00F9FCF9004586450038A75E007FE1B800A9FFEC00B9FFFB00B9FFFB00A9FF
        EC007FE1B80038A75E0045864500F9FCF900FFFFFF00FFFFFF009B9B9B009B9B
        9B009598950000220000004300001B7D5400459B8800559B9700559B9700459B
        88001B7D54000043000000220000959895009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B7CEB70067A56700247D33002887380028873800247D
        330067A56700B7CEB700FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B00536A5300034103000019000000230000002300000019
        000003410300536A53009B9B9B009B9B9B009B9B9B009B9B9B00}
      NumGlyphs = 2
      OnClick = btnIncluirClick
    end
    object btnCancelar: TSpeedButton
      Left = 288
      Top = 7
      Width = 120
      Height = 30
      Caption = 'Cancelar'
      Enabled = False
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FFFFFF00DFDF
        F0009594CB00C6C6E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF002322BE007F7EBA00FFFFFF009B9B9B007B7B
        8C003130670062627C009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B0000005A001B1A56009B9B9B00ECECF4001410
        C100110EFF000B09DD00A5A5C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF006665B100110CFC007D7CAF00FFFFFF00888890000000
        5D0000009B000000790041415F009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B0002014D000000980019184B009B9B9B00B7B6DB00110F
        DF000E0CFC00100EFF00110FB600F4F4F700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00D2D2E2000D0CDC000D0BD600D6D6E600FFFFFF00535277000000
        7B000000980000009B0000005200909093009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B006E6E7E000000780000007200727282009B9B9B00C7C7E0002524
        D7000F0EFB000E0EEF000F0FFA007271BB00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F7F7FB001B19BF001313FF00201EA600FFFFFF00FFFFFF0063637C000000
        73000000970000008B00000096000E0D57009B9B9B009B9B9B009B9B9B009B9B
        9B009393970000005B0000009B00000042009B9B9B009B9B9B00FFFFFF003C3B
        B3002627FF00090AEE001214FA000F10DB00DDDDEE00FFFFFF00FFFFFF00FFFF
        FF004F4EC5001416FF001112E5009F9FCE00FFFFFF00FFFFFF009B9B9B000000
        4F0000009B0000008A00000096000000770079798A009B9B9B009B9B9B009B9B
        9B000000610000009B00000081003B3B6A009B9B9B009B9B9B00FFFFFF00E0E0
        F000272BC600252CFE000D0EEE00161CFE003232CC00FFFFFF00FFFFFF006969
        D600181DF900191EFE002121C000FFFFFF00FFFFFF00FFFFFF009B9B9B007C7C
        8C000000620000009A0000008A0000009A00000068009B9B9B009B9B9B000505
        72000000950000009A0000005C009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00ABAAE100393FE0002531FA00121CF6001B25F6009492E1008988E3001D26
        F7001E2BFF00151BE200C3C2E900FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B0047467D0000007C00000096000000920000009200302E7D0025247F000000
        930000009B0000007E005F5E85009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00726FD8004C57F6002839F8001B2DF7001F29EE002131F6002236
        F9001F2FF2006B68DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B000E0B740000009200000094000000930000008A00000092000000
        950000008E00070479009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00615FDC005261F500293CF600253AF800263AF7002638
        F6003C3ADE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B0000007800000091000000920000009400000093000000
        920000007A009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008B8BEC002939F1002F45F8002338F600253EF8001F28
        EA00E3E1FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B009B9B9B009B9B9B002727880000008D000000940000009200000094000000
        86007F7D97009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00FFFF
        FF00C1C0FA00353FF000314CF9002B46F800253FF6004E69F900536EF9002341
        F6004A4FF000F3F3FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9B9B009B9B
        9B005D5C960000008C0000009500000094000000920000059500000A95000000
        920000008C008F8F9A009B9B9B009B9B9B009B9B9B009B9B9B00F9F9FF005D60
        F400314CF6003656F8002F4AF600304FF600516EF9003D3FF200555CF4006B8A
        FA00385EF8002833F300D5D3FC00FFFFFF00FFFFFF00FFFFFF0095959B000000
        900000009200000094000000920000009200000A950000008E00000090000726
        96000000940000008F00716F98009B9B9B009B9B9B009B9B9B005A5FF5003B61
        F8003A5AF7003150F7003D5FF700637DFA004042F600E9E8FD00CAC8FB003F40
        F500778EFA006389FA002D45F5009696FA00FFFFFF00FFFFFF00000091000000
        9400000093000000930000009300001996000000920085849900666497000000
        9100132A96000025960000009100323296009B9B9B009B9B9B004755F8004F76
        F8003E61F8005679F8006279F9005955F700F7F6FF00FFFFFF00FFFFFF00F0EF
        FF00726DF700525AF8007F9CFA006B89FA005661F700D4D3FD00000094000012
        94000000940000159400001595000000930093929B009B9B9B009B9B9B008C8B
        9B000E099300000094001B3896000725960000009300706F99006462F600697B
        F9006C82F9005055F6008984F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00DBDAFD006561F6005455F7006B7EF8004A4FF700000092000517
        9500081E950000009200252095009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B00777699000100920000009300071A940000009300B9B7FB005353
        F6005C5FF7006763F600F5F5FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E4E3FE009E9BF9006566F6006D6CF700555397000000
        9200000093000300920091919B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B00807F9A003A3795000102920009089300}
      NumGlyphs = 2
      OnClick = btnCancelarClick
    end
    object btnSalvar: TSpeedButton
      Left = 424
      Top = 7
      Width = 120
      Height = 30
      Caption = 'Salvar'
      Enabled = False
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000C1761B00C275
        1900BD6B1300B9650400B9650400B9650400BA650400BA650400BA650400BA65
        0400BA650400BA650400BA650400BC690A00B96A1500C3791F005D1200005E11
        0000590700005501000055010000550100005601000056010000560100005601
        000056010000560100005601000058050000550600005F150000D5933D00EFB7
        3600CDC6C000E9F8FF00DBE5F600DBE8F800DBE8F800DBE8F900DBE8F800DAE7
        F800DBE7F800D8E4F500E9F6FF00CDC6C000EAA71400C0761D00712F00008B53
        000069625C0085949B0077819200778494007784940077849500778494007683
        9400778394007480910085929B0069625C00864300005C120000CD955100E8AE
        3C00DCD7D400ECE8E900ADA0A200A79B9E009E93950094898C008A8185008379
        7C007B727600685F6400ECE8E900DCD7D400E59E2000C77B250069310000844A
        00007873700088848500493C3E0043373A003A2F310030252800261D21001F15
        1800170E1200040000008884850078737000813A000063170000D0965300EAB4
        4700DCD7D400EFF0EF00DFDEDC00E1E0DF00E0DFDE00DFE0DD00E0DFDD00DFDE
        DD00DFE0DE00DBD9D900EDEDED00DCD7D400E7A62B00C9802B006C3200008650
        0000787370008B8C8B007B7A78007D7C7B007C7B7A007B7C79007C7B79007B7A
        79007B7C7A0077757500898989007873700083420000651C0000D49B5800EBB9
        5000DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
        7C007A717700655C6200ECE8E900DCD7D400E8AC3700CC853100703700008755
        0000787370008884850045393B0040353A00362D30002E242700251B21001E15
        1800160D13000100000088848500787370008448000068210000D69E5B00EDBD
        5A00DCD7D400FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EAB34000D08B3400723A00008959
        0000787370009B9B9B009B9A9A009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B0078737000864F00006C270000D9A45E00F0C2
        6300DCD7D400ECE8E900A99D9F00A4999E009A91940092888B00897F85008279
        7C007A717700655C6200ECE8E900DCD7D400EDB74900D2903A00754000008C5E
        0000787370008884850045393B0040353A00362D30002E242700251B21001E15
        1800160D1300010000008884850078737000895300006E2C0000D8A35C00F0C6
        6D00DCD7D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00DCD7D400EEBD5400D7963E00743F00008C62
        0900787370009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B00787370008A59000073320000DEAC6900F9D2
        8100C1975C009A7B600095775E0097795D0097795D0097795D0097795D009779
        5C0097795C0095775E009A7A5E00C19A6400F7CA6B00D99B44007A480500956E
        1D005D3300003617000031130000331500003315000033150000331500003315
        00003315000031130000361600005D3600009366070075370000DDAB6700F6D5
        8B00FFD05600C0A88700C8C5C900CEC6BF00CDC6C000CDC6C000CDC6BF00D6D0
        CA00D6D3D000CFCED400C0A88800FFD25D00F3CC7500DCA14800794703009271
        27009B6C00005C442300646165006A625B0069625C0069625C0069625B00726C
        6600726F6C006B6A70005C4424009B6E00008F681100783D0000DCA96600F6D9
        9300FBC85D00C2B4A200D7DEEB00DDDDDD00DCDDDE00DCDBDD00E7E8EA00C8BA
        A700A2969200C2B4A200C6BCA900FBCB6300F3D07E00E0A74C00784502009275
        2F00976400005E503E00737A87007979790078797A0078777900838486006456
        43003E322E005E503E0062584500976700008F6C1A007C430000E5B97300F6DA
        9700FBCC6200C8BAA700DDE0E900E1DFDD00E0DFDE00DFDDDC00EFF3F9009F88
        6F00E5AF47009E918900C7BDB200FDCF6A00F5D48400E3AC510081550F009276
        33009768000064564300797C85007D7B79007C7B7A007B7978008B8F95003B24
        0B00814B00003A2D250063594E00996B0600917020007F480000E9BC7500F8DD
        9E00FDCF6900CEC0AF00E3E7EF00E7E5E300E6E5E400E5E4E200F1F6FF00BAA3
        8600FFE87300B5AB9E00CAC0B800FFD26E00F9DA8E00E7B25B00855811009479
        3A00996B05006A5C4B007F838B0083817F008281800081807E008D929B00563F
        22009B840F0051473A00665C54009B6E0A0095762A00834E0000EAC07900F8E0
        9B00FBD16500D3C4AF00EAEEF600ECEBE800ECEBE900EBE9E600FBFFFF00A28E
        7800DEAF4F00A89C9500D1C7B900FFDA7800F5D88900E2A44200865C1500947C
        3700976D01006F604B00868A9200888784008887850087858200979B9B003E2A
        14007A4B0000443831006D6355009B761400917425007E400000ECC47E00FEF4
        D500FFE29000DCD7D400F5FFFF00F6FEFF00F6FEFF00F6FDFF00FFFFFF00DFDD
        DC00C8BAA700DFDDDC00E5E4E200FFDE8800E4AA4500FCF5EC0088601A009A90
        71009B7E2C0078737000919B9B00929A9B00929A9B0092999B009B9B9B007B79
        7800645643007B79780081807E009B7A24008046000098918800ECC68100F0CA
        8200F4CA7D00E8C78800EFCF9400EFD49800EDCF9200EED09200EED09300F2D3
        9600F7D79B00F6D69B00E6C48A00EBB55200FDF9F200FFFFFF0088621D008C66
        1E0090661900846324008B6B30008B703400896B2E008A6C2E008A6C2F008E6F
        32009373370092723700826026008751000099958E009B9B9B00}
      NumGlyphs = 2
      OnClick = btnSalvarClick
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 500
    Top = 56
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsACESSO: TStringField
      FieldName = 'ACESSO'
      Size = 1000
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 460
    Top = 56
  end
  object dsp: TDataSetProvider
    Left = 540
    Top = 56
  end
end
