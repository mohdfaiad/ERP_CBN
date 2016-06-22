inherited frmPesquisaTransportadora: TfrmPesquisaTransportadora
  Caption = 'Pesquisa de Transportadora'
  PixelsPerInch = 96
  TextHeight = 13
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
