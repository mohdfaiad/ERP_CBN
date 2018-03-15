object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 179
  Width = 265
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Password=masterkey'
      'Port=3050'
      'Server=localhost'
      'User_Name=sysdba')
    FetchOptions.AssignedValues = [evCache]
    UpdateOptions.AssignedValues = [uvEDelete, uvEUpdate, uvUpdateChngFields, uvLockWait, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 40
    Top = 24
  end
  object qryGenerica2: TFDQuery
    Left = 184
    Top = 96
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection
    Left = 40
    Top = 96
  end
  object qryGenerica: TFDQuery
    Left = 184
    Top = 32
  end
end
