inherited frmPesquisaTransportadora: TfrmPesquisaTransportadora
  Caption = 'Pesquisa de Transportadora'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgGeral: TPageControl
    ActivePage = tsConsulta
    inherited tsConsulta: TTabSheet
      inherited gridConsulta: TDBGridCBN
        SalvaConfiguracoes = False
      end
      inherited lblAjudaSelecionar: TStaticText
        ExplicitWidth = 696
      end
    end
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 696
      ExplicitHeight = 378
    end
  end
  inherited cds: TClientDataSet
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 40
    end
  end
end
