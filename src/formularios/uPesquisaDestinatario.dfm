inherited frmPesquisaDestinatario: TfrmPesquisaDestinatario
  Caption = 'Pesquisa de Destinat'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgGeral: TPageControl
    inherited tsConsulta: TTabSheet
      inherited gridConsulta: TDBGridCBN
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME_RAZAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF_CNPJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG_IE'
            Visible = True
          end
          item
            Expanded = False
            Visible = False
          end>
      end
    end
  end
  inherited cds: TClientDataSet
    Left = 128
    object cdsNOME_RAZAO: TStringField
      DisplayLabel = 'Nome / Raz'#227'o Social'
      FieldName = 'NOME_RAZAO'
      Size = 40
    end
    object cdsCPF_CNPJ: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object cdsRG_IE: TStringField
      DisplayLabel = 'RG / IE'
      FieldName = 'RG_IE'
      Size = 15
    end
    object cdsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
end
